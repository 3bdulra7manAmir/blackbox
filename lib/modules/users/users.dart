// ignore_for_file: unused_local_variable

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/users/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/button.dart';
import 'package:black_box/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'cubit/cubit.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {


final usernameController = TextEditingController();
final passwordController = TextEditingController();
final permissionsController = TextEditingController();

bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (BuildContext context) => UsersCubit(),
      child: BlocConsumer<UsersCubit, UsersStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: defaultAppBar(appBarTitle: "صفحة تسجيل المستخدمين", elevation: 3, appbarColor: Specs().cGray_400),
              drawer: defaultDrawer(context),
              body: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children:
                        [
                          Row(
                            children:
                            [
                              Text("ادخل اسم المستخدم:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, )),
                              SizedBox(width: 20,),
                              Container(
                                    width: 300,
                                    //height: ,
                                    child: TextField(
                                      onSubmitted: (value) { //value is not necessary just to complete the fun //to make Enter Key Works Fine.
                                      String username = usernameController.text;
                                      String password = passwordController.text;
                                      int role = int.parse(permissionsController.text);
                                    },
                                      controller: usernameController,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        labelText: 'اسم المستخدم',
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.account_circle)
                                      ),
                                    ),
                                  ),
                            ],
                              ),

                            SizedBox(height: 20,),

                          Row(
                            children: [
                              Padding(padding: EdgeInsets.only(right: 0),
                                child: Text("ادخل كلمة السر:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ),)),

                              SizedBox(width: 52,),

                              Container(
                                width: 300,
                                child: TextField(
                                        onSubmitted: (value) { //value is not necessary just to complete the fun //to make Enter Key Works Fine.
                                        String username = usernameController.text;
                                        String password = passwordController.text;
                                        int role = int.parse(permissionsController.text);
                                        },
                                        obscureText: _obscureText,
                                        controller: passwordController,
                                        keyboardType: TextInputType.none,
                                        decoration: InputDecoration(
                                            labelText: 'كلمة السر',
                                            border: const OutlineInputBorder(),
                                            prefixIcon: const Icon(Icons.password_rounded),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _obscureText
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _obscureText = !_obscureText;
                                                });
                                              },
                                            ),
                                          ),
                                      ),
                              ),
                            ],
                          ),  
                          SizedBox(height: 20,),

                          Row(children: [
                            Text("الصلحيات:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, )),
                              SizedBox(width: 89,),
                              Container(
                                    width: 300,
                                    //height: ,
                                    child: TextField(
                                      onSubmitted: (value) { //value is not necessary just to complete the fun //to make Enter Key Works Fine.
                                      String username = usernameController.text;
                                      String password = passwordController.text;
                                      int role = int.parse(permissionsController.text);
                                    },
                                      controller: permissionsController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>
                                      [
                                        //FilteringTextInputFormatter.digitsOnly, // Allows only digits
                                        FilteringTextInputFormatter.allow(RegExp(r'[01]')), // Allows only 1 or 0
                                        LengthLimitingTextInputFormatter(1), // Limits input length to 1 character
                                      ],
                                      decoration: const InputDecoration(
                                        labelText: 'ادخل 0 او 1 فقط',
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.account_balance)
                                      ),
                                    ),
                                  ),
                          ],
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.only(right: 155),
                            child: Row(
                              children: [
                                Text("أمين العهدة = 0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, )),
                                SizedBox(width: 30,),
                                Text("الظابط المسؤول = 1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, ))
                              ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Padding(
                            padding: EdgeInsets.only(right: 150),
                            child: defaultButton(btnText: "إدخال", btnFunction: (){UsersCubit.get(context).addUser
                        (
                          userName: usernameController.text,
                          passWord: passwordController.text,
                          role: int.parse(permissionsController.text),
                        );
                        usernameController.clear(); //clears the textfield text after inserted
                        passwordController.clear(); //clears the textfield text after inserted
                        permissionsController.clear(); //clears the textfield text after inserted
                        }, ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
