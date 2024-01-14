import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        // primary: Colors.grey[900]!,
        // secondary: Colors.grey[800]!
    )
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade400,
        // primary: Colors.grey[900]!,
        // secondary: Colors.grey[800]!
    )
);