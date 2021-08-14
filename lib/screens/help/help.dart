import 'package:e_pay/screens/help/email_sender.dart';
import 'package:flutter/material.dart';
import 'package:e_pay/components/coustom_bottom_nav_bar.dart';
import 'package:e_pay/enums.dart';

//import 'components/body.dart';

class HelpScreen extends StatelessWidget {
  static String routeName = "/email_sender";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help center"),
      ),
      body: EmailSender(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
