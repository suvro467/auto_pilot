import 'dart:io';

import 'package:auto_pilot/screens/home.dart';
import 'package:auto_pilot/screens/login_signup_screens/signup_screen.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
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
                              left: 50,
                              right: 50,
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
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 25, 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 100, height: 35),
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: MyAutoPilotStyles.appColor,
                          ),
                          child: Text(
                            'Back',
                            style: GoogleFonts.notoSerif(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
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
