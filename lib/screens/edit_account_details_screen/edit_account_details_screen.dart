import 'package:flutter/material.dart';

import 'components/body.dart';

class EditPaymentDetailsScreen extends StatelessWidget {
  static String routeName = "/editPaymentDetailsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Payment Details"),
      ),
      body: Body(),
    );
  }
}
