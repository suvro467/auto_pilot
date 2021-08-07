import 'dart:io';

import 'package:auto_pilot/screens/login_signup_screens/payment.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/rounded_rectangular_shadow.dart';
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
  int planNumberSelected = 0;

  @override
  void initState() {
    super.initState();
    plans = [
      {
        'name': 'Single User',
        'cost': 'Rs. 4000',
        'period': 'billed annually',
        'desc': 'This is the best plan for self-employed and freelancer',
        'text1': 'Ease of design and implementation at speed with high ROI',
        'text2': 'Solutions for any size company or industry',
        'text3':
            'Connect sales, service, marketing, commerce and IT, personalize experiences',
      },
      {
        'name': 'Upto 10 Users',
        'cost': 'Rs. 500 / user / month',
        'period': 'billed annually',
        'desc':
            'This is the best plan for small organisations on the path to growth',
        'text1': 'Ease of design and implementation at speed with high ROI',
        'text2': 'Solutions for any size company or industry',
        'text3':
            'Connect sales, service, marketing, commerce and IT, personalize experiences',
      },
      {
        'name': 'Upto 50 Users',
        'cost': 'Rs. 400 / user / month',
        'period': 'billed annually',
        'desc':
            'Best plan for mid size companies working on business processes',
        'text1': 'Ease of design and implementation at speed with high ROI',
        'text2': 'Solutions for any size company or industry',
        'text3':
            'Connect sales, service, marketing, commerce and IT, personalize experiences',
      },
      {
        'name': 'More than 50 Users',
        'cost': 'Rs. 300 / user / month',
        'period': 'billed annually',
        'desc':
            'Best plan for large organization working on streamlining their business processes',
        'text1': 'Ease of design and implementation at speed with high ROI',
        'text2': 'Solutions for any size company or industry',
        'text3':
            'Connect sales, service, marketing, commerce and IT, personalize experiences',
      },
      {
        'name': '7 Days Trial',
        'cost': 'Rs. 500',
        'period': 'billed One-Time',
        'desc':
            'Try out the application with upto 50 users before subscribing to any plan',
        'text1': 'Ease of design and implementation at speed with high ROI',
        'text2': 'Solutions for any size company or industry',
        'text3':
            'Connect sales, service, marketing, commerce and IT, personalize experiences',
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
                                onTap: () async {
                                  planNumberSelected = 1;
                                  var result =
                                      goToPaymentScreen(planNumberSelected);
                                },
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
                                onTap: () async {
                                  planNumberSelected = 2;
                                  var result =
                                      goToPaymentScreen(planNumberSelected);
                                },
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
                                onTap: () async {
                                  planNumberSelected = 3;
                                  var result =
                                      goToPaymentScreen(planNumberSelected);
                                },
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
                                onTap: () async {
                                  planNumberSelected = 4;
                                  var result =
                                      goToPaymentScreen(planNumberSelected);
                                },
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
                                onTap: () async {
                                  planNumberSelected = 5;
                                  var result =
                                      goToPaymentScreen(planNumberSelected);
                                },
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

  Future<dynamic> goToPaymentScreen(int selectedPlanNumber) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  Size(
                    MediaQuery.of(context).size.width * 90 / 100,
                    580,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 30,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              plans[0]['name'],
                              style: GoogleFonts.notoSerif(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: MyAutoPilotStyles.appColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              plans[0]['cost'],
                              style: GoogleFonts.notoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#707070'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          //top: 40,
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Text(
                              plans[0]['period'],
                              style: GoogleFonts.notoSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: HexColor('#707070'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 30,
                          right: 30,
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                child: Text(
                                  plans[0]['desc'],
                                  style: GoogleFonts.notoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor('#707070'),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 30,
                          right: 30,
                        ),
                        child: Card(
                          color: HexColor('#075A80'),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            height: 105,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/all business.svg',
                                      color: Colors.white,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 40,
                                      width: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Business',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Ready',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/quick set-up.svg',
                                      color: Colors.white,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 40,
                                      width: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Quick',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Set-Up',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/Boost Efficiency.svg',
                                      color: Colors.white,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 40,
                                      width: 40,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Outcome',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Driven',
                                      style: GoogleFonts.notoSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Stack(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 50,
                                  right: 30,
                                  top: 20,
                                ),
                                child: Text(
                                  plans[0]['text1'],
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor('#707070'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 20,
                          child: Text(
                            '1',
                            style: GoogleFonts.notoSerif(
                              fontSize: 36,
                              color: MyAutoPilotStyles.appColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                      Stack(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 50,
                                  right: 30,
                                  top: 20,
                                ),
                                child: Text(
                                  plans[0]['text2'],
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor('#707070'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 20,
                          child: Text(
                            '2',
                            style: GoogleFonts.notoSerif(
                              fontSize: 36,
                              color: MyAutoPilotStyles.appColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
                      Stack(children: [
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 50,
                                  right: 30,
                                  top: 20,
                                ),
                                child: Text(
                                  plans[0]['text3'],
                                  style: GoogleFonts.notoSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: HexColor('#707070'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          left: 20,
                          child: Text(
                            '3',
                            style: GoogleFonts.notoSerif(
                              fontSize: 36,
                              color: MyAutoPilotStyles.appColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),

                      // Confirm Button
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 150, height: 55),
                          child: ElevatedButton(
                            onPressed: () async {
                              /* await goToPaymentScreen(
                                                                '1'); */
                              Navigator.pop(context);
                              await Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return PaymentScreen(
                                        planNumberSelected: planNumberSelected);
                                  },
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return Align(
                                      child: SlideTransition(
                                        position: Tween(
                                          begin: Offset(1.0, 0.0),
                                          end: Offset(0.0, 0.0),
                                        ).animate(animation),
                                        child: child,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: MyAutoPilotStyles.appColor,
                            ),
                            child: Text(
                              'CONFIRM',
                              style: GoogleFonts.notoSerif(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
