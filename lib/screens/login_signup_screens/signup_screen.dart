import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _smsOTP = TextEditingController();
  final TextEditingController _emailOTP = TextEditingController();

  late String _validationText;
  late bool _isCustomerNameValid;
  late bool _isEmailValid;
  late bool _isPasswordValid;
  late bool _isValidEmail;
  late bool _isSmsOTPValid;
  late bool _isEmailOTPValid;
  late int _timesTappedCustomerName;
  late int _timesTappedUserName;
  late int _timesTappedPassword;
  late int _timesTappedSmsOTP;
  late int _timesTappedEmailOTP;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isCustomerNameValid = true;
    _isEmailValid = true;
    _isPasswordValid = true;
    _isValidEmail = true;
    _timesTappedCustomerName = 0;
    _timesTappedUserName = 0;
    _timesTappedPassword = 0;

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
      if (_emailController.text.isEmpty && _timesTappedUserName > 0) {
        setState(() {
          _isEmailValid = false;
        });
      } else {
        setState(() {
          _isEmailValid = true;
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
    _customerNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Globals.selectedAppLanguage = Globals.appLanguages[0];
    return Scaffold(
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
                      top: 50,
                    ),
                    child: TextField(
                      controller: _emailController,
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
                      : (!_isValidEmail
                          ? Positioned(
                              right: 50.0,
                              top: 85.0,
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
                Stack(children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 50.0,
                      right: 50,
                      top: 50,
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
                  onTap: () {},
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
                        color: Globals.appColor,
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
                          activeColor: Globals.appColor,

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
                              !_isPasswordValid ||
                              _passwordController.text.isEmpty) {
                            if (_customerNameController.text.isEmpty)
                              _isCustomerNameValid = false;
                            if (_emailController.text.isEmpty)
                              _isEmailValid = false;
                            if (_passwordController.text.isEmpty)
                              _isPasswordValid = false;

                            setState(() {});
                            ShowMessage.showFlushBar(
                                context, 'Please rectify the errors.');
                          } else if (!_acceptTerms) {
                            ShowMessage.showFlushBar(
                                context, 'Please accept terms.');
                          } else if (!Globals.isEmail(_emailController.text)) {
                            setState(() {
                              _isValidEmail = false;
                            });
                            ShowMessage.showFlushBar(
                                context, 'Please rectify the errors.');
                          } else {
                            setState(() {
                              _isCustomerNameValid = true;
                              _isEmailValid = true;
                              _isPasswordValid = true;
                              _isValidEmail = true;
                            });

                            // Do Login related stuffs.
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          primary: Globals.appColor,
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
                          color: Globals.appColor,
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              primary: Globals.appColor,
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
    );
  }
}
