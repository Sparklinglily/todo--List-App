import 'package:flutter/material.dart';

import 'package:todo_list/homePage.dart';
import 'package:todo_list/model.dart';
import 'package:todo_list/wmtfirstProject.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: TypedText(),
    );
  }
}
