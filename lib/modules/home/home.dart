import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/modules/dashboard/cubit/cubit.dart';
import 'package:black_box/modules/login/cubit/cubit.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class Home extends StatefulWidget {
  static final String? defaultUserName = "رئيس فرع الحاسب الالي";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchQuery = '';
  List<Items> filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(
          appBarTitle: "اهلا بك: ${LoginCubit.currentlyLoggedInUsername ?? Home.defaultUserName}",
          elevation: 3,
          appbarColor: Specs().cGray_400,
        ),
        drawer: defaultDrawer(context),
        body: Align(
          alignment: Alignment.topRight,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  width: 450,
                  height: 70,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'البحث بواسطة الرقم التسلسلي',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Items>>(
                  future: isar.items.where().findAll(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      filteredItems = snapshot.data!.where((item) {
                        return item.serialNumber?.contains(searchQuery) ?? false;
                      }).toList();

                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Main DataTable for Storage items
                                DataTable(
                                  columns: const <DataColumn>[
                                    DataColumn(label: Text('الرقم التعريفي')),
                                    DataColumn(label: Text('الصنف')),
                                    DataColumn(label: Text('النوع')),
                                    DataColumn(label: Text('الرقم التسلسلي')),
                                    DataColumn(label: Text('مكان التواجد')),
                                  ],
                                  rows: filteredItems.map((Storage item) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text(toArabicNumber(item.id))),
                                      DataCell(Text(item.itemType ?? '')),
                                      DataCell(Text(item.brand ?? '')),
                                      DataCell(Text(item.serialNumber ?? '')),
                                      DataCell(Text(item.Places ?? '')),
                                    ],
                                  )).toList(),
                                ),
                                const SizedBox(width: 120),
                                // Column to hold Logo and additional DataTables
                                Column(
                                  children: [
                                    // Logo
                                    Container(
                                      width: 200,
                                      height: 200,
                                      child: Image.asset('assets/images/NewLogo.png'),
                                    ),
                                    SizedBox(height: 20),
                                    // Control Table
                                    FutureBuilder<List<Control>>(
                                      future: isar.controls.where().findAll(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text('Error: ${snapshot.error}');
                                        } else {
                                          return DataTable(
                                            columns: const <DataColumn>[
                                              DataColumn(label: Text('User ID')),
                                              DataColumn(label: Text('Username')),
                                              DataColumn(label: Text('Role')),
                                            ],
                                            rows: snapshot.data!.map((Control control) {
                                              return DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(control.id.toString())),
                                                  DataCell(Text(control.userName ?? '')),
                                                  DataCell(Text(control.role?.toString() ?? '')),
                                                ],
                                              );
                                            }).toList(),
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    // Watcher Table
                                    FutureBuilder<List<Watcher>>(
                                      future: isar.watchers.where().findAll(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text('Error: ${snapshot.error}');
                                        } else {
                                          return DataTable(
                                            columns: const <DataColumn>[
                                              DataColumn(label: Text('ID')),
                                              DataColumn(label: Text('System Log')),
                                            ],
                                            rows: snapshot.data!.map((Watcher watcher) {
                                              return DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(watcher.id.toString())),
                                                  DataCell(Text(watcher.systemLog ?? '')),
                                                ],
                                              );
                                            }).toList(),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
