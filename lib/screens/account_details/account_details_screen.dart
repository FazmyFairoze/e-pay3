import 'package:flutter/material.dart';
import 'package:e_pay/screens/account_details/componets/edit_payment_details_button.dart';
import 'package:e_pay/screens/account_details/componets/payments_details.dart';
import 'package:e_pay/screens/home/components/discount_banner.dart';
import 'package:e_pay/screens/account_details/componets/edit_account_details_button.dart';
import '../../size_config.dart';
import 'componets/edit_account_details_button.dart';

class AccountDetailsScreen extends StatelessWidget {
  static String routeName = "/accountDetailsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account details"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DiscountBanner(),
            //EditAccountDetailsButton(),
            //SizedBox(height: getProportionateScreenHeight(0)),
            PaymentDetails(),
            EditPaymentDetailsButton()
          ],
        ),
      ),
    );
  }
}
