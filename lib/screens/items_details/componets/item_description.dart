import 'package:flutter/material.dart';

class ItemsDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "jsakdhakjsdhsakjhdajk\n"),
        TextSpan(text: "jsakkjhdajk\n"),
        TextSpan(text: "jsakdhdsfdsfakjhdajk\n"),
        TextSpan(text: "price: 5000"),
      ])),
      color: Colors.grey[300],
    );
  }
}
