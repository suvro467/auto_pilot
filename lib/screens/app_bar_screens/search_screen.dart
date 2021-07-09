import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  late int totalDelegatedTasks;
  late int totalDelegatedTasksWeekly;
  late int totalDelegatedTasksMonthly;
  late int totalDelegatedTasksOverDue;

  late int totalRepeatTasks;
  late int totalRepeatTasksWeekly;
  late int totalRepeatTasksMonthly;
  late int totalRepeatTasksOverDue;

  late int totalSupportTasks;
  late int totalSupportTasksWeekly;
  late int totalSupportTasksMonthly;
  late int totalSupportTasksOverDue;

  late int totalPersonalTasks;
  late int totalPersonalTasksWeekly;
  late int totalPersonalTasksMonthly;
  late int totalPersonalTasksOverDue;

  late Icon trailingIconDelegatedTask;
  late Icon trailingIconDelegatedTaskWeekly;
  late Icon trailingIconDelegatedTaskMonthly;
  late Icon trailingIconDelegatedTaskOverDue;

  late Icon trailingIconRepeatTask;
  late Icon trailingIconRepeatTaskWeekly;
  late Icon trailingIconRepeatTaskMonthly;
  late Icon trailingIconRepeatTaskOverDue;

  late Icon trailingIconSupportTask;
  late Icon trailingIconSupportTaskWeekly;
  late Icon trailingIconSupportTaskMonthly;
  late Icon trailingIconSupportTaskOverDue;

  late Icon trailingIconPersonalTask;
  late Icon trailingIconPersonalTaskWeekly;
  late Icon trailingIconPersonalTaskMonthly;
  late Icon trailingIconPersonalTaskOverDue;

  @override
  void initState() {
    super.initState();

    totalDelegatedTasks = 11;
    totalDelegatedTasksWeekly = 20;
    totalDelegatedTasksMonthly = 56;
    totalDelegatedTasksOverDue = 5;

    totalRepeatTasks = 2;
    totalRepeatTasksWeekly = 15;
    totalRepeatTasksMonthly = 20;
    totalRepeatTasksOverDue = 1;

    totalSupportTasks = 7;
    totalSupportTasksWeekly = 10;
    totalSupportTasksMonthly = 16;
    totalSupportTasksOverDue = 4;

    totalPersonalTasks = 1;
    totalPersonalTasksWeekly = 6;
    totalPersonalTasksMonthly = 22;
    totalPersonalTasksOverDue = 3;

    trailingIconDelegatedTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTask = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskWeekly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskMonthly = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );

    trailingIconDelegatedTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconRepeatTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconSupportTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
    trailingIconPersonalTaskOverDue = Icon(
      Icons.arrow_drop_down,
      color: MyAutoPilotStyles.appColor,
      size: 36,
    );
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
                        'Your Tasks',
                        style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                      ),
                      Text('Test',
                          style: GoogleFonts.notoSerif(
                            color: MyAutoPilotStyles.appColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/plus.svg',
                      color: MyAutoPilotStyles.appColor,
                      //semanticsLabel: 'Email Mobile',
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getDelegatedTasks(int tabIndex) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (tabIndex == 0
                ? totalDelegatedTasks
                : (tabIndex == 1
                    ? totalDelegatedTasksWeekly
                    : (tabIndex == 2
                        ? totalDelegatedTasksMonthly
                        : totalDelegatedTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getRepeatTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalRepeatTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalRepeatTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalRepeatTasksMonthly
                        : totalRepeatTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getSupportTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalSupportTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalSupportTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalSupportTasksMonthly
                        : totalSupportTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }

  List<Widget> _getPersonalTasks(int cupertinoTabBarIIIValue) {
    List<Card> returnedWidgets = [];

    for (int i = 0;
        i <
            (cupertinoTabBarIIIValue == 0
                ? totalPersonalTasks
                : (cupertinoTabBarIIIValue == 1
                    ? totalPersonalTasksWeekly
                    : (cupertinoTabBarIIIValue == 2
                        ? totalPersonalTasksMonthly
                        : totalPersonalTasksOverDue)));
        i++) {
      returnedWidgets.add(Card(
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
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is a small description of the ...',
                      style: GoogleFonts.notoSerif(
                          color: HexColor('#707070'),
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          decoration:
                              i.isEven ? null : TextDecoration.lineThrough),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              'By: Suvradip Roy',
                              style: GoogleFonts.notoSerif(
                                color: HexColor('#707070'),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'Due: 4 Jul 2021',
                            style: GoogleFonts.notoSerif(
                              color: HexColor('#707070'),
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
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(
                  i.isEven
                      ? 'assets/images/check-mark.svg'
                      : 'assets/images/x-mark.svg',
                  color: HexColor('#C9C9C9'),
                  //semanticsLabel: 'Email Mobile',
                  height: 22,
                  width: 22,
                ),
              ),
            ],
          ),
        ),
      ));
    }
    return returnedWidgets;
  }
}
