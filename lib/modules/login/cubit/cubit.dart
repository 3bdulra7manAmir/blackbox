import 'package:black_box/modules/login/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:isar/isar.dart';


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(this.context) : super(Initial_Login_State());

  static LoginCubit get(context) => BlocProvider.of(context);
  
  Isar isar = DBinit.isar;
  static String? currentlyLoggedInUsername;

  final BuildContext? context;

bool _obscureText = true;
bool get obscureText => _obscureText;

// Method to toggle the obscureText state
void togglePasswordVisibility()
{
  _obscureText = !_obscureText;
  emit(Password_Visibility_Toggled()); // Emitting a state to notify listeners
}


//Checker Fun
//for sure it is required but to be passed to the usrnm_chk.dart file i made to not required.
Future<void> checker(String username, String password) async
{
  List<Control> user = await isar.controls.where().filter().userNameEqualTo("$username").findAll();
  if(user.isEmpty || password.isEmpty)
  {
    //print("$username \t $password in user or password is Empty Checker");
    emit(Show_Alert_Dialog_Empty_Username_Or_Password());
  }
  if(username != user[0].uName || password != user[0].uPassWord)
  {
    emit(Show_Alert_Dialog_Wrng_Username_Or_Password());
    showAlertDialogWrngUsernameOrPassword(context!);
  }
  else{
    if(user[0].uPassWord == password)
    {
      emit(Correct_Username_And_Password());
      //Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
      currentlyLoggedInUsername = user[0].uName;
      Navigator.pushReplacement(context!, MaterialPageRoute(builder: (context) => Home()),); //username is passed to be displayed in the home screen
    }
  }
}


//
Future<void> checkUsernameExists(BuildContext context, String userName) async
{
  final existingUsers = await isar.controls
      .where()
      .filter()
      .userNameEqualTo(userName) // Assuming there's a userName field
      .findAll();

  if (existingUsers.isNotEmpty) {
    return LoginCubit(context).showAlertDialogAlreadyTaken(context); //'Username has already been taken';
  } else {
    //return null; // Username is available
    //LoginChecker().checker(userName);
  }
}


//Alert Box of Wrong Username or Password
void showAlertDialogWrngUsernameOrPassword(BuildContext context)
{
  showDialog(
    context: context,
    builder: (BuildContext context)
    {
      return AlertDialog
      (
          title: const Text('خطأ!'),
          content: Container
          (
            height: 21,
            child: const Column(children: [Text('خطأ في اسم المستخدم او كلمة المرور.'),]),
          ),
          actions: <Widget>
          [
            GestureDetector
            (
              child: TextButton
              (
                child: Text('متابعة',style: TextStyle(color: Specs().cBlack),),
                        onPressed: ()
                        {
                          Navigator.of(context).pop();
                        },
                        
              ),
            ),
          ],
        );
      },
    );
}





//Alert Box of Wrong Username or Password
// void showAlertDialogEmptyUsernameOrPassword(BuildContext context)
// {
//   showDialog(
//     context: context,
//     builder: (BuildContext context)
//     {
//       return AlertDialog
//       (
//           title: const Text('خطأ!'),
//           content: Container
//           (
//             height: 21,
//             child: const Column(children: [Text('خطأ في اسم المستخدم او كلمة المرور..'),]),
//           ),
//           actions: <Widget>
//           [
//             GestureDetector
//             (
//               child: TextButton
//               (
//                 child: Text('متابعة',style: TextStyle(color: Specs().cBlack),),
//                         onPressed: ()
//                         {
//                           Navigator.of(context).pop();
//                         },
                        
//               ),
//             ),
//           ],
//         );
//       },
//     );
// }


//Alert Box of User Already Taken
void showAlertDialogAlreadyTaken(BuildContext context)
{
    showDialog(
      context: context,
      builder: (BuildContext context)
      {
        return AlertDialog
        (
          title: const Text('خطأ!'),
          content: Container
          (
            height: 21,
            child: const Column(children: [Text('اسم المستخدم تم استخدامه من قبل, الرجال اختيار اسم اخر.'),]),
          ),
          actions: <Widget>
          [
            TextButton
            (
              child: Text('متابعة',style: TextStyle(color: Specs().cBlack),),
              onPressed: ()
              {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}