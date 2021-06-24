import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/material.dart';
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
  late int _timesTappedUserName;
  late int _timesTappedPassword;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isUserNameValid = true;
    _isPasswordValid = true;
    _timesTappedUserName = 0;
    _timesTappedPassword = 0;

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
    return Scaffold(
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
                          } else {
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
