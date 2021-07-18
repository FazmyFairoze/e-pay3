import 'package:flutter/material.dart';
import 'package:e_pay/screens/items_details/componets/item_description.dart';

import '../../../size_config.dart';

class ItemsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(400)),
            ItemsDescription(),
          ],
        ),
      ),
    );
  }
}
