// ignore_for_file: unused_local_variable, dead_code

import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/models/log_saver/log_txt_saver.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:black_box/modules/login/cubit/cubit.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';



class CreateNewItemLogic
{

Isar isar = DBinit.isar;
var logger = Logger();


List<Map<String, dynamic>> logEntries = [];


// C R E A T - I N S E R T - A D D...
Future<void> new_Added_Item(Non_Offical_Items_List newItem) async
{
  //Save it to the DataBase
  isar.writeTxnSync(() => isar.non_Offical_Items_Lists.putSync(newItem));
  logger.i('New Added Item function called with id: ${newItem.id} \t ${newItem.NewItem_Name.toString()} \t ${newItem.NewItem_Brand.toString()} \t ${newItem.NewItem_Place.toString()} \t ${LoginCubit.currentlyLoggedInUsername ?? Home.defaultUserName} \t ${MyDateTimeClass.formattedDate}');
  logAndSave(Action: "NewAddedItem", id: newItem.id.toString(), itemType: newItem.NewItem_Name, brand: newItem.NewItem_Brand, serialNumber: newItem.NewItem_Place, username: LoginCubit.currentlyLoggedInUsername ?? Home.defaultUserName);
}


// D E L E T E
Future<void> new_Delete_Item(int id) async
{
  isar.writeTxnSync(() => isar.non_Offical_Items_Lists.deleteSync(id));
}


}