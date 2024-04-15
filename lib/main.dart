import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            height: 400,
            child: Container(
              color: Colors.blue[200],
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  style: IconButton.styleFrom(backgroundColor: Colors.pink[100]),
                  icon: const Icon(Icons.radio_button_checked),
                  onPressed: () {
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
