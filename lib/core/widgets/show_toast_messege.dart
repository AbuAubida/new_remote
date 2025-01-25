import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToastMessage({required String message ,required bool isSuccessState}){
   Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor:isSuccessState? Colors.green:Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0);
}