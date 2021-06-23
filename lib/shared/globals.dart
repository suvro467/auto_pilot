import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Globals {
  // Background common colour for the widgets in the app
  static Color appColor = HexColor('#82C4E2');

  // Languages that can be selected
  static List<String> appLanguages = ['English', 'हिंदी', 'বাংলা'];

  // Selected Language
  static String selectedAppLanguage = appLanguages[0];
}
