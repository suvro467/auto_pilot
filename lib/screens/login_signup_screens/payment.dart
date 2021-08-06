import 'dart:io';

import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/rounded_rectangular_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    super.initState();
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
                              'Complete Payment',
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
