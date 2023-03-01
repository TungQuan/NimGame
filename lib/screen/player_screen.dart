
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.amber,
      child: Row(
        children: [
          Flexible(
              child: Container(
                child: Column(
                  children: [

                  ],
                ),
              )
          ),
          Flexible(
              child: Container(
                color: Colors.green,
              )
          )
        ],
      ),
    );
  }
}
