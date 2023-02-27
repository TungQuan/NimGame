
import 'package:flutter/material.dart';
import 'package:nimgamectu/screen/game_screen.dart';

class NimGame extends StatelessWidget {
  const NimGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Nim Game',
      home: GameScreen(),
    );
  }
}
