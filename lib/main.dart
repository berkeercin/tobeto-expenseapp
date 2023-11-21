import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme1 = const ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.orange,
    error: Colors.red,
    onError: Colors.redAccent,
    background: Colors.white30,
    onBackground: Colors.blueGrey,
    onSurface: Colors.white,
    surface: Color.fromARGB(192, 255, 109, 64));
CardTheme cardTheme1 =
    const CardTheme(color: Color.fromARGB(192, 255, 109, 64));
TextTheme textTheme1 = const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    titleLarge: TextStyle(color: Colors.white));
void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme1,
          cardTheme: cardTheme1,
          textTheme: textTheme1),
      home: const MainPage()));
}
