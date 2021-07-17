import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/custom_date_picker.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/material_rounded_date_picker_style.dart';
import 'package:auto_pilot/shared/widgets/custom_date_picker/material_rounded_year_picker_style.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
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
  final TextEditingController _startToDateController = TextEditingController();
  final TextEditingController _targetFromDateController =
      TextEditingController();
  final TextEditingController _targetToDateController = TextEditingController();

  final Color selectedBackgroundColour = MyAutoPilotStyles.appColor;
  final Color selectedTextColour = Colors.white;
  final Color selectedDropDownColour = Colors.white;

  final Color unselectedBackgroundColour = Colors.white;
  final Color unselectedTextColour = HexColor('#707070');
  final Color unselectedDropDownColour = MyAutoPilotStyles.appColor;

  bool isSelectedDates = false;
  bool isSelectedAssignment = false;
  bool isSelectedTaskType = false;

  bool isSelectedTasksAssignedTo = false;
  bool isSelectedTasksAssignedBy = false;

  List<Map<String, dynamic>> searchResults = [];
  List<Widget> searchCards = [];

  DateTime startFromDate = DateTime.now();
  DateTime startToDate = DateTime.now().add(Duration(days: 10));
  DateTime targetFromDate = DateTime.now();
  DateTime targetToDate = DateTime.now().add(Duration(days: 10));

  List<String> tasksAssignedToMeValues = [
    '1dshdsddsasasasl;k asdskadksaksd,',
    '2,',
    '3,',
    '4,',
    '5,',
    '6,',
    '7,',
    '8,',
    '9,',
    '10',
    '11,',
  ];

  List<String> tasksAssignedByMeValues = [
    'ABCDEFGH,',
    'dsaasdasasj,',
    'ewowieowoei,',
    'euwiwuewjj,',
    'dskdsjsdsds5,',
    '4jrrsdsd,',
    'rrrrr rr r r,',
    'yyyyyyyy,',
    'ewewew,',
    '10eww',
    'dasjdkjas,',
  ];

  //var columnGetTasksAssignedToMe;

  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _startFromDateController.dispose();
    _startToDateController.dispose();
    _targetFromDateController.dispose();
    _targetToDateController.dispose();

    super.dispose();
  }

  columnGetTasksAssignedToMe(StateSetter setModalState) {
    return Column(children: getTasksAssignedToMe(setModalState));
  }

  columnGetTasksAssignedByMe(StateSetter setModalState) {
    return Column(children: getTasksAssignedByMe(setModalState));
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
                                      430),
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
                                                          fontSize: 33,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        // This property is not working
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
                                                      minLines: 1,
                                                      maxLines: 1,
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
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    DateTime? newDateTime =
                                                        await showCustomDatePicker(
                                                      initialDatePickerMode:
                                                          DatePickerMode.day,
                                                      initialDate: startToDate,
                                                      firstDate: DateTime(
                                                          startToDate.year -
                                                              100),
                                                      lastDate: DateTime(
                                                          startToDate.year +
                                                              100),
                                                      context: context,
                                                      height: 300,
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
                                                          fontSize: 33,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        // This property is not working
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
                                                        startToDate =
                                                            newDateTime;
                                                        _startToDateController
                                                            .text = DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(
                                                                startToDate);
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
                                                          _startToDateController,
                                                      textAlign:
                                                          TextAlign.right,
                                                      minLines: 1,
                                                      maxLines: 1,
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
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    DateTime? newDateTime =
                                                        await showCustomDatePicker(
                                                      initialDatePickerMode:
                                                          DatePickerMode.day,
                                                      initialDate:
                                                          targetFromDate,
                                                      firstDate: DateTime(
                                                          targetFromDate.year -
                                                              100),
                                                      lastDate: DateTime(
                                                          targetFromDate.year +
                                                              100),
                                                      context: context,
                                                      height: 300,
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
                                                          fontSize: 33,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        // This property is not working
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
                                                        targetFromDate =
                                                            newDateTime;
                                                        _targetFromDateController
                                                            .text = DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(
                                                                targetFromDate);
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
                                                          _targetFromDateController,
                                                      textAlign:
                                                          TextAlign.right,
                                                      minLines: 1,
                                                      maxLines: 1,
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
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    DateTime? newDateTime =
                                                        await showCustomDatePicker(
                                                      initialDatePickerMode:
                                                          DatePickerMode.day,
                                                      initialDate: targetToDate,
                                                      firstDate: DateTime(
                                                          targetToDate.year -
                                                              100),
                                                      lastDate: DateTime(
                                                          targetToDate.year +
                                                              100),
                                                      context: context,
                                                      height: 300,
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
                                                          fontSize: 33,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white,
                                                        ),
                                                        // This property is not working
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
                                                        targetToDate =
                                                            newDateTime;
                                                        _targetToDateController
                                                            .text = DateFormat(
                                                                'dd MMM yyyy')
                                                            .format(
                                                                targetToDate);
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
                                                          _targetToDateController,
                                                      textAlign:
                                                          TextAlign.right,
                                                      minLines: 1,
                                                      maxLines: 1,
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
                                              if (_startFromDateController
                                                      .text.isEmpty &&
                                                  _startToDateController
                                                      .text.isEmpty &&
                                                  _targetFromDateController
                                                      .text.isEmpty &&
                                                  _targetToDateController
                                                      .text.isEmpty) {
                                                setState(() {
                                                  isSelectedDates = false;
                                                });
                                                /* ShowMessage.showFlushBar(
                                                    context,
                                                    'Please select all the dates.'); */
                                              } else {
                                                setState(() {
                                                  isSelectedDates = true;
                                                });
                                              }

                                              Navigator.pop(context);
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
                    onPressed: () async {
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
                                        MediaQuery.of(context).size.width *
                                            90 /
                                            100,
                                        585),
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
                                                'Add Task Assignment Filter',
                                                style: GoogleFonts.notoSerif(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: MyAutoPilotStyles
                                                      .appColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // CheckBox
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 20,
                                            left: 0,
                                            bottom: 0,
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          //height: 100,
                                          child: CheckboxListTile(
                                            activeColor: HexColor('#707070'),
                                            title: Text(
                                              'Tasks assigned to me',
                                              style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#707070'),
                                              ),
                                            ),
                                            dense: true,
                                            checkColor: Colors.white,
                                            value: isSelectedTasksAssignedTo,
                                            onChanged: (newValue) {
                                              setModalState(() {
                                                isSelectedTasksAssignedTo =
                                                    !isSelectedTasksAssignedTo;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                        Card(
                                          margin: EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                          ),
                                          elevation: 2,
                                          shadowColor: Colors.black,
                                          color: Colors.amber[100],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.elliptical(15, 15),
                                              bottomRight:
                                                  Radius.elliptical(15, 15),
                                              topLeft:
                                                  Radius.elliptical(15, 15),
                                              bottomLeft:
                                                  Radius.elliptical(15, 15),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            height: 150,
                                            color: Colors.white,
                                            child: SingleChildScrollView(
                                              child: columnGetTasksAssignedToMe(
                                                  setModalState),
                                            ),
                                          ),
                                        ),
                                        // CheckBox
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 20,
                                            left: 0,
                                            bottom: 0,
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          //height: 100,
                                          child: CheckboxListTile(
                                            activeColor: HexColor('#707070'),
                                            title: Text(
                                              'Tasks assigned by me',
                                              style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#707070'),
                                              ),
                                            ),
                                            dense: true,
                                            checkColor: Colors.white,
                                            value: isSelectedTasksAssignedBy,
                                            onChanged: (newValue) {
                                              setModalState(() {
                                                isSelectedTasksAssignedBy =
                                                    !isSelectedTasksAssignedBy;
                                              });
                                            },
                                            controlAffinity: ListTileControlAffinity
                                                .leading, //  <-- leading Checkbox
                                          ),
                                        ),
                                        Card(
                                          margin: EdgeInsets.only(
                                            left: 30,
                                            right: 30,
                                          ),
                                          elevation: 2,
                                          shadowColor: Colors.black,
                                          color: Colors.amber[100],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight:
                                                  Radius.elliptical(15, 15),
                                              bottomRight:
                                                  Radius.elliptical(15, 15),
                                              topLeft:
                                                  Radius.elliptical(15, 15),
                                              bottomLeft:
                                                  Radius.elliptical(15, 15),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 10,
                                              bottom: 10,
                                            ),
                                            height: 150,
                                            color: Colors.white,
                                            child: SingleChildScrollView(
                                              child: columnGetTasksAssignedByMe(
                                                  setModalState),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 20),
                                          child: ConstrainedBox(
                                            constraints:
                                                BoxConstraints.tightFor(
                                                    width: 150, height: 55),
                                            child: ElevatedButton(
                                              onPressed: () async {},
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
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
                          });
                    },
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  List<Widget> getTasksAssignedToMe(StateSetter setModalState) {
    List<Row> returnedWidget = [];

    for (int i = 0; i < tasksAssignedToMeValues.length; i++) {
      int h = i % 2;
      if (h == 0) {
        returnedWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Card(
                  elevation: 2,
                  shadowColor: Colors.black45,
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
                    color: HexColor('#707070'),
                    padding: EdgeInsets.all(10),
                    width: 130,
                    child: Text(
                      tasksAssignedToMeValues[i],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 25,
                      color: Colors.grey,
                      onPressed: () {
                        tasksAssignedToMeValues.removeAt(i);
                        setModalState(() {});
                      },
                      iconSize: 16,
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                )
              ])
            ],
          ),
        );
      } else {
        returnedWidget.last.children.add(Stack(children: [
          Card(
            elevation: 2,
            shadowColor: Colors.black45,
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
              color: HexColor('#707070'),
              padding: EdgeInsets.all(10),
              width: 130,
              child: Text(
                tasksAssignedToMeValues[i],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: IconButton(
                padding: EdgeInsets.all(0),
                splashRadius: 25,
                color: Colors.grey,
                onPressed: () {
                  tasksAssignedToMeValues.removeAt(i);
                  setModalState(() {});
                },
                iconSize: 16,
                icon: Icon(
                  Icons.close,
                ),
              ),
            ),
          )
        ]));
      }
    }
    return returnedWidget;
  }

  List<Widget> getTasksAssignedByMe(StateSetter setModalState) {
    List<Row> returnedWidget = [];

    for (int i = 0; i < tasksAssignedByMeValues.length; i++) {
      int h = i % 2;
      if (h == 0) {
        returnedWidget.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(children: [
                Card(
                  elevation: 2,
                  shadowColor: Colors.black45,
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
                    color: HexColor('#707070'),
                    padding: EdgeInsets.all(10),
                    width: 130,
                    child: Text(
                      tasksAssignedByMeValues[i],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 25,
                      color: Colors.grey,
                      onPressed: () {
                        tasksAssignedByMeValues.removeAt(i);
                        setModalState(() {});
                      },
                      iconSize: 16,
                      icon: Icon(
                        Icons.close,
                      ),
                    ),
                  ),
                )
              ])
            ],
          ),
        );
      } else {
        returnedWidget.last.children.add(Stack(children: [
          Card(
            elevation: 2,
            shadowColor: Colors.black45,
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
              color: HexColor('#707070'),
              padding: EdgeInsets.all(10),
              width: 130,
              child: Text(
                tasksAssignedByMeValues[i],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSans(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                color: Colors.white,
              ),
              child: IconButton(
                padding: EdgeInsets.all(0),
                splashRadius: 25,
                color: Colors.grey,
                onPressed: () {
                  tasksAssignedByMeValues.removeAt(i);
                  setModalState(() {});
                },
                iconSize: 16,
                icon: Icon(
                  Icons.close,
                ),
              ),
            ),
          )
        ]));
      }
    }
    return returnedWidget;
  }
}

class CustomCheckbox extends StatefulWidget {
  final Function onChange;
  final bool isChecked;
  final double size;
  final double iconSize;
  final Color selectedColor;
  final Color selectedIconColor;
  final Color borderColor;
  final Icon checkIcon;

  CustomCheckbox(
      {required this.isChecked,
      required this.onChange,
      required this.size,
      required this.iconSize,
      required this.selectedColor,
      required this.selectedIconColor,
      required this.borderColor,
      required this.checkIcon});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;

  @override
  void initState() {
    _isSelected = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onChange(_isSelected);
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(4),
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
            color: _isSelected ? widget.selectedColor : Colors.transparent,
            borderRadius: BorderRadius.circular(3.0),
            border: Border.all(
              color: widget.borderColor,
              width: 1.5,
            )),
        width: widget.size,
        height: widget.size,
        child: _isSelected
            ? Icon(
                Icons.check,
                color: widget.selectedIconColor,
                size: widget.iconSize,
              )
            : null,
      ),
    );
  }
}
