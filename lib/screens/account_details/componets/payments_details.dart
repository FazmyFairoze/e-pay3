import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import '../../../size_config.dart';

class PaymentDetails extends StatelessWidget {
  const PaymentDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: "Payment Details\n",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            //TextSpan(text: "Welcome\n"),
            TextSpan(text: "Card Number: 3423-4343-45557\n"),
            TextSpan(text: "Expiry date: 12/3/34\n"),
          ],
        ),
      ),
    );
  }
}
