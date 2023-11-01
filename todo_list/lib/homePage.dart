import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();
  String typedText = '';

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 250,
                child: Card(
                  child: Text(typedText),
                  elevation: 1,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: textController,
                onChanged: (text) {
                  setState(() {
                    typedText = text;
                  });
                },
                decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 2))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
