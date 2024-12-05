// ignore_for_file: dead_code

import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/excel_debugger/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


Isar isar = DBinit.isar;

class ExcelDebuggerCubit extends Cubit<ExcelDebuggerStates>
{
ExcelDebuggerCubit() : super(Initialize_ExcelDebugger_State());
static ExcelDebuggerCubit get(context) => BlocProvider.of(context);


  List<List<dynamic>> excelData = [];


Future<File?> pickExcelFile() async
{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['xlsx', 'xls'],
  );

  if (result != null && result.files.isNotEmpty)
  {
    return File(result.files.single.path!);
    emit(PickExcel_File_State());
  }
  return null;
}

void readExcel(File file)
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

  // Update the excelData list and emit a new state with the updated data
  excelData = rows;
  emit(ExcelDataLoadedState(excelData));
}


Future<void> pickAndReadExcelFile() async
{
  File? file = await pickExcelFile();

  if (file != null)
  {
    readExcel(file);
    emit(Excel_Inserted_State());
  } else
  {
    print('No file selected.');
  }
}


}