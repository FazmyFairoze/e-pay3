import 'package:flutter/material.dart';
import 'package:e_pay/components/coustom_bottom_nav_bar.dart';
import 'package:e_pay/enums.dart';
import 'package:e_pay/screens/discover/components/catergories.dart';
import 'package:e_pay/screens/items_available/components/itemAvailable.dart';

class ItemsAvailableScreen extends StatelessWidget {
  static String routeName = "/itemsAvailableScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Items Available"),
      ),
      body: Container(
        child: Column(
          children: [ItemsAvailable()],
        ),
      ),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.discover),
    );
  }
}
