import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_pay/models/User.dart';
import 'package:e_pay/screens/complete_profile/components/complete_profile_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//FirebaseFirestore userData = FirebaseFirestore.instance;

class AddUser {
  //extends StatelessWidget {
  final String fullName;
  final String address;
  final String phoneNumber;
  final String nic;

  AddUser(this.fullName, this.address, this.nic, this.phoneNumber);

  @override
  //Widget build(BuildContext context) {
  // Create a CollectionReference called users that references the firestore collection

  Future<void> addUser() async {
    // Call the user's CollectionReference to add a new user
    //await User.addData();//{
    //'full_name':
    //  CompleteProfileForm.phoneNumberController.text, // John Doe
    //'address':
    //  CompleteProfileForm.addressContoller.text, // Stokes and Sons
    //'nic': CompleteProfileForm.nicController, // 42
    //'phone_number': CompleteProfileForm.phoneNumberController.text
    //})
    //.then((value) => print("User Added"))
    //.catchError((error) => print("Failed to add user: $error"));
  }
  //}
}
