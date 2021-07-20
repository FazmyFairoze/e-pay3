//import 'dart:developer';
import 'package:e_pay/models/User.dart';
import 'package:e_pay/services/database.dart';
import 'package:e_pay/screens/home/home_screen.dart';
import 'package:e_pay/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:e_pay/components/custom_surfix_icon.dart';
import 'package:e_pay/components/default_button.dart';
import 'package:e_pay/components/form_error.dart';
import 'package:e_pay/screens/otp/otp_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  static final phoneNumberController = TextEditingController();
  static final nameContoller = TextEditingController();
  static final addressContoller = TextEditingController();
  static final nicController = TextEditingController();
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  String fullName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildNICFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              print(phoneNumber);
              if (_formKey.currentState.validate()) {
                //Navigator.pushNamed(context, OtpScreen.routeName);
                loginUser(
                    CompleteProfileForm.phoneNumberController.text, context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: CompleteProfileForm.addressContoller,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: CompleteProfileForm.phoneNumberController,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (newValue) {
        phoneNumber = CompleteProfileForm.phoneNumberController.text;
        if (newValue.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildNICFormField() {
    return TextFormField(
      controller: CompleteProfileForm.nicController,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "NIC",
        hintText: "Enter your NIC number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
      controller: CompleteProfileForm.nameContoller,
      //controller: phoneNumberController,
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name as per your NIC",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  static final _codeController = TextEditingController();
  Future<bool> loginUser(String phoneNumber, BuildContext context) async {
    //Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        //phoneNumber: '+94777118541',
        phoneNumber: CompleteProfileForm.phoneNumberController.text,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential(credential);

          User user = result.user;
          if (user != null) {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
        },
        verificationFailed: (Exception e) {
          print(e);
        },
        codeSent: (String verificationId, int forceResendingToken) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Please enter the OTP"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                        child: Text("Continue"),
                        onPressed: () async {
                          AuthCredential credential =
                              PhoneAuthProvider.credential(
                                  verificationId: verificationId,
                                  smsCode: _codeController.text.trim());
                          UserCredential result =
                              await _auth.signInWithCredential(credential);
                          User user = result.user;
                          if (user != null) {
                            Users.addData();
                            //AddUser(
                            //  CompleteProfileForm.nameContoller.text,
                            //CompleteProfileForm.addressContoller.text,
                            //CompleteProfileForm.nicController.text,
                            //CompleteProfileForm.phoneNumberController.text);
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } else {
                            print("error");
                          }
                        })
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }
}
