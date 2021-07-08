import 'dart:io';

import 'package:auto_pilot/screens/home.dart';
import 'package:auto_pilot/screens/login_signup_screens/change_password_screen.dart';
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

class FirstTimeLoginScreen extends StatefulWidget {
  const FirstTimeLoginScreen({Key? key}) : super(key: key);

  @override
  _FirstTimeLoginScreenState createState() => _FirstTimeLoginScreenState();
}

class _FirstTimeLoginScreenState extends State<FirstTimeLoginScreen> {
  bool _isObscure = true;

  final TextEditingController _smsOTPController = TextEditingController();
  final TextEditingController _emailOTPController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _validationText;
  late bool _isSmsOTPValid;
  late bool _isEmailOTPValid;
  late bool _isPasswordValid;
  late int _timesTappedSmsOTP;
  late int _timesTappedEmailOTP;
  late int _timesTappedPassword;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isSmsOTPValid = true;
    _isEmailOTPValid = true;
    _isPasswordValid = true;
    _timesTappedSmsOTP = 0;
    _timesTappedEmailOTP = 0;
    _timesTappedPassword = 0;

    // Start listening to changes
    _smsOTPController.addListener(() {
      if (_smsOTPController.text.isEmpty && _timesTappedSmsOTP > 0) {
        setState(() {
          _isSmsOTPValid = false;
        });
      } else {
        setState(() {
          _isSmsOTPValid = true;
        });
      }
    });

    _emailOTPController.addListener(() {
      if (_emailOTPController.text.isEmpty && _timesTappedEmailOTP > 0) {
        setState(() {
          _isEmailOTPValid = false;
        });
      } else {
        setState(() {
          _isEmailOTPValid = true;
        });
      }
    });

    _passwordController.addListener(() {
      if (_passwordController.text.isEmpty && _timesTappedPassword > 0) {
        setState(() {
          _isPasswordValid = false;
        });
      } else {
        setState(() {
          _isPasswordValid = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _smsOTPController.dispose();
    _emailOTPController.dispose();
    _passwordController.dispose();
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
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
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
                  Container(
                    child: Text(
                      'Welcome to My Autopilot',
                      style: GoogleFonts.notoSerif(
                        fontSize: 16,
                        color: MyAutoPilotStyles.appColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 50,
                      right: 50,
                      top: 10,
                    ),
                    child: Text(
                      'Since you are logging in for the first time, you need to regenerate your password after verifying your email id and phone number. ',
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: HexColor('#707070'),
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 20,
                      ),
                      child: TextField(
                        controller: _smsOTPController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          //LengthLimitingTextInputFormatter(8)
                        ],
                        onChanged: (value) {
                          _timesTappedSmsOTP += 1;
                        },
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                              'assets/images/otp.svg',
                              color: MyAutoPilotStyles.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          hintText: 'Enter OTP sent via SMS',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isSmsOTPValid
                        ? Positioned(
                            right: 50.0,
                            top: 55.0,
                            child: new Container(
                              child: Text(
                                '$_validationText',
                                style: TextStyle(
                                  color: Globals.validationColor,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ]),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 20,
                      ),
                      child: TextField(
                        controller: _emailOTPController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          //LengthLimitingTextInputFormatter(8)
                        ],
                        onChanged: (value) {
                          _timesTappedEmailOTP += 1;
                        },
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                              'assets/images/otp.svg',
                              color: MyAutoPilotStyles.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          hintText: 'Enter OTP sent via EMail',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isEmailOTPValid
                        ? Positioned(
                            right: 50.0,
                            top: 55.0,
                            child: new Container(
                              child: Text(
                                '$_validationText',
                                style: TextStyle(
                                  color: Globals.validationColor,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ]),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 20,
                      ),
                      child: TextField(
                        controller: _passwordController,
                        onChanged: (value) {
                          _timesTappedPassword += 1;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                          prefixIcon: Transform.scale(
                            scale: 0.7,
                            child: SvgPicture.asset(
                              'assets/images/password.svg',
                              color: MyAutoPilotStyles.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            child: Transform.scale(
                              scale: 0.7,
                              child: SvgPicture.asset(
                                _isObscure
                                    ? 'assets/images/hide.svg'
                                    : 'assets/images/show.svg',
                                color: MyAutoPilotStyles.appColor,
                                //semanticsLabel: 'Email Mobile',
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
                          ),
                          hintText: 'Password',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isPasswordValid
                        ? Positioned(
                            right: 50.0,
                            top: 55.0,
                            child: new Container(
                              child: Text(
                                '$_validationText',
                                style: TextStyle(
                                  color: Globals.validationColor,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          )
                        : Container()
                  ]),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 130, height: 55),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (!_isSmsOTPValid ||
                                _smsOTPController.text.isEmpty ||
                                !_isEmailOTPValid ||
                                _emailOTPController.text.isEmpty ||
                                !_isPasswordValid ||
                                _passwordController.text.isEmpty) {
                              if (_smsOTPController.text.isEmpty)
                                _isSmsOTPValid = false;
                              if (_emailOTPController.text.isEmpty)
                                _isEmailOTPValid = false;
                              if (_passwordController.text.isEmpty)
                                _isPasswordValid = false;

                              setState(() {});
                              ShowMessage.showFlushBar(
                                  context, 'Please rectify the errors.');
                            } else {
                              setState(() {
                                _isSmsOTPValid = true;
                                _isEmailOTPValid = true;
                                _isPasswordValid = true;
                              });

                              // Do Login related stuffs.
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return LoadingDialog();
                                },
                              );

                              // Store user related information in the Globals file here
                              // Need to delete the hardcoded values here

                              Globals.userFirstName = 'Kuntal';
                              Globals.userLastName = 'Dutta';
                              Globals.designation = 'Managing Director';

                              await Future.delayed(new Duration(seconds: 3),
                                  () {
                                Navigator.pop(context); //pop dialog
                              }).then((value) {
                                // After successfull login, navigate to the home screen
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return HomeScreen();
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return Align(
                                        // Other animation types kept here for re-use.
                                        /* child: FadeTransition(
                                                  opacity: animation,
                                                  child: child,
                                              ), */
                                        /* child: ScaleTransition(
                                                  scale: animation,
                                                  child: child,
                                              ), */
                                        /* child: SizeTransition(
                                                  sizeFactor: animation,
                                                  child: child,
                                                  axisAlignment: 0.0,
                                              ), */
                                        child: SlideTransition(
                                          position: Tween(
                                                  begin: Offset(1.0, 0.0),
                                                  end: Offset(0.0, 0.0))
                                              .animate(animation),
                                          child: child,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              });
                            }
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
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 75, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 100, height: 35),
                          child: ElevatedButton(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return SignUpScreen();
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return Align(
                                        // Other animation types kept here for re-use.
                                        /* child: FadeTransition(
                                            opacity: animation,
                                            child: child,
                                        ), */
                                        /* child: ScaleTransition(
                                            scale: animation,
                                            child: child,
                                        ), */
                                        /* child: SizeTransition(
                                            sizeFactor: animation,
                                            child: child,
                                            axisAlignment: 0.0,
                                        ), */
                                        child: SlideTransition(
                                          position: Tween(
                                                  begin: Offset(1.0, 0.0),
                                                  end: Offset(0.0, 0.0))
                                              .animate(animation),
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
                                'Back',
                                style: GoogleFonts.notoSerif(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
