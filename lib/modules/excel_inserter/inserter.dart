import 'package:black_box/modules/excel_inserter/cubit/cubit.dart';
import 'package:black_box/modules/excel_inserter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExcelInserter extends StatefulWidget {
  const ExcelInserter({super.key});

  @override
  State<ExcelInserter> createState() => _ExcelInserterState();
}

class _ExcelInserterState extends State<ExcelInserter>
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExcelInserterCubit>(
      create: (BuildContext context) => ExcelInserterCubit(),
      child:  BlocConsumer<ExcelInserterCubit, ExcelInserterStates>(
        listener: (context, state){},
        builder: (context, state){
          return Scaffold(
        appBar: AppBar(
          title: Text('ادخال ملفات الـ Excel لقاعدة البيانات'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){ExcelInserterCubit.get(context).pickAndReadExcelFile(); },
                  child: Text('اختر ملف Excel', style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(iconColor: Colors.black,)
                ),
                SizedBox(height: 20),
                //Text(status),
              ],
            ),
          ),
        ),
        );
  },),
   );
  }
}