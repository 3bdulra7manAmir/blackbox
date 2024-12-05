// ignore_for_file: avoid_print, unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/models/barcode/generator.dart';
import 'package:black_box/models/dark_mode/cubit.dart';
import 'package:black_box/models/dark_mode/states.dart';
import 'package:black_box/modules/create_new_item/crt_nt_itm.dart';
import 'package:black_box/modules/excel_debugger/excel_debugger.dart';
import 'package:black_box/modules/dashboard/about_info.dart';
import 'package:black_box/modules/dashboard/dashboard.dart';
import 'package:black_box/modules/excel_inserter/inserter.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:black_box/modules/print/cubit/cubit.dart';
import 'package:black_box/modules/print/cubit/states.dart';
import 'package:black_box/modules/print/print.dart';
import 'package:black_box/modules/splash/welcome.dart';
import 'package:black_box/modules/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget defaultDrawer(BuildContext context)
{
  return SafeArea(
      child: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background2.jpg"),
                  fit: BoxFit.cover //BACKground IMAGE of the user Profile.
                  ),
            ),
            accountName: Text("Technological Militray College", //textAlign: TextAlign.right,
              style: TextStyle(
                color: Specs().cBlack,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 15,
              ),
            ),
            currentAccountPictureSize: const Size.square(85),
            currentAccountPicture: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage(
                    "assets/images/NewLogo.png") //USER Profile IMAGE.
                ),
            accountEmail: null,
          ),
          ListTile(
              title: const Text("الصفحة الرئيسية",textAlign: TextAlign.right,),
              leading: const Icon(Icons.home),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const Home()),);}
            ),
          ListTile(
              title: const Text("إضافة مستخدم",textAlign: TextAlign.right,),
              leading: const Icon(Icons.home),
              onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const UsersScreen()),);}
            ),
          ListTile(
              title: const Text(
                "إضافة صنف",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.admin_panel_settings_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminDashboard()),
                );
              }),
          BlocProvider<PrintCubit>(
        create: (BuildContext context) => PrintCubit(),
        child: BlocConsumer<PrintCubit, PrintStates>(
          listener: (context, state) {},
          builder: (context, state)
          => ListTile(
                title: const Text("طباعة", textAlign: TextAlign.right,),
                leading: const Icon(Icons.print),
                onTap: ()
                async {
                  Navigator.push(context, MaterialPageRoute( builder: (context) => const PrintScreen()),);
                  await PrintCubit.get(context).initalizeDataBase();
                  //await cubit.initializeDatabaseAndRows2(context);
                }
              )),),
          ListTile(
              title: const Text(
                "ملف Excel",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.insert_chart_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExcelViewer()),
                );
              }),
          ListTile(
              title: const Text(
                "قراءة ملف Excel",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.insert_chart_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ExcelInserter()),
                );
              }),
          ListTile(
              title: const Text(
                "إضافة صنف جديد",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.add_business),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddItemDashBoard()),
                );
              }),
          ListTile(
              title: const Text(
                " انشاء وقرأة الـ barcode",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.insert_chart_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BarcodeExample()),
                );
              }),                      
          ListTile(
            title: const Text(
              "Dark Mode",
              textAlign: TextAlign.right,
            ),
            leading: const Icon(Icons.dark_mode),
            onTap: () {
              BlocProvider.of<ThemeCubit>(context).toggleTheme();
              Navigator.of(context).pop(); // Close the drawer
            },
          ),
          ListTile(
              title: const Text(
                "حول البرنامج",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.campaign),
              onTap: () {
                showAlertDialog(context);
                //1
                //       showPopover(
                //   context: context,
                //   bodyBuilder: (context) => const ListItems(),
                //   onPop: () => print('Popover was popped!'),
                //   direction: PopoverDirection.bottom,
                //   width: 200,
                //   height: 400,
                //   arrowHeight: 15,
                //   arrowWidth: 30,
                // );
                //2
                //MaterialPageRoute(builder: (context) => const ItemsMenu());
                //3
                // showPopover(context: context, bodyBuilder: (context) => const ItemsMenu(),
                // width: 100,
                // height: 85,
              }),
          ListTile(
              title: const Text(
                "تسجيل خروج",
                textAlign: TextAlign.right,
              ),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcome()),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text("الكلية العسكرية التكنولوجية® ٢٠٢٤",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ]),
  ));
}
