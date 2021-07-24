import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Globals {
  // Languages that can be selected
  static List<String> appLanguages = ['English', 'हिंदी', 'বাংলা'];

  // Selected Language
  static String selectedAppLanguage = appLanguages[0];

  // Validation message colour
  static Color validationColor = Color.fromRGBO(250, 74, 91, 1);

  // Check for valid email address
  static bool isEmail(String email) {
    // Null or empty string is invalid
    if (email.isEmpty) {
      return false;
    }

    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return false;
    }
    return true;
  }

  // Check for valid mobile number
  static bool isValidMobileNumber(String mobileNumber) {
    // Null or empty string is invalid
    if (mobileNumber.isEmpty) {
      return false;
    }
    const pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(mobileNumber)) {
      return false;
    }
    return true;
  }

  // Store user related information after login.
  static String userFirstName = '';

  static String userLastName = '';

  static String designation = '';

  // Base url of the APIs

}
