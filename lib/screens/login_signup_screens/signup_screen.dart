import 'dart:io';

import 'package:auto_pilot/screens/login_signup_screens/login_screen.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscure = true;
  bool _acceptTerms = false;

  final TextEditingController _customerNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _smsOTPController = TextEditingController();
  final TextEditingController _emailOTPController = TextEditingController();

  late String _validationText;
  late bool _isCustomerNameValid;
  late bool _isEmailValid;
  late bool _isPhoneValid;
  late bool _isPasswordValid;
  late bool _isValidEmail;
  late bool _isSmsOTPValid;
  late bool _isEmailOTPValid;
  late int _timesTappedCustomerName;
  late int _timesTappedEmail;
  late int _timesTappedPhone;
  late int _timesTappedPassword;
  late int _timesTappedSmsOTP;
  late int _timesTappedEmailOTP;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isCustomerNameValid = true;
    _isEmailValid = true;
    _isPhoneValid = true;
    _isPasswordValid = true;
    _isValidEmail = true;
    _isSmsOTPValid = true;
    _isEmailOTPValid = true;
    _timesTappedCustomerName = 0;
    _timesTappedEmail = 0;
    _timesTappedPhone = 0;
    _timesTappedPassword = 0;
    _timesTappedSmsOTP = 0;
    _timesTappedEmailOTP = 0;

    // Start listening to changes
    _customerNameController.addListener(() {
      if (_customerNameController.text.isEmpty &&
          _timesTappedCustomerName > 0) {
        setState(() {
          _isCustomerNameValid = false;
        });
      } else {
        setState(() {
          _isCustomerNameValid = true;
        });
      }
    });

    _emailController.addListener(() {
      if (_emailController.text.isEmpty && _timesTappedEmail > 0) {
        setState(() {
          _isEmailValid = false;
        });
      } else {
        setState(() {
          _isEmailValid = true;
        });
      }
    });

    _phoneNumberController.addListener(() {
      if (_phoneNumberController.text.isEmpty && _timesTappedPhone > 0) {
        setState(() {
          _isPhoneValid = false;
        });
      } else {
        setState(() {
          _isPhoneValid = true;
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
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _smsOTPController.dispose();
    _emailOTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Globals.selectedAppLanguage = Globals.appLanguages[0];
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context); //return data along with pop
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
                  DropdownButton(
                    elevation: 16,
                    iconSize: 36,
                    iconEnabledColor: Globals.appColor,
                    underline: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Divider(
                        color: Globals.appColor,
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
                      color: Globals.appColor,
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
                    margin: EdgeInsets.only(top: 20),
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
                        top: 20,
                      ),
                      child: TextField(
                        controller: _customerNameController,
                        onChanged: (value) {
                          _timesTappedCustomerName += 1;
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
                              'assets/images/user.svg',
                              color: Globals.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          hintText: 'Name',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isCustomerNameValid
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
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50,
                        top: 20,
                      ),
                      child: TextField(
                        controller: _emailController,
                        onChanged: (value) {
                          _timesTappedEmail += 1;
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
                              color: Globals.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          hintText: 'Email',
                          hintStyle: GoogleFonts.notoSerif(
                            fontSize: 14,
                            color: HexColor('#C9C9C9'),
                            fontWeight: FontWeight.normal,
                            //decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    !_isEmailValid
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
                        : (!_isValidEmail
                            ? Positioned(
                                right: 50.0,
                                top: 55.0,
                                child: new Container(
                                  child: Text(
                                    'Please enter a valid email',
                                    style: TextStyle(
                                      color: Globals.validationColor,
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                              )
                            : Container())
                  ]),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          padding: const EdgeInsets.only(
                            left: 50.0,
                            //right: 50,
                            top: 20,
                          ),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Globals.appColor),
                              ),
                              labelStyle: GoogleFonts.notoSerif(
                                fontSize: 14,
                                color: HexColor('#C9C9C9'),
                                fontWeight: FontWeight.normal,
                              ),
                              prefixIcon: Transform.scale(
                                scale: 0.6,
                                child: SvgPicture.asset(
                                  'assets/images/phone.svg',
                                  color: Globals.appColor,
                                  //semanticsLabel: 'Email Mobile',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Globals.appColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Globals.appColor),
                              ),
                              hintText: '+91 (IND)',
                              hintStyle: GoogleFonts.notoSerif(
                                fontSize: 14,
                                color: HexColor('#C9C9C9'),
                                fontWeight: FontWeight.normal,
                                //decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          //flex: 2,
                          child: Stack(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 50,
                                top: 20,
                              ),
                              child: TextField(
                                controller: _phoneNumberController,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10)
                                ],
                                onChanged: (value) {
                                  _timesTappedPhone += 1;
                                },
                                decoration: InputDecoration(
                                  labelStyle: GoogleFonts.notoSerif(
                                    fontSize: 14,
                                    color: HexColor('#C9C9C9'),
                                    fontWeight: FontWeight.normal,
                                  ),
                                  /* prefixIcon: Transform.scale(
                                    scale: 0.7,
                                    child: SvgPicture.asset(
                                      'assets/images/otp.svg',
                                      color: Globals.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ), */
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Globals.appColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Globals.appColor),
                                  ),
                                  hintText: 'Contact Number',
                                  hintStyle: GoogleFonts.notoSerif(
                                    fontSize: 14,
                                    color: HexColor('#C9C9C9'),
                                    fontWeight: FontWeight.normal,
                                    //decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            !_isPhoneValid
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
                        ),
                      ],
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
                              color: Globals.appColor,
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
                                color: Globals.appColor,
                                //semanticsLabel: 'Email Mobile',
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          hintText: 'Assign password',
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
                              color: Globals.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
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
                              color: Globals.appColor,
                              //semanticsLabel: 'Email Mobile',
                              height: 10,
                              width: 10,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Globals.appColor),
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
                  Container(
                    padding: const EdgeInsets.only(
                      left: 50.0,
                      right: 50,
                      top: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: RichText(
                            text: TextSpan(
                              text: 'By using MyAutoPilot you agree to our ',
                              style: GoogleFonts.notoSans(
                                fontSize: 14,
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'terms of use',
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 14,
                                    color: Globals.appColor,
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
                                    color: Globals.appColor,
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
                            if (!_isCustomerNameValid ||
                                _customerNameController.text.isEmpty ||
                                !_isEmailValid ||
                                _emailController.text.isEmpty ||
                                !_isPhoneValid ||
                                _phoneNumberController.text.isEmpty ||
                                !_isPasswordValid ||
                                _passwordController.text.isEmpty ||
                                !_isSmsOTPValid ||
                                _smsOTPController.text.isEmpty ||
                                !_isEmailOTPValid ||
                                _emailOTPController.text.isEmpty) {
                              if (_customerNameController.text.isEmpty)
                                _isCustomerNameValid = false;
                              if (_emailController.text.isEmpty)
                                _isEmailValid = false;
                              if (_phoneNumberController.text.isEmpty)
                                _isPhoneValid = false;
                              if (_passwordController.text.isEmpty)
                                _isPasswordValid = false;
                              if (_smsOTPController.text.isEmpty)
                                _isSmsOTPValid = false;
                              if (_emailOTPController.text.isEmpty)
                                _isEmailOTPValid = false;

                              setState(() {});
                              ShowMessage.showFlushBar(
                                  context, 'Please rectify the errors.');
                            } else if (!Globals.isEmail(
                                _emailController.text)) {
                              setState(() {
                                _isValidEmail = false;
                              });
                              ShowMessage.showFlushBar(
                                  context, 'Please rectify the errors.');
                            } else {
                              setState(() {
                                _isCustomerNameValid = true;
                                _isEmailValid = true;
                                _isPhoneValid = true;
                                _isPasswordValid = true;
                                _isValidEmail = true;
                                _isSmsOTPValid = true;
                                _isEmailOTPValid = true;
                              });

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  /* return Container(
                                    width: 60,
                                    child: Dialog(
                                      insetPadding: EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                              offset: const Offset(0.0, 10.0),
                                            ),
                                          ],
                                        ),
                                        height: 80,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(width: 20),
                                            Text("Loading"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ); */
                                  return LoadingDialog(
                                    message: 'Please Wait ...',
                                  );
                                },
                              );

                              await Future.delayed(new Duration(seconds: 3),
                                  () {
                                Navigator.pop(context); //pop dialog
                              });

                              // Do Sign UP related stuffs.
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            primary: Globals.appColor,
                          ),
                          child: Text(
                            'SIGN UP',
                            style: GoogleFonts.notoSerif(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 25, 25, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Already have',
                                style: GoogleFonts.notoSans(
                                  fontSize: 10,
                                  color: HexColor('#707070'),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                'an account?',
                                style: GoogleFonts.notoSans(
                                  fontSize: 10,
                                  color: HexColor('#707070'),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 100, height: 35),
                          child: ElevatedButton(
                              onPressed: () async {
                                await Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      return LoginScreen();
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
                                primary: Globals.appColor,
                              ),
                              child: Text(
                                'Log In',
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
