
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PileItemWidget extends StatelessWidget {
  PileItemWidget({
    required this.numOfCoin,
    Key? key
  }) : super(key: key);
  int? numOfCoin;
  TextEditingController numInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Column(
        children: [
          coinList(numOfCoin!),
        ],
      ),
    );
  }

  Widget coinList(int quantity) {
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: quantity,
          itemBuilder: (context, int index) {
            return Image.asset(
              'assets/stick1.png',
              height: 60,
              width: 30,
            );
          }),
    );
    return ListView.builder(
      itemCount: quantity,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            'assets/stick2.png',
            height: 60,
            width: 30,
          );
        }
    );
  }

  Widget numInput(int min, int max) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        final number = int.tryParse(value);
        if (number != null) {
          final text = number.clamp(min, max).toString();
          final selection = TextSelection.collapsed(
            offset: text.length,
          );
          numInputController.value = TextEditingValue(
            text: text,
            selection: selection,
          );
        }
      },
    );
  }
}
