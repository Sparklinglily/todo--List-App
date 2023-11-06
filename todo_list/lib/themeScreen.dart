import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/themeData.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool firstValue = true;
  // bool secondValue = true;
  // bool thirdValue = true;

  // int? onClicked;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final themeMode = themeProvider.themeMode;
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 231, 231),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
              child: Text(
            'App Theme',
            style: TextStyle(),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                RadioListTile(
                    title: const Text(
                      'Device Settings',
                      style: TextStyle(color: Colors.black),
                    ),
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: (selectedTheme) async {
                      await themeProvider.switchTheme(selectedTheme);
                    }),
                RadioListTile(
                    title: const Text('Light mode'),
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: (selectedTheme) async {
                      await themeProvider.switchTheme(selectedTheme);
                    }),
                RadioListTile(
                    title: const Text('Dark mode'),
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: (selectedTheme) async {
                      await themeProvider.switchTheme(selectedTheme);
                    })
              ],
            ),
          ),
        ),
      );
    });
  }
}
