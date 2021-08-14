import 'package:e_pay/screens/sign_up/components/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:e_pay/components/custom_surfix_icon.dart';
import 'package:e_pay/components/default_button.dart';
import 'package:e_pay/components/form_error.dart';
import 'package:e_pay/screens/complete_profile/complete_profile_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class EmailSender extends StatefulWidget {
  @override
  //static final emailController = TextEditingController();
  _EmailSenderState createState() => _EmailSenderState();
}

class _EmailSenderState extends State<EmailSender> {
  final _formKey = GlobalKey<FormState>();
  //static final TextEditingController emailController = TextEditingController();
  String email = "fazmy.fairoze@gmail.com";
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String subject;
  String message;
  //bool remember = false;
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
          //buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(100)),
          buildSubjectFormField(),
          SizedBox(height: getProportionateScreenHeight(50)),
          buildMessageFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                launchEmail(
                  subject: subjectController.text,
                  message: messageController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildMessageFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => message = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } //else if (value.isNotEmpty && password == conform_password) {
        //removeError(error: kMatchPassError);
        //}
        message = value;
      },
      validator: (value) {
        //if (value.isEmpty) {
        //  addError(error: kPassNullError);
        //  return "";
        //}
        return null;
      },
      decoration: InputDecoration(
        labelText: "Message",
        hintText: "Please enter the issues that need asssitance in",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Conversation.svg"),
      ),
    );
  }

  TextFormField buildSubjectFormField() {
    return TextFormField(
      obscureText: false,
      onSaved: (newValue) => subject = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        subject = value;
      },
      validator: (value) {
        //if (value.isEmpty) {
        //  addError(error: kPassNullError);
        //  return "";
        //}
        return null;
      },
      decoration: InputDecoration(
        labelText: "Subect",
        hintText: "Help!",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}

Future launchEmail({
  String email = 'fazmy.fairoze@gmail.com',
  String subject,
  String message,
}) async {
  final url =
      'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

  if (await canLaunch(url)) {
    await launch(url);
  }
}
