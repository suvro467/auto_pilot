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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  bool _acceptTerms = false;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _validationText;
  late bool _isUserNameValid;
  late bool _isPasswordValid;
  late bool _isUserNameValidMobileOrEmail;
  late int _timesTappedUserName;
  late int _timesTappedPassword;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isUserNameValid = true;
    _isPasswordValid = true;
    _isUserNameValidMobileOrEmail = true;
    _timesTappedUserName = 0;
    _timesTappedPassword = 0;

    // Start listening to changes
    _userNameController.addListener(() {
      if (_userNameController.text.isEmpty && _timesTappedUserName > 0) {
        setState(() {
          _isUserNameValid = false;
          _isUserNameValidMobileOrEmail = true;
        });
      } else if (!(Globals.isEmail(_userNameController.text) ||
              Globals.isValidMobileNumber(_userNameController.text)) &&
          _timesTappedUserName > 0) {
        setState(() {
          _isUserNameValidMobileOrEmail = false;
          _isUserNameValid = true;
        });
      } else {
        setState(() {
          _isUserNameValid = true;
          _isUserNameValidMobileOrEmail = true;
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
    _userNameController.dispose();
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
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      child:
                          Image(image: AssetImage('assets/icons/logopng.png')),
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 50.0,
                          right: 50,
                          top: 50,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.next,
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
                          top: 50,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.done,
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
                          : Container()
                    ]),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 500),
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return ChangePasswordScreen();
                            },
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child) {
                              return Align(
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
                      child: Container(
                        padding: EdgeInsets.only(
                          right: 50,
                          top: 15,
                          bottom: 15,
                        ),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password',
                          style: GoogleFonts.notoSerif(
                            fontSize: 13,
                            color: MyAutoPilotStyles.appColor,
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: MyAutoPilotStyles.appColor,

                              value: _acceptTerms,
                              onChanged: (newValue) {
                                setState(() {
                                  _acceptTerms = !_acceptTerms;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: RichText(
                              text: TextSpan(
                                text: 'We have updated our ',
                                style: GoogleFonts.notoSerif(
                                  fontSize: 14,
                                  color: HexColor('#707070'),
                                  fontWeight: FontWeight.normal,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'terms of use',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 14,
                                      color: MyAutoPilotStyles.appColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 14,
                                      color: HexColor('#707070'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'privacy policy.',
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 14,
                                      color: MyAutoPilotStyles.appColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 130, height: 55),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (!_isUserNameValid ||
                                  _userNameController.text.isEmpty ||
                                  !_isPasswordValid ||
                                  _passwordController.text.isEmpty) {
                                if (_userNameController.text.isEmpty)
                                  _isUserNameValid = false;
                                if (_passwordController.text.isEmpty)
                                  _isPasswordValid = false;

                                setState(() {});
                                ShowMessage.showFlushBar(
                                    context, 'Please rectify the errors.');
                              } else if (!_acceptTerms) {
                                ShowMessage.showFlushBar(
                                    context, 'Please accept terms.');
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
                                  _isUserNameValidMobileOrEmail = true;
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
                                          Animation<double>
                                              secondaryAnimation) {
                                        return HomeScreen(
                                          initialPage: 0,
                                        );
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
                              'LOGIN',
                              style: GoogleFonts.notoSerif(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 2,
                            child: SvgPicture.asset(
                              'assets/images/fingerprint.svg',
                              color: MyAutoPilotStyles.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Fingerprint Login Enabled',
                              style: GoogleFonts.notoSans(
                                fontSize: 12,
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
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
                                          Animation<double>
                                              secondaryAnimation) {
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
                                  'Sign Up',
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
      ),
    );
  }
}
