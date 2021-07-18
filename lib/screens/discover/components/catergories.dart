//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:e_pay/models/Product.dart';
import 'package:e_pay/screens/details/details_screen.dart';
import 'package:e_pay/screens/home/components/section_title.dart';
import 'package:e_pay/screens/items_available/components/itemAvailable.dart';
import 'package:e_pay/screens/items_available/components/items_available_screen.dart';

import '../../../size_config.dart';

class Catergories extends StatelessWidget {
  const Catergories({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Padding(
        //padding:
        //  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        //child: SectionTitle(
        //title: "Catergories",
        //press: () {},
        // ),
        //),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CatergoriesCard(
                  image: "assets/images/Image Banner 2.png",
                  category: "Elctronics",
                  numOfBrands: 20,
                  press: () {
                    Navigator.pushNamed(
                        context, ItemsAvailableScreen.routeName);
                  }),
              CatergoriesCard(
                image: "assets/images/Image Banner 2.png",
                category: "Elctronics",
                numOfBrands: 20,
                press: () {},
              ),
              CatergoriesCard(
                image: "assets/images/Image Banner 2.png",
                category: "Elctronics",
                numOfBrands: 20,
                press: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CatergoriesCard extends StatelessWidget {
  const CatergoriesCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(350),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
