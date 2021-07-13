import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/material_rounded_date_picker_style.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/material_rounded_year_picker_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const SearchScreen(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _startFromDateController =
      TextEditingController();

  final Color selectedBackgroundColour = MyAutoPilotStyles.appColor;
  final Color selectedTextColour = Colors.white;
  final Color selectedDropDownColour = Colors.white;

  final Color unselectedBackgroundColour = Colors.white;
  final Color unselectedTextColour = HexColor('#707070');
  final Color unselectedDropDownColour = MyAutoPilotStyles.appColor;

  bool isSelectedDates = false;
  bool isSelectedAssignment = false;
  bool isSelectedTaskType = true;

  List<Map<String, dynamic>> searchResults = [];
  List<Widget> searchCards = [];

  DateTime startFromDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {},
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
                      'assets/images/search.svg',
                      color: HexColor('#C9C9C9'),
                      //semanticsLabel: 'Email Mobile',
                      height: 10,
                      width: 10,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor('#C9C9C9'),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyAutoPilotStyles.appColor),
                  ),
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(
                    fontSize: 14,
                    color: HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Filter By',
                    style: GoogleFonts.notoSans(
                      fontSize: 12,
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.normal,
                      //decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (builder) {
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: ConstrainedBox(
                                constraints: BoxConstraints.tight(
                                  Size(
                                      MediaQuery.of(context).size.width *
                                          90 /
                                          100,
                                      MediaQuery.of(context).size.height *
                                          60 /
                                          100),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(20.0),
                                      topRight: const Radius.circular(20.0),
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
                                              'Add Date Filter',
                                              style: GoogleFonts.notoSerif(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    MyAutoPilotStyles.appColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Start Date
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 40,
                                          left: 30,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Start Date',
                                              style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#707070'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                          top: 10,
                                          left: 30,
                                          right: 40,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    35 /
                                                    100,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    //final DateTime? picked =
                                                    /* await showCustomDatePicker(
                                                      confirmText: 'PROCEED',
                                                      cancelText: 'CANCEL',
                                                      context: context,
                                                      initialDate:
                                                          startFromDate,
                                                      firstDate:
                                                          DateTime(1900, 1),
                                                      lastDate: DateTime(2101),
                                                    ); */

                                                    DateTime? newDateTime =
                                                        await showCustomDatePicker(
                                                      initialDatePickerMode:
                                                          DatePickerMode.day,
                                                      initialDate:
                                                          startFromDate,
                                                      firstDate: DateTime(
                                                          startFromDate.year -
                                                              100),
                                                      lastDate: DateTime(
                                                          startFromDate.year +
                                                              100),
                                                      context: context,
                                                      height: 300,
                                                      //theme: ThemeData.dark(),
                                                      /* theme: ThemeData(
                                                        primaryColor:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        accentColor:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        dialogBackgroundColor:
                                                            Colors.purple[50],
                                                        textTheme: TextTheme(
                                                          bodyText2: TextStyle(
                                                            color: HexColor(
                                                                '#707070'),
                                                          ),
                                                          caption: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        disabledColor:
                                                            Colors.orange,
                                                        accentTextTheme:
                                                            TextTheme(
                                                          bodyText1: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ), */
                                                      theme: ThemeData(
                                                        primaryColor:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                      ),
                                                      styleYearPicker:
                                                          MaterialRoundedYearPickerStyle(
                                                        textStyleYear:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                        textStyleYearSelected:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                        heightYearRow: 50,
                                                        //backgroundPicker: Colors
                                                        //.deepPurple[400],
                                                      ),
                                                      styleDatePicker:
                                                          MaterialRoundedDatePickerStyle(
                                                        textStyleYearButton:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        textStyleDayButton:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        textStyleDayHeader:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Colors.grey[800],
                                                        ),
                                                        paddingMonthHeader:
                                                            EdgeInsets.only(
                                                                top: 12),
                                                        sizeArrow: 35,
                                                        colorArrowNext:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        colorArrowPrevious:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        textStyleDayOnCalendar:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                        textStyleDayOnCalendarSelected:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        decorationDateSelected:
                                                            BoxDecoration(
                                                                color:
                                                                    MyAutoPilotStyles
                                                                        .appColor,
                                                                shape: BoxShape
                                                                    .circle),
                                                        textStyleCurrentDayOnCalendar:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors
                                                              .greenAccent,
                                                        ),
                                                        textStyleDayOnCalendarDisabled:
                                                            GoogleFonts
                                                                .notoSerif(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white
                                                              .withOpacity(0.1),
                                                        ),
                                                        backgroundActionBar:
                                                            MyAutoPilotStyles
                                                                .appColor,
                                                        textStyleButtonPositive:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        textStyleButtonNegative:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                        ),
                                                        paddingActionBar:
                                                            EdgeInsets.all(0),
                                                        textStyleMonthYearHeader:
                                                            GoogleFonts
                                                                .notoSans(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: HexColor(
                                                              '#707070'),
                                                        ),
                                                      ),
                                                    );
                                                    print(newDateTime);
                                                    if (newDateTime != null) {
                                                      setState(() {
                                                        startFromDate =
                                                            newDateTime;
                                                        _startFromDateController
                                                            .text = DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(
                                                                startFromDate);
                                                      });
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0),
                                                    child: TextField(
                                                      style:
                                                          GoogleFonts.notoSerif(
                                                        fontSize: 14,
                                                        color:
                                                            HexColor('#707070'),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                      controller:
                                                          _startFromDateController,
                                                      textAlign:
                                                          TextAlign.right,
                                                      /* decoration:
                                                          InputDecoration(
                                                        labelStyle: GoogleFonts
                                                            .notoSerif(
                                                          fontSize: 14,
                                                          color: HexColor(
                                                              '#707070'),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ), */
                                                      enabled: false,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15,
                                                child: SvgPicture.asset(
                                                  'assets/images/calendar.svg',
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              )
                                            ]),
                                            Stack(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    35 /
                                                    100,
                                                child: TextField(
                                                  textAlign: TextAlign.left,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        GoogleFonts.notoSerif(
                                                      fontSize: 14,
                                                      color:
                                                          HexColor('#C9C9C9'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    enabled: false,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15,
                                                child: SvgPicture.asset(
                                                  'assets/images/calendar.svg',
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          left: 30,
                                          right: 40,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  35 /
                                                  100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(),
                                                  Text(
                                                    'From',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#707070'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  35 /
                                                  100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'To',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#707070'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ), // Target Date
                                      // Target Date
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 40,
                                          left: 30,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Target Date',
                                              style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#707070'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                          top: 10,
                                          left: 30,
                                          right: 40,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Stack(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    35 /
                                                    100,
                                                child: TextField(
                                                  textAlign: TextAlign.left,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        GoogleFonts.notoSerif(
                                                      fontSize: 14,
                                                      color:
                                                          HexColor('#C9C9C9'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    enabled: false,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15,
                                                child: SvgPicture.asset(
                                                  'assets/images/calendar.svg',
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              )
                                            ]),
                                            Stack(children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    35 /
                                                    100,
                                                child: TextField(
                                                  textAlign: TextAlign.left,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        GoogleFonts.notoSerif(
                                                      fontSize: 14,
                                                      color:
                                                          HexColor('#C9C9C9'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                    enabled: false,
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15,
                                                child: SvgPicture.asset(
                                                  'assets/images/calendar.svg',
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                  width: 25,
                                                  height: 25,
                                                ),
                                              )
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                          left: 30,
                                          right: 40,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  35 /
                                                  100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(),
                                                  Text(
                                                    'From',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#707070'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  35 /
                                                  100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'To',
                                                    style: GoogleFonts.notoSans(
                                                      fontSize: 10,
                                                      color:
                                                          HexColor('#707070'),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ), // Set Filter Button
                                      Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints.tightFor(
                                              width: 150, height: 55),
                                          child: ElevatedButton(
                                            onPressed: () async {
                                              /* if (!_isSmsOTPValid ||
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
                                          Animation<double>
                                              secondaryAnimation) {
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
                                              end: Offset(0.0, 0.0),
                                            ).animate(animation),
                                            child: child,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                });
                              } */
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              primary:
                                                  MyAutoPilotStyles.appColor,
                                            ),
                                            child: Text(
                                              'SET FILTER',
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
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      primary: isSelectedDates
                          ? selectedBackgroundColour
                          : unselectedBackgroundColour,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dates',
                          style: GoogleFonts.notoSerif(
                            fontSize: 12,
                            color: isSelectedDates
                                ? selectedTextColour
                                : unselectedTextColour,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: isSelectedDates
                              ? selectedDropDownColour
                              : unselectedDropDownColour,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      primary: isSelectedAssignment
                          ? selectedBackgroundColour
                          : unselectedBackgroundColour,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Assignment',
                          style: GoogleFonts.notoSerif(
                            fontSize: 12,
                            color: isSelectedAssignment
                                ? selectedTextColour
                                : unselectedTextColour,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        /* SizedBox(
                    width: 10,
                  ), */
                        Icon(
                          Icons.arrow_drop_down,
                          color: isSelectedAssignment
                              ? selectedDropDownColour
                              : unselectedDropDownColour,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      primary: isSelectedTaskType
                          ? selectedBackgroundColour
                          : unselectedBackgroundColour,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Task Type',
                          style: GoogleFonts.notoSerif(
                            fontSize: 12,
                            color: isSelectedTaskType
                                ? selectedTextColour
                                : unselectedTextColour,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        /* SizedBox(
                    width: 10,
                  ), */
                        Icon(
                          Icons.arrow_drop_down,
                          color: isSelectedTaskType
                              ? selectedDropDownColour
                              : unselectedDropDownColour,
                          size: 36,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: getSearchResults(),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getSearchResults() {
    searchResults = [];
    for (int i = 0; i < 10; i++) {
      searchResults.add({
        'Description': 'This is the small description of the tasks assigned.',
        'By': 'Sujoy Banerjee',
        'Due': DateTime.now()
      });
    }

    searchCards = [];
    for (int i = 0; i < searchResults.length; i++) {
      searchCards.add(
        Card(
          elevation: 5,
          shadowColor: Colors.black,
          //color: Colors.amber[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(2, 2),
              bottomRight: Radius.elliptical(2, 2),
              topLeft: Radius.elliptical(2, 2),
              bottomLeft: Radius.elliptical(2, 2),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 18,
              bottom: 18,
            ),
            height: 80,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchResults[i]['Description'].toString(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.notoSerif(
                    color: HexColor('#707070'),
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'By: ' + searchResults[i]['By'].toString(),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.notoSans(
                        color: HexColor('#707070'),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Due: ' +
                          DateFormat('dd MMM yyyy')
                              .format(searchResults[i]['Due']),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.notoSans(
                        color: HexColor('#707070'),
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }

    return searchCards;
  }
}
