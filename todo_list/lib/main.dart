import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/homePage.dart';
import 'package:todo_list/model.dart';
import 'package:todo_list/themeData.dart';
import 'package:todo_list/themeScreen.dart';
import 'package:todo_list/wmtfirstProject.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: Colors.black,
              primaryColor: Colors.white,
              textTheme: const TextTheme(
                  bodyMedium: TextStyle(
                color: DarkThemeColors.secondaryText,
              )))
          : ThemeData.light(),
      debugShowCheckedModeBanner: true,
      home: const ThemeScreen(),
    );
  }
}
