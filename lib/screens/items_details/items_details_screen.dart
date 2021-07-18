import 'package:flutter/material.dart';
import 'package:e_pay/components/coustom_bottom_nav_bar.dart';
import 'package:e_pay/enums.dart';
import 'package:e_pay/screens/discover/components/catergories.dart';
import 'package:e_pay/screens/items_details/componets/items_details.dart';

class ItemsDetailsScreen extends StatelessWidget {
  static String routeName = "/itemsDetailsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Details"),
      ),
      body: Container(
        child: Column(
          children: [ItemsDetails()],
        ),
      ),
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.discover),
    );
  }
}
