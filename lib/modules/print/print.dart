// ignore_for_file: unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/print/cubit/cubit.dart';
import 'package:black_box/modules/print/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {


  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<PrintCubit>(
        create: (BuildContext context) => PrintCubit(),
        child: BlocConsumer<PrintCubit, PrintStates>
        (
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                  child: Scaffold(
                appBar: defaultAppBar(appBarTitle: "صفحة الطباعة والتصدير", elevation: 3, appbarColor: Specs().cGray_400),
                body:  Padding(padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children:
                        [
                          // defaultButton(btnText: "تصدير بصيغة ملف PDF\n\t\t\t\t\tاكتشاف اعطال", btnColor: Specs().cBlue_400,btnFunction: (){}),
                          // const SizedBox(width: 50,),
                          defaultButton
                          (
                            btnText: "تصدير بصيغة Excel",
                            //btnColor: Specs().cBlue_400,
                            btnFunction: () async {print("inPrint Excel"); await PrintCubit.get(context).initializeDatabaseAndRows(context); await PrintCubit.get(context).exportToExcel(PrintCubit.get(context).rows);},
                          ),
                          const SizedBox(width: 50,),
                          defaultButton(
                            btnText: "تصدير بصيغة PDF",
                            //btnColor: Specs().cBlue_400,
                            btnFunction: (){print("inPrint PDF"); PrintCubit.get(context).exportToPDF();}
                          ),
                        ],
                      ),
                      // const SizedBox(height: 60,),
                      // Row(
                      //   children:
                      //   [
                      //     defaultButton(btnText: "\t\t\t\tExport As PDF\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400, btnFunction: (){}),
                      //     const SizedBox(width: 50,),
                      //     defaultButton(btnText: "\t\t\t\tتصدير بصيغة ملف Excel\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400,btnFunction: (){}),
                      //     const SizedBox(width: 50,),
                      //     defaultButton(btnText: "\t\t\t\tExport As DOCX\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400,btnFunction: (){}),
                      //   ],
                      // ),
                      const SizedBox(height: 60,),
                      Row(
                        children:
                        [
                          defaultButton
                          (
                            btnText: "Excel طباعة الان",
                            //btnColor: Specs().cBlue_400,
                            btnFunction: (){print("inPrint Excel"); PrintCubit.get(context).exportToExcel(PrintCubit.get(context).rows); PrintCubit.get(context).ExcelSheetPaperPrinter();},
                          ),
                        ],
                      ),

                      const SizedBox(height: 60,),
                      Row(
                        children:
                        [
                          defaultButton
                          (
                            btnText: "PDF طباعة الان",
                            //btnColor: Specs().cBlue_400,
                            btnFunction: (){print("inPrint PDF"); PrintCubit.get(context).exportToExcel(PrintCubit.get(context).rows); PrintCubit.get(context).ExcelSheetPaperPrinter();},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
            );
          }
        )
      );
  }
}
