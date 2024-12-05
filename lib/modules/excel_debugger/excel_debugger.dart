import 'package:black_box/modules/excel_debugger/cubit/cubit.dart';
import 'package:black_box/modules/excel_debugger/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExcelViewer extends StatefulWidget {
  @override
  _ExcelViewerState createState() => _ExcelViewerState();
}

class _ExcelViewerState extends State<ExcelViewer>
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExcelDebuggerCubit>(
        create: (BuildContext context) => ExcelDebuggerCubit(),
        child: BlocConsumer<ExcelDebuggerCubit, ExcelDebuggerStates>
        (
            listener: (context, state) {},
            builder: (context, state){
              return Scaffold(
                appBar: AppBar(
                  title: Text('رؤية بيانات ملف الـ Excel للتحق من صحتة'),
                ),
                body: ExcelDebuggerCubit.get(context).excelData.isEmpty
                    ? Center(
                        child: ElevatedButton(
                          onPressed: ExcelDebuggerCubit.get(context).pickAndReadExcelFile,
                          child: Text('اختر ملف Excel لقرأته', style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                        ),
                      )
                    : ListView.builder
                    (
                        itemCount:
                            ExcelDebuggerCubit.get(context).excelData.length,
                        itemBuilder: (context, index)
                        {
                          return ListTile(
                            title: Text(ExcelDebuggerCubit.get(context).excelData[index].join(', \t\t')),
                          );
                        },
                      ),
              );
            })
            );
  }
}
