import 'package:flutter/material.dart';

class TypedText extends StatefulWidget {
  const TypedText({super.key});

  @override
  State<TypedText> createState() => _TypedTextState();
}

class _TypedTextState extends State<TypedText> {
  final TextEditingController textController = TextEditingController();
  String typedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, right: 10, left: 15),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Card(
                color: Color.fromARGB(255, 111, 245, 245),
                // margin: EdgeInsets.only(left: 10, right: 10),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(typedText),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (text) {
                setState(() {
                  typedText = text;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
