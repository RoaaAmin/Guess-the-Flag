import 'package:flutter/material.dart';

const COLOR_PRIMARY = Color.fromRGBO(74, 138, 148, 10);
const COLOR_ACCENT = Color.fromRGBO(74, 138, 148, 10);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: COLOR_PRIMARY,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: COLOR_ACCENT),
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(74, 138, 148, 10),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold ),
      headline2: TextStyle( color: Colors.black38, fontSize: 25, ),
      bodyText2: TextStyle(color: Colors.green[300], fontSize: 23,),
      subtitle1: TextStyle( color: Colors.red[300], fontSize: 24,),
      subtitle2: TextStyle( color: Colors.black, fontSize: 17,),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
          color: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.teal,
      ),

    ),
    dialogBackgroundColor: Colors.white,
    scaffoldBackgroundColor: COLOR_PRIMARY,

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1))



);

//////////////////////////////////////////////////////////////////
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  hintColor: Colors.teal,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),


  appBarTheme: AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  textTheme: TextTheme(
//color: Color.fromRGBO(74, 138, 148, 88)
    headline1: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold ),
    headline2: TextStyle( color: Colors.white70, fontSize: 25, ),
    bodyText2: TextStyle(color: Colors.green[300], fontSize: 23,),
    subtitle1: TextStyle( color: Colors.red[300], fontSize: 24,),
    subtitle2: TextStyle( color: Colors.white, fontSize: 17,),
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17,
        color: Colors.white),
  ),
    textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
    primary: Colors.teal,
    ),

    ),
  //dialogBackgroundColor: Colors.black,
);
