import 'dart:async';
import 'dart:io';

import 'package:auto_pilot/screens/login_signup_screens/payment.dart';
import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:decorated_icon/decorated_icon.dart';

class AddUser1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  final bool isEdit;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const AddUser1({
    required this.scaffoldKey,
    required this.pageController,
    this.isEdit = false,

    /* required this.tabMenuSelected,
      required this.taskItemTapped, */
  });

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _subordinateCountController =
      TextEditingController();

  late bool _isUserNameValid;
  late bool _isPhoneValid;
  late bool _isEmailBlank; // This checks for blank email address
  late bool _isValidEmail; // This checks for valid email address
  late bool _isDepartmentValid;
  late bool _isDesignationValid;
  late bool _isLevelValid;
  late bool _isSubordinateCountValid;

  late String _validationText;
  late String _departmentText;
  late String _levelText;
  late String _countryISDCode;

  late int _timesTappedUserName;
  late int _timesTappedPhone;
  late int _timesTappedEmail;
  late int _timesTappedDesignation;
  late int _timesTappedSubordinateCount;

  //String baseUrl = Globals.baseUrl;

  List<String> departments = [
    "Department 1",
    "Department 2",
    "Department 3",
    "Department 4"
  ];

  List<String> levels = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
  ];

  Map<String, dynamic> selectedCountryISDCode = {};

  String uploadedFile = '';
  bool isFileUploaded = false;

  late FocusNode focusNodePhoneNumber;
  late FocusNode focusNodeEmail;
  late FocusNode focusNodeDesignation;
  late FocusNode focusNodeSubordinateCount;

  late double noOfUsers;
  late double amountPerYear;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    _validationText = 'Please fill in this field';
    _isUserNameValid = true;
    _isPhoneValid = true;
    _isEmailBlank = true;
    _isValidEmail = true;
    _isDepartmentValid = true;
    _isDesignationValid = true;
    _isLevelValid = true;
    _isSubordinateCountValid = true;
    _timesTappedUserName = 0;
    _timesTappedPhone = 0;
    _timesTappedEmail = 0;
    _timesTappedDesignation = 0;
    _timesTappedSubordinateCount = 0;

    focusNodePhoneNumber = FocusNode();
    focusNodeEmail = FocusNode();
    focusNodeDesignation = FocusNode();
    focusNodeSubordinateCount = FocusNode();

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

    _countryISDCode = 'ISD Code';
    selectedCountryISDCode = Globals.countryISDCodes
        .where((element) => element['name'] == 'India')
        .first;

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

    _departmentController.text = '';
    _departmentText = 'Department';

    _departmentController.addListener(() {
      if (_departmentController.text.isEmpty) {
        setState(() {
          _departmentText = 'Department';
          _isDepartmentValid = false;
        });
      } else {
        setState(() {
          _departmentText = '';
          _isDepartmentValid = true;
        });
      }
    });

    _designationController.addListener(() {
      if (_designationController.text.isEmpty && _timesTappedDesignation > 0) {
        setState(() {
          _isDesignationValid = false;
        });
      } else {
        setState(() {
          _isDesignationValid = true;
        });
      }
    });

    _levelController.text = '';
    _levelText = 'Level';

    _levelController.addListener(() {
      if (_levelController.text.isEmpty) {
        setState(() {
          _levelText = 'Level';
          _isLevelValid = false;
        });
      } else {
        setState(() {
          _levelText = '';
          _isLevelValid = true;
        });
      }
    });

    _subordinateCountController.addListener(() {
      if (_subordinateCountController.text.isEmpty &&
          _timesTappedSubordinateCount > 0) {
        setState(() {
          _isSubordinateCountValid = false;
        });
      } else {
        setState(() {
          _isSubordinateCountValid = true;
        });
      }
    });

    noOfUsers = 1.00;
    amountPerYear = 1000.00;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _userNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _departmentController.dispose();
    _designationController.dispose();
    _levelController.dispose();
    _subordinateCountController.dispose();

    focusNodePhoneNumber.dispose();
    focusNodeEmail.dispose();
    focusNodeDesignation.dispose();
    focusNodeSubordinateCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      key: widget.scaffoldKey,
      onWillPop: () => Future.sync(onWillPop),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              //height: MediaQuery.of(context).size.height,
              child: Form(
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
                        top: 5,
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
                          left: 40.0,
                          right: 40.0,
                          top: 5,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context)
                                .requestFocus(focusNodePhoneNumber);
                          },
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
                              top: 40.0,
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

                    // ISD Codes and Country Codes
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 40.0,
                        top: 20,
                      ),
                      child: Stack(
                        children: [
                          DropdownSearch<Map<String, dynamic>>(
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
                              /* shadows: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 8.0,
                                  offset: Offset(1.0, 2.0),
                                ),
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Colors.white,
                                ),
                              ], */
                            ),
                            showAsSuffixIcons: true,
                            validator: (v) =>
                                v == null ? "required field" : null,
                            dropdownSearchDecoration: InputDecoration(
                              labelStyle: GoogleFonts.notoSerif(
                                fontSize: 14,
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                //decoration: TextDecoration.underline,
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
                            maxHeight: 160,
                            showClearButton: false,
                            selectedItem: selectedCountryISDCode,
                            onChanged: (value) async {
                              selectedCountryISDCode = value!;
                              _countryISDCode = '';
                            },
                          ),
                          /* Positioned(
                              left: 50,
                              top: 10,
                              child: Text(_countryISDCode,
                                  style: GoogleFonts.notoSerif(
                                    fontSize: 14,
                                    color: HexColor('#C9C9C9'),
                                    fontWeight: FontWeight.normal,
                                    //decoration: TextDecoration.underline,
                                  )),
                            ) */
                        ],
                      ),
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          focusNode: focusNodePhoneNumber,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context).requestFocus(focusNodeEmail);
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
                          decoration: InputDecoration(
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
                              borderSide:
                                  BorderSide(color: MyAutoPilotStyles.appColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: MyAutoPilotStyles.appColor),
                            ),
                            hintText: 'Phone Number',
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
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          controller: _emailController,
                          onChanged: (value) {
                            _timesTappedEmail += 1;
                          },
                          focusNode: focusNodeEmail,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context)
                                .requestFocus(focusNodeDesignation);
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
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 40.0,
                        top: 20,
                      ),
                      child: Stack(
                        children: [
                          DropdownSearch<String>(
                            dropDownButton: DecoratedIcon(
                              Icons.arrow_drop_down,
                              size: 36,
                              color: MyAutoPilotStyles.appColor,
                              /* shadows: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 8.0,
                                  offset: Offset(1.0, 2.0),
                                ),
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Colors.white,
                                ),
                              ], */
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
                                scale: 0.7,
                                child: SvgPicture.asset(
                                  'assets/images/department.svg',
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
                            showSelectedItem: false,
                            items: departments,
                            maxHeight: (departments.length) <= 3
                                ? (departments.length).toDouble() * 55
                                : 160,
                            showClearButton: false,
                            onChanged: (value) async {
                              _departmentController.text = value ?? '';
                              /* ChefPrintFormData chefPrintFormData = ChefPrintFormData(
                fieldName: 'store_Number_Of_Auto_Print_Chef', value: value);
                    
                        var result = {};
                        await updateSettings(chefPrintFormData).then((value) {
                          result = value;
                          ShowMessage.showSnackBarWithStatus(
                  context, result['msg'], 'success');
                          setState(() {});
                        }).onError((error, stackTrace) {
                          ShowMessage.showSnackBarWithStatus(context,
                  'Could not update data, please try again later.', 'error');
                    
                          setState(() {});
                        }).timeout(
                          Duration(seconds: 5),
                          onTimeout: () {
                ShowMessage.showSnackBarWithStatus(context,
                    'Could not update data, please try again later.', 'error');
                    
                setState(() {});
                          },
                        ); */
                            },
                            selectedItem: _departmentController.text,
                          ),
                          Positioned(
                            left: 50,
                            top: 10,
                            child: Text(_departmentText,
                                style: GoogleFonts.notoSerif(
                                  fontSize: 14,
                                  color: HexColor('#C9C9C9'),
                                  fontWeight: FontWeight.normal,
                                  //decoration: TextDecoration.underline,
                                )),
                          ),
                          !_isDepartmentValid
                              ? Positioned(
                                  right: 10.0,
                                  top: 35.0,
                                  child: new Container(
                                    child: Text(
                                      'Please select a department',
                                      style: TextStyle(
                                        color: Globals.validationColor,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          controller: _designationController,
                          onChanged: (value) {
                            _timesTappedDesignation += 1;
                          },
                          focusNode: focusNodeDesignation,
                          onFieldSubmitted: (v) {
                            FocusScope.of(context)
                                .requestFocus(focusNodeSubordinateCount);
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
                                'assets/images/designation.svg',
                                color: MyAutoPilotStyles.appColor,
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
                            hintText: 'Designation',
                            hintStyle: GoogleFonts.notoSerif(
                              fontSize: 14,
                              color: HexColor('#C9C9C9'),
                              fontWeight: FontWeight.normal,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      !_isDesignationValid
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
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 40.0,
                        top: 20,
                      ),
                      child: Stack(
                        children: [
                          DropdownSearch<String>(
                            dropDownButton: DecoratedIcon(
                              Icons.arrow_drop_down,
                              size: 36,
                              color: MyAutoPilotStyles.appColor,
                              /* shadows: [
                                BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 8.0,
                                  offset: Offset(1.0, 2.0),
                                ),
                                BoxShadow(
                                  blurRadius: 12.0,
                                  color: Colors.white,
                                ),
                              ], */
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
                                scale: 0.7,
                                child: SvgPicture.asset(
                                  'assets/images/level.svg',
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
                            showSelectedItem: false,
                            items: levels,
                            maxHeight: (levels.length) <= 3
                                ? (levels.length).toDouble() * 55
                                : 160,
                            showClearButton: false,
                            onChanged: (value) async {
                              _levelController.text = value ?? '';
                            },
                            selectedItem: _levelController.text,
                          ),
                          Positioned(
                            left: 50,
                            top: 10,
                            child: Text(_levelText,
                                style: GoogleFonts.notoSerif(
                                  fontSize: 14,
                                  color: HexColor('#C9C9C9'),
                                  fontWeight: FontWeight.normal,
                                  //decoration: TextDecoration.underline,
                                )),
                          ),
                          !_isLevelValid
                              ? Positioned(
                                  right: 10.0,
                                  top: 35.0,
                                  child: new Container(
                                    child: Text(
                                      'Please select a level',
                                      style: TextStyle(
                                        color: Globals.validationColor,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          right: 40.0,
                          top: 20,
                        ),
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          textInputAction: TextInputAction.done,
                          controller: _subordinateCountController,
                          onChanged: (value) {
                            _timesTappedSubordinateCount += 1;
                          },
                          focusNode: focusNodeSubordinateCount,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ],
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
                                'assets/images/subourdiante.svg',
                                color: MyAutoPilotStyles.appColor,
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
                            hintText: 'Subordinate Count',
                            hintStyle: GoogleFonts.notoSerif(
                              fontSize: 14,
                              color: HexColor('#C9C9C9'),
                              fontWeight: FontWeight.normal,
                              //decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      !_isSubordinateCountValid
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
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 40.0,
                        top: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (builder) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setModalState) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints.tight(
                                            Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    90 /
                                                    100,
                                                450),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(20.0),
                                                topRight:
                                                    const Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 30,
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Bulk upload users',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              MyAutoPilotStyles
                                                                  .appColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 20,
                                                    //left: 30,
                                                  ),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      75 /
                                                      100,
                                                  child: Text(
                                                    'Make sure that you have maintained the format structure provided to upload your users.',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color:
                                                          HexColor('#707070'),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                    //left: 30,
                                                  ),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      75 /
                                                      100,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Upload the file and create your users.',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Upload File Button
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                        top: 20,
                                                        left: 35,
                                                      ),
                                                      child: ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints
                                                                .tightFor(
                                                                    width: 200,
                                                                    height: 55),
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            FilePickerResult?
                                                                result =
                                                                await FilePicker
                                                                    .platform
                                                                    .pickFiles(
                                                                        /*
                                                                        type: FileType.custom,
                                                                        allowedExtensions: ['csv','jpg', 'pdf', 'doc'],
                                                                        */
                                                                        );

                                                            if (result !=
                                                                null) {
                                                              File file = File(
                                                                  result
                                                                      .files
                                                                      .single
                                                                      .path!);
                                                              PlatformFile
                                                                  fileDetails =
                                                                  result.files
                                                                      .first;

                                                              print(
                                                                  '***************${fileDetails.name}');
                                                              print(
                                                                  '***************${fileDetails.extension}');
                                                              print(
                                                                  '***************${fileDetails.path}');
                                                              print(
                                                                  '####################${file.path}');
                                                              setModalState(() {
                                                                isFileUploaded =
                                                                    true;
                                                                uploadedFile =
                                                                    fileDetails
                                                                        .name;
                                                              });
                                                            } else {
                                                              // User canceled the picker
                                                              setModalState(() {
                                                                isFileUploaded =
                                                                    false;
                                                              });
                                                            }
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            primary:
                                                                MyAutoPilotStyles
                                                                    .appColor,
                                                          ),
                                                          child: Text(
                                                            'Upload File',
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // This is the widget where the uploaded file name can be seen
                                                // and also can be cancelled.
                                                Opacity(
                                                  opacity:
                                                      isFileUploaded ? 1 : 0,
                                                  child: Stack(children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                        top: 30,
                                                        left: 30,
                                                      ),
                                                      //height: 100,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            uploadedFile,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              color: HexColor(
                                                                  '#707070'),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 20,
                                                      top: 10,
                                                      child: ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints
                                                                .tightFor(
                                                                    width: 35,
                                                                    height: 35),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  50.0),
                                                            ),
                                                            border: Border.all(
                                                              color: HexColor(
                                                                  '#C9C9C9'),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: ClipOval(
                                                            child: Material(
                                                              color: Colors
                                                                  .white, // Button color
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .red, // Splash color
                                                                onTap: () {
                                                                  setModalState(
                                                                      () {
                                                                    isFileUploaded =
                                                                        false;
                                                                  });
                                                                },
                                                                child: SizedBox(
                                                                  width: 56,
                                                                  height: 56,
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: HexColor(
                                                                        '#C9C9C9'),
                                                                    size: 16,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                ),

                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  child: ConstrainedBox(
                                                    constraints:
                                                        BoxConstraints.tightFor(
                                                            width: 150,
                                                            height: 55),
                                                    child: ElevatedButton(
                                                      onPressed: () async {},
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
                                                        'ADD USERS',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    });
                                  });
                              isFileUploaded = false;
                            },
                            child: Text(
                              'Bulk Upload',
                              style: GoogleFonts.notoSerif(
                                color: MyAutoPilotStyles.appColor,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                Text(
                                  '(',
                                  style: GoogleFonts.notoSerif(
                                    color: MyAutoPilotStyles.appColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Download Format',
                                  style: GoogleFonts.notoSerif(
                                    color: MyAutoPilotStyles.appColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Text(
                                  ')',
                                  style: GoogleFonts.notoSerif(
                                    color: MyAutoPilotStyles.appColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
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
                                !_isPhoneValid ||
                                _phoneNumberController.text.isEmpty ||
                                !_isEmailBlank ||
                                _emailController.text.isEmpty ||
                                !_isDepartmentValid ||
                                _departmentController.text.isEmpty ||
                                !_isDesignationValid ||
                                _designationController.text.isEmpty ||
                                !_isLevelValid ||
                                _levelController.text.isEmpty ||
                                !_isSubordinateCountValid ||
                                _subordinateCountController.text.isEmpty) {
                              if (_userNameController.text.isEmpty)
                                _isUserNameValid = false;
                              if (_phoneNumberController.text.isEmpty)
                                _isPhoneValid = false;
                              if (_emailController.text.isEmpty)
                                _isEmailBlank = false;
                              if (_departmentController.text.isEmpty)
                                _isDepartmentValid = false;
                              if (_designationController.text.isEmpty)
                                _isDesignationValid = false;
                              if (_levelController.text.isEmpty)
                                _isLevelValid = false;
                              if (_subordinateCountController.text.isEmpty)
                                _isSubordinateCountValid = false;

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
                            } else {
                              setState(() {
                                _isUserNameValid = true;
                                _isPhoneValid = true;
                                _isEmailBlank = true;
                                _isValidEmail = true;
                                _isDepartmentValid = true;
                                _isDesignationValid = true;
                                _isLevelValid = true;
                                _isSubordinateCountValid = true;
                              });

                              // API Call, if plan subscribed by the user has reached maximum users
                              // then show a screen where users can recharge for more users.

                              await showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  builder: (builder) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setModalState) {
                                      return Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints.tight(
                                            Size(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    90 /
                                                    100,
                                                460),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(20.0),
                                                topRight:
                                                    const Radius.circular(20.0),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 30,
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Top-up your Users',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              MyAutoPilotStyles
                                                                  .appColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Getting short on your users!',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'No worries we have your covered.',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'Top up your users at just Rs. 500 per year',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        'and continue your journey to efficiency.',
                                                        style: GoogleFonts
                                                            .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Show the number of Users here
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 30,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${noOfUsers.toInt()}',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              MyAutoPilotStyles
                                                                  .appColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Slider
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 30,
                                                    right: 30,
                                                  ),
                                                  child: SliderTheme(
                                                    data: SliderThemeData(
                                                        thumbColor:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        /* thumbShape:
                                                          RoundSliderThumbShape(
                                                        enabledThumbRadius: 20,
                                                      ), */
                                                        activeTrackColor:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        inactiveTrackColor:
                                                            HexColor(
                                                                '#DDDDDD')),
                                                    child: Slider(
                                                      value: noOfUsers,
                                                      onChanged:
                                                          (double value) {
                                                        setModalState(() {
                                                          noOfUsers = value;
                                                          // Calculate amountPerYear value
                                                          if (noOfUsers <= 25)
                                                            amountPerYear =
                                                                1000.00;
                                                          else if (noOfUsers <=
                                                              50)
                                                            amountPerYear =
                                                                1000.00 * 1.75;
                                                          else if (noOfUsers <=
                                                              75)
                                                            amountPerYear =
                                                                1000.00 *
                                                                    1.75 *
                                                                    1.5;
                                                          else
                                                            amountPerYear =
                                                                1000.00 *
                                                                    1.75 *
                                                                    1.5 *
                                                                    1.25;
                                                        });
                                                      },
                                                      //divisions: 3,
                                                      label: '$noOfUsers',
                                                      min: 1,
                                                      max: 100,
                                                    ),
                                                  ),
                                                ),
                                                // Plus and Minus button to control the slider
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    left: 40,
                                                    right: 40,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      // Minus button
                                                      ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints
                                                                .tightFor(
                                                                    width: 35,
                                                                    height: 35),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  50.0),
                                                            ),
                                                            /* border: Border.all(
                                                              color: HexColor(
                                                                  '#C9C9C9'),
                                                              width: 1.0,
                                                            ), */
                                                          ),
                                                          child: ClipOval(
                                                            child: Material(
                                                              color: Colors
                                                                  .white, // Button color
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .blue, // Splash color
                                                                onTap: () {
                                                                  setModalState(
                                                                      () {
                                                                    if (noOfUsers >
                                                                        1.00)
                                                                      noOfUsers =
                                                                          noOfUsers -
                                                                              1.00;
                                                                  });
                                                                },
                                                                child: SizedBox(
                                                                  width: 56,
                                                                  height: 56,
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: HexColor(
                                                                        '#707070'),
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // Add Button
                                                      ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints
                                                                .tightFor(
                                                                    width: 35,
                                                                    height: 35),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  50.0),
                                                            ),
                                                            /* border: Border.all(
                                                              color: HexColor(
                                                                  '#C9C9C9'),
                                                              width: 1.0,
                                                            ), */
                                                          ),
                                                          child: ClipOval(
                                                            child: Material(
                                                              color: Colors
                                                                  .white, // Button color
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .blue, // Splash color
                                                                onTap: () {
                                                                  setModalState(
                                                                      () {
                                                                    if (noOfUsers <
                                                                        100.00)
                                                                      noOfUsers =
                                                                          noOfUsers +
                                                                              1.00;
                                                                  });
                                                                },
                                                                child: SizedBox(
                                                                  width: 56,
                                                                  height: 56,
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: HexColor(
                                                                        '#707070'),
                                                                    size: 24,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Show the amount per year costing here
                                                Container(
                                                  margin: EdgeInsets.only(
                                                    top: 10,
                                                    //left: 30,
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Amount: ',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              MyAutoPilotStyles
                                                                  .appColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' Rs ${amountPerYear.toStringAsFixed(2)} ',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                      Text(
                                                        'per year',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // Top Up Button
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  child: ConstrainedBox(
                                                    constraints:
                                                        BoxConstraints.tightFor(
                                                            width: 150,
                                                            height: 55),
                                                    child: ElevatedButton(
                                                      onPressed: () async {
                                                        Navigator.pop(context);
                                                        await Navigator.push(
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
                                                              return PaymentScreen(
                                                                  calledFrom:
                                                                      'add_user_1.dart',
                                                                  amountPerYear:
                                                                      amountPerYear);
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
                                                                  position:
                                                                      Tween(
                                                                    begin:
                                                                        Offset(
                                                                            1.0,
                                                                            0.0),
                                                                    end: Offset(
                                                                        0.0,
                                                                        0.0),
                                                                  ).animate(
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
                                                        'TOP UP',
                                                        style: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 17,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                    });
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
          ),
        ),
      ),
    );
  }

  FutureOr<bool> onWillPop() async {
    // Reset the page to it's initial state
    // before going to the previous screen
    setState(() {
      _isUserNameValid = true;
      _isPhoneValid = true;
      _isEmailBlank = true;
      _isValidEmail = true;
      _isDepartmentValid = true;
      _isDesignationValid = true;
      _isLevelValid = true;
      _isSubordinateCountValid = true;
      _departmentText = 'Department';
      _levelText = 'Level';
    });
    await widget.pageController.animateToPage(
      5,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    return false;
  }
}
