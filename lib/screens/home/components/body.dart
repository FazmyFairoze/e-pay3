import 'package:e_pay/screens/home/components/spending_comparision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
//import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'balance_available.dart';
//import 'balance_chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            //HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            //Graph(context),
            DiscountBanner(),
            PieChartSample1(),
            SpendingComparision(),
            //BalanceChart(),
            //Graph(context),
            //BalanceGraph(context),
            //Categories(),
            //SpecialOffers(),
            //SizedBox(height: getProportionateScreenWidth(30)),
            //PopularProducts(),
            //SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
