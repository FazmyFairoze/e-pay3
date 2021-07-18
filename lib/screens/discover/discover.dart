import 'package:flutter/material.dart';
import 'package:e_pay/components/coustom_bottom_nav_bar.dart';
import 'package:e_pay/enums.dart';
import 'package:e_pay/screens/discover/components/catergories.dart';

class Discover extends StatelessWidget {
  static String routeName = "/discover";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Discover"),
      ),
      body: Container(
        child: Column(
          children: [Catergories()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.discover),
    );
  }
}
