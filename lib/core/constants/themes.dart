import 'package:chat_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: defalutColor),
    // hoverColor: Colors.pink.shade900,
    primarySwatch: defalutColor,
    iconTheme: const IconThemeData(color: Colors.grey),
    primaryColor: defalutColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defalutColor,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
        bodyMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(size: 35, color: defalutColor),
      titleSpacing: 20,
      iconTheme: IconThemeData(size: 35, color: defalutColor),
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 22,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.white,
        
        elevation: 40,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: defalutColor,
        selectedIconTheme: const IconThemeData(size: 40),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold)));
ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: defalutColor),
  hoverColor: Colors.green,
  iconTheme: const IconThemeData(color: Colors.white),
  primarySwatch: defalutColor,
  
  primaryColor: defalutColor,
  scaffoldBackgroundColor: const Color(0xff333439),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: defalutColor,
    foregroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18)),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    iconTheme: IconThemeData(size: 35, color: Colors.white),
    elevation: 0.0,
    backgroundColor: Color(0xff333439),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 22,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xff333439),
        statusBarIconBrightness: Brightness.light),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff333439),
      type: BottomNavigationBarType.fixed,
      elevation: 40,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: defalutColor,
      selectedIconTheme: IconThemeData(size: 40),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold)),
);
OutlineInputBorder textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(14),
  borderSide: const BorderSide(color: defalutColor),
);
