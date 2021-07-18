import 'package:flutter/material.dart';
import 'package:e_pay/components/custom_surfix_icon.dart';
import 'package:e_pay/components/default_button.dart';
import 'package:e_pay/components/form_error.dart';
import 'package:e_pay/screens/account_details/account_details_screen.dart';
import 'package:e_pay/screens/complete_profile/complete_profile_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class EditPaymentDetailsForm extends StatefulWidget {
  @override
  _EditPaymentDetailsFormState createState() => _EditPaymentDetailsFormState();
}

class _EditPaymentDetailsFormState extends State<EditPaymentDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  String cardNumber;
  String expiryDate;
  String cvc;
  bool remember = false;
  final List<String> errors = [];

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
          buildCardNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildExpiryDateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCVCFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, AccountDetailsScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildCVCFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => cvc = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && expiryDate == cvc) {
          removeError(error: kMatchPassError);
        }
        cvc = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((expiryDate != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "CVC",
        hintText: "Please enter cvc number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildExpiryDateFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => expiryDate = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        expiryDate = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "expiry date",
        hintText: "mm/yyyy",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildCardNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => cardNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Card Number",
        hintText: "Please enter your card number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
