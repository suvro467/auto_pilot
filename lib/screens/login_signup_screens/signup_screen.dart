import 'dart:io';

import 'package:auto_pilot/screens/login_signup_screens/first_time_login_screen.dart';
import 'package:auto_pilot/screens/login_signup_screens/login_screen.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/foundation.dart';
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
  late bool _isEmailBlank;
  late bool _isPhoneValid;
  late bool _isValidMobileNumber;
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

  Map<String, dynamic> selectedCountryISDCode = {};
  late String _countryISDCode;

  late FocusNode focusNodeEmail;
  late FocusNode focusNodePhoneNumber;
  late FocusNode focusNodePassword;
  late FocusNode focusNodeOTPSms;
  late FocusNode focusNodeOTPEmail;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isCustomerNameValid = true;
    _isEmailBlank = true;
    _isPhoneValid = true;
    _isValidMobileNumber = true;
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

    focusNodeEmail = FocusNode();
    focusNodePhoneNumber = FocusNode();
    focusNodePassword = FocusNode();
    focusNodeOTPSms = FocusNode();
    focusNodeOTPEmail = FocusNode();

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
          _isEmailBlank = false;
        });
      } else {
        setState(() {
          _isEmailBlank = true;
        });
      }
    });

    _countryISDCode = 'ISD Code';
    selectedCountryISDCode = Globals.countryISDCodes
        .where((element) => element['name'] == 'India')
        .first;

    _phoneNumberController.addListener(() {
      if (_phoneNumberController.text.isEmpty && _timesTappedPhone > 0) {
        setState(() {
          _isPhoneValid = false;
          _isValidMobileNumber = true;
        });
      } else if (!Globals.isValidMobileNumber(_phoneNumberController.text) &&
          _timesTappedPhone > 0) {
        setState(() {
          _isPhoneValid = true;
          _isValidMobileNumber = false;
        });
      } else {
        setState(() {
          _isPhoneValid = true;
          _isValidMobileNumber = true;
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

    /* if (_phoneNumberController.text.isNotEmpty && _timesTappedPhone > 0) {
      if (!Globals.isValidMobileNumber(_phoneNumberController.text))
        setState(() {
          _isValidMobileNumber = false;
        });
      else
        setState(() {
          _isValidMobileNumber = true;
        });
    } */
  }

  @override
  void dispose() {
    _customerNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _smsOTPController.dispose();
    _emailOTPController.dispose();

    focusNodeEmail.dispose();
    focusNodePhoneNumber.dispose();
    focusNodePassword.dispose();
    focusNodeOTPSms.dispose();
    focusNodeOTPEmail.dispose();
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
              child: Form(
                child: SingleChildScrollView(
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
                        child: Image(
                            image: AssetImage('assets/icons/logopng.png')),
                      ),
                      Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 50.0,
                            right: 50,
                            top: 20,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            controller: _customerNameController,
                            onChanged: (value) {
                              _timesTappedCustomerName += 1;
                            },
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodeEmail);
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
                                  color: MyAutoPilotStyles.appColor,
                                  //semanticsLabel: 'Email Mobile',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyAutoPilotStyles.appColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyAutoPilotStyles.appColor,
                                ),
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
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            focusNode: focusNodeEmail,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodePhoneNumber);
                            },
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
                                  color: MyAutoPilotStyles.appColor,
                                  //semanticsLabel: 'Email Mobile',
                                  height: 10,
                                  width: 10,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyAutoPilotStyles.appColor,
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyAutoPilotStyles.appColor,
                                ),
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
                        !_isEmailBlank
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(children: [
                              Container(
                                width: 200,
                                height: 85,
                                padding: const EdgeInsets.only(
                                  left: 50.0,
                                  //right: 50,
                                  top: 20,
                                ),
                                /* child: DropdownSearch<Map<String, dynamic>>(
                                  //label: 'ISD Code',
                                  showSelectedItem: false,
                                  itemAsString: (item) {
                                    return item['ISD'] +
                                        ' (' +
                                        (item['countryCode']) +
                                        ')';
                                  },
                                  dropDownButton: DecoratedIcon(
                                    Icons.arrow_drop_down,
                                    size: 36,
                                    color: MyAutoPilotStyles.appColor,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black54,
                                        blurRadius: 8.0,
                                        offset: Offset(1.0, 2.0),
                                      ),
                                      BoxShadow(
                                        blurRadius: 12.0,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  showAsSuffixIcons: true,
                                  validator: (v) =>
                                      v == null ? "required field" : null,
                                  dropdownSearchDecoration: InputDecoration(
                                    labelStyle: GoogleFonts.notoSerif(
                                      fontSize: 14,
                                      color: HexColor('#C9C9C9'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                    prefixIcon: Transform.scale(
                                      scale: 0.6,
                                      child: SvgPicture.asset(
                                        'assets/images/phone.svg',
                                        color: MyAutoPilotStyles.appColor,
                                        height: 10,
                                        width: 10,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MyAutoPilotStyles.appColor),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: MyAutoPilotStyles.appColor),
                                    ),
                                    hintStyle: GoogleFonts.notoSerif(
                                      fontSize: 14,
                                      color: HexColor('#C9C9C9'),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  mode: Mode.DIALOG,
                                  items: Globals.countryISDCodes,
                                  maxHeight:
                                      (Globals.countryISDCodes.length).toDouble() *
                                          55,
                                  showClearButton: false,
                                  selectedItem: selectedCountryISDCode,
                                  onChanged: (value) async {
                                    selectedCountryISDCode = value!;
                                    _countryISDCode = '';
                                  },
                                ), */
                                child: DropdownButton(
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
                                  value: selectedCountryISDCode,
                                  icon: Padding(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: MyAutoPilotStyles.appColor,
                                      //size: 30,
                                    ),
                                  ),
                                  items: Globals.countryISDCodes
                                      .map((Map<String, dynamic> items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: 30.0,
                                          top: 15,
                                        ),
                                        child: Text(
                                          items['ISD'] +
                                              ' (' +
                                              items['countryCode'] +
                                              ')',
                                          style: GoogleFonts.notoSerif(
                                            fontSize: 14,
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                            //decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCountryISDCode = Globals
                                          .countryISDCodes
                                          .firstWhere((element) => mapEquals(
                                              element,
                                              value as Map<String, dynamic>));
                                      _countryISDCode = '';
                                    });
                                  },
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 40,
                                child: SvgPicture.asset(
                                  'assets/images/phone.svg',
                                  color: MyAutoPilotStyles.appColor,
                                  height: 30,
                                  width: 30,
                                ),
                              )
                            ]),
                            Expanded(
                              //flex: 2,
                              child: Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 50,
                                    top: 20,
                                  ),
                                  child: TextFormField(
                                    validator: (value) {
                                      return null;
                                    },
                                    controller: _phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10)
                                    ],
                                    onChanged: (value) {
                                      _timesTappedPhone += 1;
                                    },
                                    textInputAction: TextInputAction.next,
                                    focusNode: focusNodePhoneNumber,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNodePassword);
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
                                            color: MyAutoPilotStyles.appColor,
                                            //semanticsLabel: 'Email Mobile',
                                            height: 10,
                                            width: 10,
                                          ),
                                        ), */
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyAutoPilotStyles.appColor),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyAutoPilotStyles.appColor),
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
                                    : (!_isValidMobileNumber
                                        ? Positioned(
                                            right: 50.0,
                                            top: 55.0,
                                            child: new Container(
                                              child: Text(
                                                'Invalid mobile number',
                                                style: TextStyle(
                                                  color:
                                                      Globals.validationColor,
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container())
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
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            controller: _passwordController,
                            onChanged: (value) {
                              _timesTappedPassword += 1;
                            },
                            textInputAction: TextInputAction.next,
                            focusNode: focusNodePassword,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodeOTPSms);
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
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
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
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            controller: _smsOTPController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              //LengthLimitingTextInputFormatter(8)
                            ],
                            onChanged: (value) {
                              _timesTappedSmsOTP += 1;
                            },
                            textInputAction: TextInputAction.next,
                            focusNode: focusNodeOTPSms,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context)
                                  .requestFocus(focusNodeOTPEmail);
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
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
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
                          child: TextFormField(
                            validator: (value) {
                              return null;
                            },
                            controller: _emailOTPController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              //LengthLimitingTextInputFormatter(8)
                            ],
                            textInputAction: TextInputAction.done,
                            focusNode: focusNodeOTPEmail,
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
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: MyAutoPilotStyles.appColor),
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
                                  text:
                                      'By using MyAutoPilot you agree to our ',
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
                                if (!_isCustomerNameValid ||
                                    _customerNameController.text.isEmpty ||
                                    !_isEmailBlank ||
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
                                    _isEmailBlank = false;
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
                                    _emailController.text.trim())) {
                                  setState(() {
                                    _isValidEmail = false;
                                  });
                                  ShowMessage.showFlushBar(
                                      context, 'Please rectify the errors.');
                                } else if (!(Globals.isValidMobileNumber(
                                    _phoneNumberController.text))) {
                                  setState(() {
                                    _isValidMobileNumber = false;
                                  });
                                  ShowMessage.showFlushBar(
                                      context, 'Please rectify the errors.');
                                } else {
                                  setState(() {
                                    _isCustomerNameValid = true;
                                    _isEmailBlank = true;
                                    _isPhoneValid = true;
                                    _isValidMobileNumber = true;
                                    _isPasswordValid = true;
                                    _isValidEmail = true;
                                    _isSmsOTPValid = true;
                                    _isEmailOTPValid = true;
                                  });

                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return LoadingDialog();
                                    },
                                  );

                                  // API call for Sign Up

                                  await Future.delayed(new Duration(seconds: 3),
                                      () {
                                    Navigator.pop(context); //pop dialog
                                  }).then((value) {
                                    // After successfull signup, show a dialog to return to the login screen.
                                    // If sign up is successfull without any errors, show the following screen
                                    showDialog(
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
                                                height: 400,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.rectangle,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black26,
                                                        blurRadius: 10.0,
                                                        offset: const Offset(
                                                            0.0, 10.0),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        height: 75.0,
                                                        width: 75.0,
                                                        margin: EdgeInsets.only(
                                                            top: 50),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors
                                                              .transparent,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.2),
                                                              offset: Offset(
                                                                  0.0,
                                                                  1.0), //(x,y)
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
                                                          style: GoogleFonts
                                                              .notoSerif(
                                                            fontSize: 16,
                                                            color:
                                                                MyAutoPilotStyles
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
                                                          'Your password has been set. You can now',
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            fontSize: 14,
                                                            color: HexColor(
                                                                '#707070'),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            //decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          'login to the app and start using.',
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            fontSize: 14,
                                                            color: HexColor(
                                                                '#707070'),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            //decoration: TextDecoration.underline,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(25),
                                                        child: ConstrainedBox(
                                                          constraints:
                                                              BoxConstraints
                                                                  .tightFor(
                                                                      width:
                                                                          160,
                                                                      height:
                                                                          55),
                                                          child: ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                await Navigator
                                                                    .pushReplacement(
                                                                  context,
                                                                  PageRouteBuilder(
                                                                    transitionDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    pageBuilder: (BuildContext context,
                                                                        Animation<double>
                                                                            animation,
                                                                        Animation<double>
                                                                            secondaryAnimation) {
                                                                      return FirstTimeLoginScreen();
                                                                    },
                                                                    transitionsBuilder: (BuildContext context,
                                                                        Animation<double>
                                                                            animation,
                                                                        Animation<double>
                                                                            secondaryAnimation,
                                                                        Widget
                                                                            child) {
                                                                      return Align(
                                                                        child:
                                                                            SlideTransition(
                                                                          position:
                                                                              Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                                                                          child:
                                                                              child,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                              style:
                                                                  ElevatedButton
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
                                                                  color: Colors
                                                                      .white,
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
                              constraints: BoxConstraints.tightFor(
                                  width: 100, height: 35),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            Duration(milliseconds: 500),
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          return LoginScreen();
                                        },
                                        transitionsBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double>
                                                    secondaryAnimation,
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
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    primary: MyAutoPilotStyles.appColor,
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
        ),
      ),
    );
  }
}
