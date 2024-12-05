abstract class ExcelDebuggerStates{}

class Initialize_ExcelDebugger_State extends ExcelDebuggerStates{}
class PickExcel_File_State extends ExcelDebuggerStates{}
class Excel_Inserted_State extends ExcelDebuggerStates{}

class ExcelDataLoadedState extends ExcelDebuggerStates
{
  final List<List<dynamic>> excelData;
  ExcelDataLoadedState(this.excelData);
}
