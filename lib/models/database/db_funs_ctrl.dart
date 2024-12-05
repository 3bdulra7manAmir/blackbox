import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/login/cubit/cubit.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

class DBopsControl
{

Isar isar = DBinit.isar;
var logger = Logger();



// C R E A T - I N S E R T - A D D...
Future<void> addUser(Control nUser) async
{
  //Save it to the DataBase
  isar.writeTxnSync(() => isar.controls.putSync(nUser));
  logger.i('addUSer called with id: ${nUser.id} \t ${nUser.uName.toString()} \t ${nUser.uPassWord.toString()} \t ${nUser.perM.toString()} \t  ${LoginCubit.currentlyLoggedInUsername} \t ${MyDateTimeClass.formattedDate}');
}

// R E A D
final List<Control> currentUsers = [];
Future<List<Control>> fectchUsers() async
{
  // fetch All items
  List<Control> fectchUsers = await isar.controls.where().findAll(); //returns all of em
  currentUsers.clear(); //Clear The items list
  currentUsers.addAll(fectchUsers); // fetch then add all of em into the list
  return fectchUsers;
}

// U P D A T E
Future<void> updateUser(int id, String newUser) async
{
  // fetch All Users
  final existingUser = await isar.controls.get(id); //
  
  if (existingUser != null){
    existingUser.uName = newUser;
    isar.writeTxnSync(() => isar.controls.putSync(existingUser));
  }
}

// D E L E T E
Future<void> deleteUser(int id) async
{
  isar.writeTxnSync(() => isar.controls.deleteSync(id));
}

}