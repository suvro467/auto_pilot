import 'dart:io';

import 'package:auto_pilot/screens/home.dart';
import 'package:auto_pilot/screens/login_signup_screens/signup_screen.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:auto_pilot/shared/widgets/rounded_rectangular_shadow.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPlanScreen extends StatefulWidget {
  const ConfirmPlanScreen({Key? key}) : super(key: key);

  @override
  _ConfirmPlanScreenState createState() => _ConfirmPlanScreenState();
}

class _ConfirmPlanScreenState extends State<ConfirmPlanScreen> {
  bool _isObscure = true;
  List<Map<String, dynamic>> plans = [];

  @override
  void initState() {
    super.initState();
    plans = [
      {
        'name': 'Single User',
        'cost': 'Rs. 4000',
        'period': 'billed annually',
        'desc': 'This is the best plan for self-employed and freelancer'
      },
      {
        'name': 'Upto 10 Users',
        'cost': 'Rs. 500 / user / month',
        'period': 'billed annually',
        'desc':
            'This is the best plan for small organisations on the path to growth'
      },
      {
        'name': 'Upto 50 Users',
        'cost': 'Rs. 400 / user / month',
        'period': 'billed annually',
        'desc': 'Best plan for mid size companies working on business processes'
      },
      {
        'name': 'More than 50 Users',
        'cost': 'Rs. 300 / user / month',
        'period': 'billed annually',
        'desc':
            'Best plan for large organization working on streamlining their business processes'
      },
      {
        'name': '& Days Trial',
        'cost': 'Rs. 500',
        'period': 'billed One-Time',
        'desc':
            'Try out the application with upto 50 users before subscribing to any plan'
      },
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Globals.selectedAppLanguage = Globals.appLanguages[0];
    return WillPopScope(
      onWillPop: () {
        if (Platform.isAndroid)
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        /* Navigator.pop(context); //return data along with pop*/
        return new Future(() => false);
      },
      child: Material(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: 75.0,
                        margin: EdgeInsets.only(
                          top: 25,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Image(
                          image: AssetImage('assets/icons/logopng.png'),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 20,
                              top: 10,
                            ),
                            child: Text(
                              'Confirm Plan',
                              style: GoogleFonts.notoSerif(
                                fontSize: 18,
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () async {},
                                child: Container(
                                  child: CustomPaint(
                                    painter: RoundedRectangularShadowPainter(
                                        borderColor: MyAutoPilotStyles.appColor,
                                        shadowColor: Colors.black,
                                        borderWidth: 1,
                                        radius: 5,
                                        shadowWidth: 0.3),
                                    child: Container(
                                      //padding: EdgeInsets.all(20),

                                      height: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Single User',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs. 4000',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'billed annually',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                                child: Text(
                                                  'This is the best plan for self-employed and freelancer',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: CustomPaint(
                                    painter: RoundedRectangularShadowPainter(
                                        borderColor: MyAutoPilotStyles.appColor,
                                        shadowColor: Colors.black,
                                        borderWidth: 1,
                                        radius: 5,
                                        shadowWidth: 0.3),
                                    child: Container(
                                      //padding: EdgeInsets.all(20),

                                      height: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Upto 10 Users',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs. 500 / user / month',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'billed annually',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                                child: Text(
                                                  'This is the best plan for small organisations on the path to growth',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: CustomPaint(
                                    painter: RoundedRectangularShadowPainter(
                                        borderColor: MyAutoPilotStyles.appColor,
                                        shadowColor: Colors.black,
                                        borderWidth: 1,
                                        radius: 5,
                                        shadowWidth: 0.3),
                                    child: Container(
                                      //padding: EdgeInsets.all(20),

                                      height: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Upto 50 Users',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs. 400 / user /month',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'billed annually',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                                child: Text(
                                                  'Best plan for mid size companies working on business processes',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: CustomPaint(
                                    painter: RoundedRectangularShadowPainter(
                                        borderColor: MyAutoPilotStyles.appColor,
                                        shadowColor: Colors.black,
                                        borderWidth: 1,
                                        radius: 5,
                                        shadowWidth: 0.3),
                                    child: Container(
                                      //padding: EdgeInsets.all(20),

                                      height: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'More than 50 Users',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs. 300 / user / month',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'billed annually',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                                child: Text(
                                                  'Best plan for large organization working on streamlining their business processes',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  child: CustomPaint(
                                    painter: RoundedRectangularShadowPainter(
                                        borderColor: MyAutoPilotStyles.appColor,
                                        shadowColor: Colors.black,
                                        borderWidth: 1,
                                        radius: 5,
                                        shadowWidth: 0.3),
                                    child: Container(
                                      //padding: EdgeInsets.all(20),

                                      height: 160,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10.0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '7 Days Trial',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rs. 500',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'billed One-time',
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 14,
                                                  color: HexColor('#707070'),
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    40 /
                                                    100,
                                                child: Text(
                                                  'Try out the application with upto 50 users before subscribing to any plan',
                                                  overflow:
                                                      TextOverflow.visible,
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 12,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            // This is just a blank container to fit the remaining space.
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Compare Plan',
                                style: GoogleFonts.notoSerif(
                                  fontSize: 14,
                                  color: MyAutoPilotStyles.appColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Refund Policy',
                          style: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: MyAutoPilotStyles.appColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
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
