import 'package:black_box/const/const.dart';
import 'package:flutter/material.dart';

Widget defaultButton({                //Constructor Calls These Parameters whenever The code is being compiled every time.
  required String btnText,            //Button Written TEXT.
  required Function()? btnFunction,   //Button Action.
  double? btnWidth,                   //Button Width.
  double? btnHeight,                  //Button Height.
  Color? btnColor,
  //required Decoration?          btnDecoration,
}) =>
    SizedBox(
        width:  Specs().btnWidth_150, //SizedBox not Button itself Width From a Custom Utilites Class.
        height: Specs().btnHeight_40, //SizedBox not Button itself Height From a Custom Utilites Class.
        //color:  Specs().cCyanRGB,   //SizedBox 

        child: MaterialButton(
          onPressed: btnFunction,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),),
          color: Colors.white, // Set the background color of the button.
          child: Text(//btnText.toUpperCase(), //UpperCase Converter
            btnText,
            style: TextStyle(color: btnColor),), // Adjust the padding as needed.
                              //Button Text Color To Black
                              
        ),
    );