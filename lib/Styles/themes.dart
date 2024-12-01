import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  dividerTheme: DividerThemeData(
    color: Colors.grey[200],
  ),
  inputDecorationTheme:  InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.white,
    ),
    labelStyle: TextStyle(
      color: Colors.white,
    ),
    prefixIconColor: Colors.white,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),

  ),
  scaffoldBackgroundColor: HexColor('333739'),

  textTheme:  TextTheme(
      bodySmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
        color: Colors.white,
      )
  ),
  appBarTheme: AppBarTheme(
      titleTextStyle:  TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme:  IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    elevation: 8.0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
);

ThemeData lightTheme =  ThemeData(
  dividerTheme: DividerThemeData(
    color: Colors.grey[400],
  ),
  primarySwatch: Colors.indigo,
  primaryColor: Colors.indigo,
  scaffoldBackgroundColor: Colors.white,
  textTheme:  TextTheme(
    bodySmall: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      color: Colors.black,
    ),
  ),
  appBarTheme:  AppBarTheme(
      titleSpacing: 16.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
  ),
  bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),

  //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //useMaterial3: true,
);