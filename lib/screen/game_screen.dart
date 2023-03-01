
import 'package:flutter/material.dart';
import 'package:nimgamectu/screen/player_screen.dart';

import '../widget/circular_fab_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nim Game'),
        ),
        body: Column(
          children: const [
            PlayerScreen()
          ],
        ),
      floatingActionButton: const CircularFabWidget(),
    );
  }
}
