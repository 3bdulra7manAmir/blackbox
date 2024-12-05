// ignore_for_file: dead_code

import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_funs_ctrl.dart';

import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/users/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';


Isar isar = DBinit.isar;

class UsersCubit extends Cubit<UsersStates>
{
UsersCubit() : super(InitialUsersState());
static UsersCubit get(context) => BlocProvider.of(context);


Future<void> addUser({
  String? userName,               //Type Column  //not required cause i may but it in a null value
  String? passWord,              //Brand Column  //not required cause i may but it in a null value
  int? role,              //Color Column  //not required cause i may but it in a null value
  String? systemLog,       //SN Column  //not required cause i may but it in a null value
})
async {
  final Users = Control()..
  uName = userName..
  uPassWord = passWord..
  perM = role;
  DBopsControl().addUser(Users);
  emit(AddUserState());  
}

//PART 1 FETCH
Future<List<Control>> fetchUsers(String userName) async
{
  //DBopsControl().fectchUsers();
  final allUsersInfo = await isar.controls
  .where()
  .findAll();
  return allUsersInfo;
}

//PART 2 FETCH
Future<String> printUserDetails({String? userName}) async
{
  final Users = await fetchUsers(userName!);
  final user = Users[0]; // Assuming you want the first item that matches
  String username = user.uName ?? '';
  String passWord = user.uPassWord ?? '';
  int permissions = user.perM!;
  return username + passWord + permissions.toString();
  // Now you can use these variables as needed
  emit(ReadUserState());  
}






//void update()


Future<void> delete({int? id}) async
{
  
  DBopsControl().deleteUser(id!);
  emit(DeleteUserState());  
}


}




