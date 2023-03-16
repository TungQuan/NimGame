
import 'package:flutter/material.dart';

import '../widget/pile_item_widget.dart';

class PileScreen extends StatelessWidget {
  const PileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
        children: [
          PileItemWidget(numOfCoin: 6),
        ],
    );
  }
}
