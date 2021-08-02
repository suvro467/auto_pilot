import 'dart:async';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AddUser1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const AddUser1(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _AddUser1State createState() => _AddUser1State();
}

class _AddUser1State extends State<AddUser1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  bool markHod = false;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late bool _isUserNameValid;
  late bool _isPhoneValid;

  late String _validationText;

  late int _timesTappedUserName;
  late int _timesTappedPhone;

  //String baseUrl = Globals.baseUrl;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    _validationText = 'Please fill in this field';
    _isUserNameValid = true;
    _isPhoneValid = true;
    _timesTappedUserName = 0;
    _timesTappedPhone = 0;

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
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: Container(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Users',
                          style: GoogleFonts.notoSerif(
                            color: HexColor('#707070'),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        Text('15 users of 50 users remaining',
                            style: GoogleFonts.notoSerif(
                              color: MyAutoPilotStyles.appColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Text(
                        'Mark HOD',
                        style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Switch(
                      value: markHod,
                      onChanged: (value) {
                        setState(() {
                          markHod = value;
                          print(markHod);
                        });
                      },
                      activeTrackColor: MyAutoPilotStyles.appColor,
                      activeColor: HexColor('#669db6'),
                      inactiveThumbColor: HexColor('#C9C9C9'),
                      inactiveTrackColor: HexColor('#707070'),
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
                          'assets/images/user.svg',
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
                      hintText: 'Full Name',
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
                            borderSide:
                                BorderSide(color: MyAutoPilotStyles.appColor),
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
                  ],
                ),
              ),
              Stack(children: [
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
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ), */
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyAutoPilotStyles.appColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: MyAutoPilotStyles.appColor),
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
              Padding(
                padding: EdgeInsets.all(25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 130, height: 55),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!_isUserNameValid ||
                          _userNameController.text.isEmpty ||
                          !_isPhoneValid ||
                          _phoneNumberController.text.isEmpty) {
                        if (_userNameController.text.isEmpty)
                          _isUserNameValid = false;
                        if (_phoneNumberController.text.isEmpty)
                          _isPhoneValid = false;

                        setState(() {});
                        ShowMessage.showFlushBar(
                            context, 'Please rectify the errors.');
                      } else {
                        setState(() {
                          _isUserNameValid = true;
                          _isPhoneValid = true;
                        });

                        /* showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return LoadingDialog();
                            },
                          ); */

                        // API call for Sign Up

                        /* await Future.delayed(new Duration(seconds: 3), () {
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
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 10.0,
                                                offset: const Offset(0.0, 10.0),
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
                                                margin:
                                                    EdgeInsets.only(top: 50),
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
                                                margin:
                                                    EdgeInsets.only(top: 20),
                                                child: Text(
                                                  'You can now login',
                                                  style: GoogleFonts.notoSerif(
                                                    fontSize: 16,
                                                    color: MyAutoPilotStyles
                                                        .appColor,
                                                    fontWeight: FontWeight.bold,
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
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: HexColor('#707070'),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    //decoration: TextDecoration.underline,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  'login to the app and start using.',
                                                  style: GoogleFonts.notoSans(
                                                    fontSize: 14,
                                                    color: HexColor('#707070'),
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
                                                      BoxConstraints.tightFor(
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
                                                            pageBuilder: (BuildContext
                                                                    context,
                                                                Animation<
                                                                        double>
                                                                    animation,
                                                                Animation<
                                                                        double>
                                                                    secondaryAnimation) {
                                                              return FirstTimeLoginScreen();
                                                            },
                                                            transitionsBuilder:
                                                                (BuildContext
                                                                        context,
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
                                                                          begin: Offset(
                                                                              1.0,
                                                                              0.0),
                                                                          end: Offset(
                                                                              0.0,
                                                                              0.0))
                                                                      .animate(
                                                                          animation),
                                                                  child: child,
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
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                          }); */
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: MyAutoPilotStyles.appColor,
                    ),
                    child: Text(
                      'ADD USER',
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
    );
  }

  FutureOr<bool> onWillPop() {
    widget.pageController.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    return false;
  }
}
