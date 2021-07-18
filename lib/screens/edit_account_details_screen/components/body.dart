import 'package:flutter/material.dart';
import 'package:e_pay/components/socal_card.dart';
import 'package:e_pay/constants.dart';
import 'package:e_pay/size_config.dart';

import 'edit_payment_details_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Edit Payment Details", style: headingStyle),

                SizedBox(height: SizeConfig.screenHeight * 0.08),
                EditPaymentDetailsForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
