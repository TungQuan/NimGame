import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final double circleRadius = 80.0;
  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
            height: 100,
            color: Colors.grey[200],
            child: CupertinoSlidingSegmentedControl(
              padding: const EdgeInsets.all(10),
              groupValue: groupValue,
              thumbColor: CupertinoColors.activeGreen,
              onValueChanged: (int? groupValue) {
                setState(() {
                  this.groupValue = groupValue;
                });
              },
              children: {
                0: buildSegment('Player 1', 'assets/siunhanhuong.jpeg'),
                1: buildSegment('Player 2', 'assets/siunhanvang.jpeg'),
              },
            )),
      ),
    );
  }

  Widget buildSegment(String text, String avatarPath) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///Image Avatar
              Container(
                  width: circleRadius,
                  height: circleRadius,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(avatarPath),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 5.0),
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Center(
                      child: Icon(Icons.person),
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Lv 20',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
