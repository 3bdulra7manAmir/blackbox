// ignore_for_file: dead_code

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/print/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ffi/ffi.dart';
import 'dart:ffi';
import 'package:win32/win32.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:isar/isar.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:excel/excel.dart';


class PrintCubit extends Cubit<PrintStates>
{
  PrintCubit() : super(Initial_Print_State());

  //static PrintCubit get(context) => BlocProvider.of(context);
  static PrintCubit get(BuildContext context) => BlocProvider.of<PrintCubit>(context);

  Isar isar = DBinit.isar;
  List<Map<String, dynamic>> rows = []; // Define rows

//=========================================================================================================//


Future<void> initializeDatabaseAndRows(BuildContext context) async
{
    await initalizeDataBase(); // Populate rows first
    //print("initalizeDataBase DONE.");
    
    if (rows.isNotEmpty)
    {
      //await exportToExcel(rows); // Only call export if rows is not empty
      print("Data available to exported.");
      emit(Initial_DataBase_AndRows_State());
    } else
    {
      print("No data available to export.");
    }
}


//=========================================================================================================//  


Future<void> initalizeDataBase() async 
{
  final List<Items> items = await isar.items.where().findAll();
    rows = items.map((item)
    {
      return
      {
        'ID / الرقم التعريفي': toArabicNumber(item.item_ID),
        'الايقونه': item.itemType,
        'Type / النوع': item.brand,
        'SN / الرقم التسلسلي': item.serialNumber,
        'مكان التواجد': item.Places,
        // Add more fields as needed
      };
    }).toList();

print("Rows populated: ${rows.length}");
emit(Initial_DataBase_State());

}


Future<void> exportToExcel(List<Map<String, dynamic>> rows) async
{
    // This check ensures that the export happens only when there's data.
    if (rows.isEmpty)
    {
      print("No data available to export.");
      return;
    }

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Adding column headers
    List<String> columnHeaders = rows[0].keys.toList();
    sheetObject.appendRow(columnHeaders);

    // Adding rows
    for (var row in rows)
    {
      List<dynamic> dataRow = row.values.toList();
      sheetObject.appendRow(dataRow);
    }

    String dateAndTime = MyDateTimeClass().formattedDate;

    // Save the file
    final fileBytes = excel.save();
    print("Excel generated and saved to the application documents directory.");
    File("DB_Out_In_Date&Time_$dateAndTime.xlsx")
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    emit(Export_To_Excel_State());
  }


//=========================================================================================================//

  Future<List<Storage>> fetchData() async
  {
    return await isar.storages.where().findAll();
    emit(Fetch_Data_State());
  }

  Future<void> generatePDF(List<Storage> data) async
  {
    final pdf = pw.Document();

    // Load English and Arabic fonts
    final englishFontData = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    final englishFont = pw.Font.ttf(englishFontData);

    final arabicFontData = await rootBundle.load('assets/fonts/NotoSansArabic-Regular.ttf');
    final arabicFont = pw.Font.ttf(arabicFontData);

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context)
        {
          return pw.Directionality(
            textDirection: pw.TextDirection.rtl, // Set text direction to right-to-left
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: data.map((item) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('الرقم التعريفي: ${item.id}', style: pw.TextStyle(font: arabicFont)),
                    pw.Text('الايقونه: ${item.itemType}', style: pw.TextStyle(font: arabicFont)),
                    pw.Text('النوع: ${item.brand}', style: pw.TextStyle(font: englishFont)),
                    pw.Text('الرقم التسلسلي: ${item.serialNumber}', style: pw.TextStyle(font: englishFont)),
                    pw.Text('مكان التواجد: ${item.Places}', style: pw.TextStyle(font: arabicFont)),
                    pw.SizedBox(height: 10), // Add some space between items
                    // Example of English text
                    //pw.Text('Example of English text', style: pw.TextStyle(font: englishFont)),
                    pw.SizedBox(height: 10), // Add some space
                  ],
                );
              }).toList(),
            ),
          );
        },
      ),
    );

    // Create the output file path
    String dateTimeString = MyDateTimeClass().formattedDate;
    final filePath = 'Out.In Date&Time $dateTimeString.pdf';
    final file = File(filePath);

    // Save the PDF file
    await file.writeAsBytes(await pdf.save());
    emit(PDF_Generated());
  }

  void exportToPDF() async
  {
    print("in exportToPDF");
    final data = await fetchData();
    await generatePDF(data);
    print('PDF generated and saved to the application documents directory.');
    emit(PDF_Exported());
  }



//=========================================================================================================//

void printExcelFile(String filePath)
{
  final hwnd = GetConsoleWindow();
  final filePathPtr = filePath.toNativeUtf16();

  // Print the file
  //ShellExecute(hwnd, TEXT('print'), filePathPtr, nullptr, nullptr, SW_SHOWNORMAL); //OLD
  ShellExecute(hwnd, TEXT('print'), filePathPtr, nullptr, nullptr, SHOW_WINDOW_CMD.SW_SHOWNORMAL); //NEWER

  // Free memory
  calloc.free(filePathPtr);
  emit(Print_Excel_File_CMD_Command());
}

void ExcelSheetPaperPrinter()
{
  String DateandTime = MyDateTimeClass().formattedDate;
  printExcelFile('DB Out.In Date&Time $DateandTime.xlsx');
  emit(Excel_SheetPaper_Printer());
}



//=========================================================================================================//
}