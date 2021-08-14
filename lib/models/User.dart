import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pay/screens/complete_profile/components/complete_profile_form.dart';
import 'package:e_pay/screens/sign_up/components/sign_up_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Users {
  static final String fullName = CompleteProfileForm.nameContoller.text;
  static final String address = CompleteProfileForm.addressContoller.text;
  static final String phoneNumber =
      CompleteProfileForm.phoneNumberController.text;
  static final String nic = CompleteProfileForm.nicController.text;
  static final String email = SignUpForm.emailController.text;
  //static final userRef =
  //  FirebaseFirestore.instance.collection('user').withConverter<User>(
  //      fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()),
  //    toFirestore: (user, _) => user.toJson(),
  //);
  //User({this.fullName, this.address, this.phoneNumber, this.nic});
  //User(String fullName, String address, String phoneNumber, String nic);
  Map user;
  static addData() {
    Map<String, dynamic> userData = {
      "fullName": fullName,
      "email": email,
      "address": address,
      "phoneNumber": phoneNumber,
      "nic": nic
    };
    CollectionReference user = FirebaseFirestore.instance.collection('user');
    user.add(userData);
  }

  //User.fromJson(Map<String, Object> json)
  //  : this(
  //    fullName: json['fullName'] as String,
  //  address: json['address'] as String,
  //phoneNumber: json['phoneNumber'] as String,
  //nic: json['nic'] as String,
  //);

  //Map<String, Object> toJson() {
  //return {
  //'fullName': fullName,
  //'address': address,
  //'phoneNumber': phoneNumber,
  //'nic': nic,
  //};
  //}
}
