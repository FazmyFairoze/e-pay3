import 'package:flutter/material.dart';
import 'package:e_pay/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_pay/screens/edit_account_details_screen/edit_account_details_screen.dart';

import '../../../components/default_button.dart';

class EditPaymentDetailsButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultButton(
        press: () {
          Navigator.pushNamed(context, EditPaymentDetailsScreen.routeName);
        },
        text: "Edit Payment Details");
  }
}
