import 'dart:io';

import 'package:auto_pilot/screens/home.dart';
import 'package:auto_pilot/screens/login_signup_screens/login_screen.dart';
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

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _isObscure = true;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  late String _validationText;
  late bool _isUserNameValid;
  late bool _isPasswordValid;
  late bool _isUserNameValidMobileOrEmail;
  late bool _isOTPValid;
  late int _timesTappedUserName;
  late int _timesTappedPassword;
  late int _timesTappedOTP;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isUserNameValid = true;
    _isPasswordValid = true;
    _isOTPValid = true;
    _isUserNameValidMobileOrEmail = true;
    _timesTappedUserName = 0;
    _timesTappedPassword = 0;
    _timesTappedOTP = 0;

    // Start listening to changes
    _userNameController.addListener(() {
      if (_userNameController.text.isEmpty && _timesTappedUserName > 0) {
        setState(() {
          _isUserNameValid = false;
        });
      } else {
        setState(() {
          _isUserNameValid = true;
        });
      }

      /* if (_userNameController.text.isNotEmpty && _timesTappedUserName > 0) {
        if (!Globals.isEmail(_userNameController.text) ||
            !Globals.isValidMobileNumber(_userNameController.text))
          setState(() {
            _isUserNameValidMobileOrEmail = false;
          });
        else
          setState(() {
            _isUserNameValidMobileOrEmail = true;
          });
      } */
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

    _otpController.addListener(() {
      if (_otpController.text.isEmpty && _timesTappedOTP > 0) {
        setState(() {
          _isOTPValid = false;
        });
      } else {
        setState(() {
          _isOTPValid = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Globals.selectedAppLanguage = Globals.appLanguages[0];
    return WillPopScope(
      onWillPop: () {
        // Quit the app.
        if (Platform.isAndroid)
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return new Future(() => false);
      },
      child: Material(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 95 / 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton(
                    elevation: 16,
                    iconSize: 36,
                    iconEnabledColor: MyAutoPilotStyles.appColor,
                    underline: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Divider(
                        color: MyAutoPilotStyles.appColor,
                        height: 1.0,
                        thickness: 1,
                      ),
                    ),
                    style: GoogleFonts.notoSerif(
                      fontSize: 14,
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.normal,
                    ),
                    value: Globals.selectedAppLanguage,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: MyAutoPilotStyles.appColor,
                      //size: 30,
                    ),
                    items: Globals.appLanguages.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#707070'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        Globals.selectedAppLanguage = value.toString();
                      });
                    },
                  ),
                  Container(
                    height: 75.0,
                    width: 75.0,
                    margin: EdgeInsets.only(top: 100),
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
                    child: Image(image: AssetImage('assets/icons/logopng.png')),
                  ),
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 50,
                      ),
                      child: TextField(
                        controller: _userNameController,
                        onChanged: (value) {
                          _timesTappedUserName += 1;
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
                              'assets/images/email.svg',
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
                          hintText: 'Email / Mobile',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isUserNameValid
                        ? Positioned(
                            right: 50.0,
                            top: 85.0,
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
                        : (!_isUserNameValidMobileOrEmail
                            ? Positioned(
                                right: 50.0,
                                top: 85.0,
                                child: new Container(
                                  child: Text(
                                    'Please enter a valid email or mobile number',
                                    style: TextStyle(
                                      color: Globals.validationColor,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                              )
                            : Container())
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
                          hintText: 'New Password',
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
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 20,
                      ),
                      child: TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          //LengthLimitingTextInputFormatter(8)
                        ],
                        onChanged: (value) {
                          _timesTappedOTP += 1;
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
                          hintText: 'Enter OTP sent via SMS / Email',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isOTPValid
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
                    padding: EdgeInsets.only(top: 50),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tightFor(width: 130, height: 55),
                      child: ElevatedButton(
                          onPressed: () async {
                            if (!_isUserNameValid ||
                                _userNameController.text.isEmpty ||
                                !_isPasswordValid ||
                                _passwordController.text.isEmpty ||
                                !_isOTPValid ||
                                _otpController.text.isEmpty) {
                              if (_userNameController.text.isEmpty)
                                _isUserNameValid = false;
                              if (_passwordController.text.isEmpty)
                                _isPasswordValid = false;
                              if (_otpController.text.isEmpty)
                                _isOTPValid = false;

                              setState(() {});
                              ShowMessage.showFlushBar(
                                  context, 'Please rectify the errors.');
                            } else if (!(Globals.isEmail(
                                    _userNameController.text) ||
                                Globals.isValidMobileNumber(
                                    _userNameController.text))) {
                              setState(() {
                                _isUserNameValidMobileOrEmail = false;
                              });
                              ShowMessage.showFlushBar(
                                  context, 'Please rectify the errors.');
                            } else {
                              setState(() {
                                _isUserNameValid = true;
                                _isPasswordValid = true;
                                _isOTPValid = true;
                                _isUserNameValidMobileOrEmail = true;
                              });

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return LoadingDialog();
                                },
                              );

                              await Future.delayed(new Duration(seconds: 3),
                                  () {
                                Navigator.pop(context); //pop dialog
                              }).then((value) async {
                                // After successfully changing the password, navigate to the login screen
                                await showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return WillPopScope(
                                      onWillPop: () async =>
                                          false, // Need to change this to false later.
                                      child: Material(
                                        type: MaterialType.transparency,
                                        child: Center(
                                          child: SizedBox(
                                            //width: width,
                                            height: 350,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 10.0,
                                                    offset:
                                                        const Offset(0.0, 10.0),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    height: 75.0,
                                                    width: 75.0,
                                                    margin: EdgeInsets.only(
                                                        top: 50),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.transparent,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          offset: Offset(
                                                              0.0, 1.0), //(x,y)
                                                          blurRadius: 1.0,
                                                        ),
                                                      ],
                                                    ),
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/icons/logopng.png')),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        top: 20),
                                                    child: Text(
                                                      'You can now login',
                                                      style:
                                                          GoogleFonts.notoSerif(
                                                        fontSize: 16,
                                                        color: MyAutoPilotStyles
                                                            .appColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        //decoration: TextDecoration.underline,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                      top: 20,
                                                      left: 20,
                                                      right: 20,
                                                    ),
                                                    child: Text(
                                                      'Your password has been changed successfully.',
                                                      style:
                                                          GoogleFonts.notoSans(
                                                        fontSize: 14,
                                                        color:
                                                            HexColor('#707070'),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        //decoration: TextDecoration.underline,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(25),
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          BoxConstraints
                                                              .tightFor(
                                                                  width: 160,
                                                                  height: 55),
                                                      child: ElevatedButton(
                                                          onPressed: () async {
                                                            await Navigator
                                                                .pushReplacement(
                                                              context,
                                                              PageRouteBuilder(
                                                                transitionDuration:
                                                                    Duration(
                                                                        milliseconds:
                                                                            500),
                                                                pageBuilder: (BuildContext context,
                                                                    Animation<
                                                                            double>
                                                                        animation,
                                                                    Animation<
                                                                            double>
                                                                        secondaryAnimation) {
                                                                  return LoginScreen();
                                                                },
                                                                transitionsBuilder: (BuildContext context,
                                                                    Animation<
                                                                            double>
                                                                        animation,
                                                                    Animation<
                                                                            double>
                                                                        secondaryAnimation,
                                                                    Widget
                                                                        child) {
                                                                  return Align(
                                                                    child:
                                                                        SlideTransition(
                                                                      position: Tween(
                                                                              begin: Offset(1.0, 0.0),
                                                                              end: Offset(0.0, 0.0))
                                                                          .animate(animation),
                                                                      child:
                                                                          child,
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            primary:
                                                                MyAutoPilotStyles
                                                                    .appColor,
                                                          ),
                                                          child: Text(
                                                            'GO TO LOGIN',
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
                  Flexible(
                    fit: FlexFit.tight,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  primary: MyAutoPilotStyles.appColor,
                                ),
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )),
                          ],
                        ),
                      ),
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
