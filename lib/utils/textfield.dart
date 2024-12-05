import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget defaultTextField({
  //String hintText = "",
  Widget? prefixIcon,
  Color? prefixIconColor,
  Widget? suffixIcon,
  Color? suffixIconColor,
  double? containerWidth,
  TextInputType? inputType,
  TextEditingController? textController,
  Function(String)? onSubmitted,
  TextInputFormatter? inputFormatters,

}) =>

SizedBox(
  width: containerWidth,
  //height: ,
  child: TextField(
    onSubmitted: onSubmitted,
    keyboardType: inputType,
    controller: textController,
    maxLines: 1,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      suffixIcon: suffixIcon,
      suffixIconColor: prefixIconColor,
      prefixIcon: prefixIcon,
      prefixIconColor: prefixIconColor,
    ),
    //expands: true,
  ),
);