
import 'dart:typed_data';

import 'package:isar/isar.dart';

part 'db.g.dart';


@Collection()
class New_Item
{
  Id id = Isar.autoIncrement;        // Automatically generated unique ID
  late String? itemName;
  late String? itemBrand;
  late String? itemPlace;
}

@Collection()                            //@Collection mean Creating a Table
class Items                             //Table name is the same as class name then table name is Items.
{
  Id item_ID = Isar.autoIncrement;     //ID Column

  String? sNumber;                    //SN Column
  String? svgDATA;                    // Store SVG as a String

  @ignore Uint8List? barcode_PNG;   // To store the barcode as PNG binary data
  List<int>? barcodePNG;            // Use List<int> to store PNG data
}

@Collection()
class Control
{
  Id id = Isar.autoIncrement;     //ID Column
  int? perM;                      //User Permissions Role

  String? uName;                  //User Column
  String? uPassWord;              //Password Column
}

@Collection()
class Watcher
{
  Id watcher_ID = Isar.autoIncrement; //ID Column

  int id_INT = Isar.autoIncrement;     //ID Column //Needed to be in int Type... for logical Reasons...
  String? systemLOG;                  //User System Log
}

