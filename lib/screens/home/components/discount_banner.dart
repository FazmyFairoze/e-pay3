import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrange[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: "Fazmy Fairoze\n",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            //TextSpan(text: "Welcome\n"),
            TextSpan(text: "Email Address: fazmy@gmail.com\n"),
            TextSpan(text: "Phone Number: +60102821772\n"),
            TextSpan(text: "NIC Number: 1911739423\n"),
            TextSpan(text: "Address: 114/8 aramaya road\n"),
            TextSpan(text: "TOTAl SPENT: Rs5000\n"),
          ],
        ),
      ),
    );
  }
}
