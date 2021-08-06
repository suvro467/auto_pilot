import 'dart:io';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:auto_pilot/shared/widgets/masked_text_input_formatter.dart';
import 'package:auto_pilot/shared/widgets/rounded_rectangular_shadow.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
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
  final TextEditingController _customerNameController = TextEditingController();

  late String _validationText;
  late bool _isCustomerNameValid;

  late int _timesTappedCustomerName;

  @override
  void initState() {
    super.initState();

    _validationText = 'Please fill in this field';
    _isCustomerNameValid = true;

    _timesTappedCustomerName = 0;

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
  }

  @override
  void dispose() {
    _customerNameController.dispose();
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
                              left: 30,
                              top: 10,
                            ),
                            child: Text(
                              'Complete Payment',
                              style: GoogleFonts.notoSerif(
                                fontSize: 16,
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
                          left: 30,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: SvgPicture.asset(
                                'assets/images/american-express.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: SvgPicture.asset(
                                'assets/images/credit-card.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: SvgPicture.asset(
                                'assets/images/mastercard.svg',
                                height: 40,
                                width: 40,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SvgPicture.asset(
                                'assets/images/upi.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Card(
                          elevation: 4,
                          shadowColor: Colors.black,
                          //color: Colors.amber[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical(15, 15),
                              bottomRight: Radius.elliptical(15, 15),
                              topLeft: Radius.elliptical(15, 15),
                              bottomLeft: Radius.elliptical(15, 15),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width * 85 / 100,
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              top: 10,
                              right: 10.0,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Name on Card',
                                        style: GoogleFonts.notoSans(
                                          fontSize: 12,
                                          color: HexColor('#707070'),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 4,
                                        shadowColor: Colors.black,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.elliptical(5, 5),
                                          ),
                                        ),
                                        child: Stack(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 5.0,
                                              right: 5,
                                            ),
                                            child: TextFormField(
                                              validator: (value) {
                                                return null;
                                              },
                                              controller:
                                                  _customerNameController,
                                              onChanged: (value) {
                                                _timesTappedCustomerName += 1;
                                              },
                                              textInputAction:
                                                  TextInputAction.next,
                                              cursorColor:
                                                  Colors.grey.withOpacity(0.8),
                                              style: GoogleFonts.notoSans(
                                                fontSize: 16,
                                                color: HexColor('#707070'),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              decoration: InputDecoration(
                                                //hintText: 'Name',
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          !_isCustomerNameValid
                                              ? Positioned(
                                                  right: 5.0,
                                                  top: 30.0,
                                                  child: new Container(
                                                    child: Text(
                                                      '$_validationText',
                                                      style: TextStyle(
                                                        color: Globals
                                                            .validationColor,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container()
                                        ]),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Card Number',
                                        style: GoogleFonts.notoSans(
                                          fontSize: 12,
                                          color: HexColor('#707070'),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 4,
                                        shadowColor: Colors.black,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.elliptical(5, 5),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5,
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              MaskedTextInputFormatter(
                                                mask: 'xxxx xxxx xxxx xxxx',
                                                separator: ' ',
                                              ),
                                            ],
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorColor:
                                                Colors.grey.withOpacity(0.8),
                                            style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              color: HexColor('#707070'),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            decoration: InputDecoration(
                                              //hintText: 'Name',
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 2,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Expiry',
                                          style: GoogleFonts.notoSans(
                                            fontSize: 12,
                                            color: HexColor('#707070'),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'CVV',
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
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 4,
                                        shadowColor: Colors.black,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.elliptical(5, 5),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5,
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              MaskedTextInputFormatter(
                                                mask: 'xx/xx',
                                                separator: '/',
                                              ),
                                            ],
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorColor:
                                                Colors.grey.withOpacity(0.8),
                                            style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              color: HexColor('#707070'),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            decoration: InputDecoration(
                                              hintText: 'MM / YY',
                                              hintStyle: GoogleFonts.notoSans(
                                                fontSize: 16,
                                                color: HexColor('#707070'),
                                                fontWeight: FontWeight.normal,
                                              ),
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Card(
                                        elevation: 4,
                                        shadowColor: Colors.black,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.elliptical(5, 5),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5.0,
                                            right: 5,
                                          ),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  3)
                                            ],
                                            textInputAction:
                                                TextInputAction.done,
                                            cursorColor:
                                                Colors.grey.withOpacity(0.8),
                                            style: GoogleFonts.notoSans(
                                              fontSize: 16,
                                              color: HexColor('#707070'),
                                              fontWeight: FontWeight.normal,
                                            ),
                                            decoration: InputDecoration(
                                              //hintText: 'Name',
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints.tightFor(
                                        width: 130, height: 55),
                                    child: ElevatedButton(
                                        onPressed: () async {
                                          if (!_isCustomerNameValid ||
                                              _customerNameController
                                                  .text.isEmpty) {
                                            if (_customerNameController
                                                .text.isEmpty)
                                              _isCustomerNameValid = false;

                                            setState(() {});
                                            ShowMessage.showFlushBar(context,
                                                'Please rectify the errors.');
                                          } else {
                                            setState(() {
                                              _isCustomerNameValid = true;
                                            });

                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return LoadingDialog();
                                              },
                                            );

                                            // API call for Sign Up

                                            await Future.delayed(
                                                new Duration(seconds: 3), () {
                                              Navigator.pop(
                                                  context); //pop dialog
                                            }).then((value) {
                                              // After successfull signup, show a dialog to return to the login screen.
                                              // If sign up is successfull without any errors, show the following screen
                                              /* showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return WillPopScope(
                                                    onWillPop: () async =>
                                                        false, // Need to change this to false later.
                                                    child: Material(
                                                      type: MaterialType
                                                          .transparency,
                                                      child: Center(
                                                        child: SizedBox(
                                                          //width: width,
                                                          height: 400,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  blurRadius:
                                                                      10.0,
                                                                  offset:
                                                                      const Offset(
                                                                          0.0,
                                                                          10.0),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  height: 75.0,
                                                                  width: 75.0,
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              50),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .transparent,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(0.2),
                                                                        offset: Offset(
                                                                            0.0,
                                                                            1.0), //(x,y)
                                                                        blurRadius:
                                                                            1.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Image(
                                                                      image: AssetImage(
                                                                          'assets/icons/logopng.png')),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              20),
                                                                  child: Text(
                                                                    'You can now login',
                                                                    style: GoogleFonts
                                                                        .notoSerif(
                                                                      fontSize:
                                                                          16,
                                                                      color: MyAutoPilotStyles
                                                                          .appColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      //decoration: TextDecoration.underline,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 20,
                                                                    left: 20,
                                                                    right: 20,
                                                                  ),
                                                                  child: Text(
                                                                    'Your password has been set. You can now',
                                                                    style: GoogleFonts
                                                                        .notoSans(
                                                                      fontSize:
                                                                          14,
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
                                                                      fontSize:
                                                                          14,
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
                                                                      EdgeInsets
                                                                          .all(
                                                                              25),
                                                                  child:
                                                                      ConstrainedBox(
                                                                    constraints: BoxConstraints.tightFor(
                                                                        width:
                                                                            160,
                                                                        height:
                                                                            55),
                                                                    child: ElevatedButton(
                                                                        onPressed: () async {
                                                                          await Navigator
                                                                              .pushReplacement(
                                                                            context,
                                                                            PageRouteBuilder(
                                                                              transitionDuration: Duration(milliseconds: 500),
                                                                              pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                                                                return FirstTimeLoginScreen();
                                                                              },
                                                                              transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
                                                                                return Align(
                                                                                  child: SlideTransition(
                                                                                    position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(animation),
                                                                                    child: child,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                        style: ElevatedButton.styleFrom(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0),
                                                                          ),
                                                                          primary:
                                                                              MyAutoPilotStyles.appColor,
                                                                        ),
                                                                        child: Text(
                                                                          'GO TO LOGIN',
                                                                          style:
                                                                              GoogleFonts.notoSerif(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
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
                                             */
                                            });
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          primary: MyAutoPilotStyles.appColor,
                                        ),
                                        child: Text(
                                          'PROCEED',
                                          style: GoogleFonts.notoSerif(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                /* Container(
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
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
