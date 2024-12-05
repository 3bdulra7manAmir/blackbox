// ignore_for_file: unused_local_variable, dead_code

import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_funs_str.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/excel_inserter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


Isar isar = DBinit.isar;

class ExcelInserterCubit extends Cubit<ExcelInserterStates>
{
ExcelInserterCubit() : super(Initialize_ExcelInserter_State());
static ExcelInserterCubit get(context) => BlocProvider.of(context);


// Pick The File using File Picker Method
Future<File?> pickExcelFile() async
{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx', 'xls'],
  );

  if (result != null && result.files.isNotEmpty)
  {
    return File(result.files.single.path!);
    emit(File_Picked_Success_State());
  }
  return null;
}



//  ============================================================== //



Future<void> pickAndReadExcelFile() async
{
  File? file = await pickExcelFile();

  if (file != null)
  {
    List<List<dynamic>> excelData = readExcel(file);
    parseExcelDataToStorage(excelData);
    emit(Excel_Inserted_State());
  } else
  {
    print('No file selected.');
  }
}


List<List<dynamic>> readExcel(File file)
{
  var bytes = file.readAsBytesSync();
  var excel = Excel.decodeBytes(bytes);

  List<List<dynamic>> rows = [];

  for (var table in excel.tables.keys)
  {
    var sheet = excel.tables[table];
    if (sheet != null)
    {
      for (var row in sheet.rows)
      {
        rows.add(row.map((cell) => cell?.value).toList());
      }
    }
  }
  emit(File_Read_State());
  return rows;
}



Future<void> parseExcelDataToStorage(List<List<dynamic>> excelData) async
{
  
  //int lastId = await DBopsStorage().getLastIdFromDatabase(); // Get the last ID in the database
  List<Items> storageItems = [];

  for (var row in excelData.skip(1)) // Skip header row
  { 
      //lastId++; // Increment the ID for each new entry
      Items storageItem = Items()
        ..id = int.tryParse(row[0].toString()) ?? 0 // Assign the new ID
        ..itemType = row[1].toString()
        ..brand = row[2].toString()
        ..serialNumber = row[3].toString()
        ..Places = row[4].toString();

      storageItems.add(storageItem);
  }

  await DBopsStorage().addItems(storageItems); // Insert the items into the database
  //emit(());
}



}