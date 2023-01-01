
// base url : https://newsapi.org/
// method (url) = pathUrl : v2/top-headlines?
// queries : country=eg&category=business&apiKey=74c46aa019f2472a8f80a48776f97d95
// https://newsapi.org/v2/everything?q=tesla&apiKey=74c46aa019f2472a8f80a48776f97d95




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
const kPrimaryColor = Colors.blue;
 ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
          color: Colors.black
      ),
      titleSpacing: 20,
      systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ) ,
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
          color: Colors.black
      )
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: kPrimaryColor,
    elevation: 20,
  ),
  primarySwatch: kPrimaryColor,
) ;
 ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
          color: Colors.white
      ),
      titleSpacing: 20,
      systemOverlayStyle:SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light
      ) ,
      backgroundColor: HexColor('333739'),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: HexColor('333739'),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: const IconThemeData(
          color: Colors.white
      )
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: kPrimaryColor,
    elevation: 20,
  ),
  primarySwatch: kPrimaryColor,
);

 String token = '';