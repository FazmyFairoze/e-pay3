//import 'dart.js';
//import 'dart:js';

//import 'dart:js';

//import 'dart:js';

import 'package:e_pay/screens/help/email_sender.dart';
import 'package:e_pay/screens/help/help.dart';
import 'package:e_pay/screens/qr/qr.dart';
import 'package:flutter/widgets.dart';
import 'package:e_pay/screens/cart/cart_screen.dart';
import 'package:e_pay/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_pay/screens/details/details_screen.dart';
import 'package:e_pay/screens/discover/discover.dart';
import 'package:e_pay/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_pay/screens/home/home_screen.dart';
import 'package:e_pay/screens/items_details/componets/items_details.dart';
import 'package:e_pay/screens/login_success/login_success_screen.dart';
import 'package:e_pay/screens/otp/otp_screen.dart';
import 'package:e_pay/screens/profile/profile_screen.dart';
import 'package:e_pay/screens/sign_in/sign_in_screen.dart';
import 'package:e_pay/screens/splash/splash_screen.dart';
import 'package:e_pay/screens/discover/discover.dart';
import 'package:e_pay/screens/qr/qr.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'package:e_pay/screens/items_details/items_details_screen.dart';
import 'package:e_pay/screens/items_available/components/items_available_screen.dart';
import 'package:e_pay/screens/account_details/account_details_screen.dart';
import 'package:e_pay/screens/edit_account_details_screen/edit_account_details_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Qr.routeName: (context) => Qr(),
  Discover.routeName: (context) => Discover(),
  ItemsAvailableScreen.routeName: (context) => ItemsAvailableScreen(),
  ItemsDetailsScreen.routeName: (context) => ItemsDetailsScreen(),
  AccountDetailsScreen.routeName: (context) => AccountDetailsScreen(),
  EditPaymentDetailsScreen.routeName: (context) => EditPaymentDetailsScreen(),
  HelpScreen.routeName: (context) => HelpScreen()
};
