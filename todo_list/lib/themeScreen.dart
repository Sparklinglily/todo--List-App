import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/themeData.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      final themeMode = themeProvider.themeMode;
      return Scaffold(
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
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    title: const Text(
                      'Device Settings',
                    ),
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: (selectedTheme) async {
                      await themeProvider.switchTheme(selectedTheme);
                    }),
                RadioListTile(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                    title: const Text('Light mode'),
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: (selectedTheme) async {
                      await themeProvider.switchTheme(selectedTheme);
                    }),
                RadioListTile(
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
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
