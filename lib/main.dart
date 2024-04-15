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
              child: const AnimatedPositionedExample()
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() => _AnimatedPositionedExampleState();
}

enum Position {
  topRight,
  topLeft,
  bottomLeft,
  bottomRight,
}

abstract class PositionHelper {
  static Alignment getAlignment(Position position) {
    switch (position) {
      case Position.topRight:
        return Alignment.topRight;
      case Position.topLeft:
        return Alignment.topLeft;
      case Position.bottomRight:
        return Alignment.bottomRight;
      case Position.bottomLeft:
        return Alignment.bottomLeft;
      default:
        return Alignment.center;
    }
  }

  static Position getNextPosition(Position position) {
    const List<Position> positions = Position.values;
    final int index = positions.indexOf(position);
    final int nextIndex = (index + 1) % positions.length;
    return positions[nextIndex];
  }
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  Position position = Position.topRight;

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: PositionHelper.getAlignment(position),
      duration: const Duration(milliseconds: 500),
      child: IconButton(
        style: IconButton.styleFrom(backgroundColor: Colors.pink[100]),
        icon: const Icon(Icons.radio_button_checked),
        onPressed: () {
          setState(() {
            position = PositionHelper.getNextPosition(position);
          });
        },
      ),
    );
  }
}
