// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';


Widget defultDropDownMenu({
  required String dropdownValueDefultValue,
  required Icon dropDownMenuIcon,
  required dynamic onChangedFunction,
  required List<String>? wordsList,
  int? elevationValue,
  TextStyle? textStyle,
  Widget? underline,
  double? containerWidth,
  double? containerHeight,
}) =>

Container(
  width: containerWidth,
  height: containerHeight,
  child: DropdownButton<String>(
        value: dropdownValueDefultValue,
        icon: dropDownMenuIcon,
        elevation: elevationValue!,
        style: textStyle,
        underline: underline,
        onChanged: onChangedFunction,
        items: wordsList?.map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(value: value, child: Text(value),);}).toList(),
      ),
);


// Widget defaultDropdownButton({                //Constructor Calls These Parameters whenever The code is being compiled every time.
//   required String valueString,                 //DropDownMenu Default Choosen Value.
//   required String hintString,                  //DropDownMenu Action.
//   required Function()? dropDownMenuFunction,   //DropDownMenu Action.
//   required List<String> dropDownMenuWords,     //DropDownMenu Words.

//   //Color? btnColor,
//   //required Decoration?          btnDecoration,
// }) =>
//     SizedBox(
//         width:  Specs().btnWidth_150, //SizedBox not Button itself Width From a Custom Utilites Class.
//         height: Specs().btnHeight_40, //SizedBox not Button itself Height From a Custom Utilites Class.
//         //color:  Specs().cCyanRGB,

//       child: DropdownButton<String>(
//         value: valueString,
//         hint: Text(hintString),
//         style: const TextStyle(color: Colors.black),
//         elevation: 16,

//         onChanged: (String? value) {},

//         //".map" to convert Drop Down Menu List to Map.
//         items: dropDownMenuWords.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
