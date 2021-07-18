import 'package:flutter/material.dart';
import 'package:e_pay/screens/items_details/items_details_screen.dart';
import '../../../size_config.dart';
import 'package:e_pay/models/Product.dart';
import 'package:e_pay/screens/details/details_screen.dart';
import 'package:e_pay/screens/home/components/section_title.dart';

class ItemsAvailable extends StatelessWidget {
  //static String routeName = "/items_available";
  const ItemsAvailable({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(0)),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ItemsCard(
                  image: "assets/images/Image Banner 3.png",
                  category: "Samsung",
                  numOfBrands: 23,
                  press: () {
                    Navigator.pushNamed(context, ItemsDetailsScreen.routeName);
                  }),
              ItemsCard(
                image: "assets/images/Image Banner 3.png",
                category: "Apple",
                numOfBrands: 20,
                press: () {},
              ),
              ItemsCard(
                image: "assets/images/Image Banner 3.png",
                category: "dex",
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

class ItemsCard extends StatelessWidget {
  const ItemsCard({
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
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(350),
          height: getProportionateScreenWidth(50),
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
