import 'package:e_pay/screens/complete_profile/components/complete_profile_form.dart';
import 'package:e_pay/screens/sign_up/components/sign_up_form.dart';
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
              text: CompleteProfileForm.nameContoller.text + "\n",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
            //TextSpan(text: "Welcome\n"),
            TextSpan(
                text:
                    "Email Address: " + SignUpForm.emailController.text + "\n"),
            TextSpan(
                text: "Phone Number: " +
                    CompleteProfileForm.phoneNumberController.text +
                    "\n"),
            TextSpan(
                text: "NIC Number: " +
                    CompleteProfileForm.nicController.text +
                    "\n"),
            TextSpan(
                text: "Address: " +
                    CompleteProfileForm.addressContoller.text +
                    "\n"),
            //TextSpan(text: "TOTAl SPENT: Rs5000 \n"),
          ],
        ),
      ),
    );
  }
}
