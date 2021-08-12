import 'dart:io';

import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:auto_pilot/shared/widgets/show_message.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserListScreen1 extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;

  /* final int tabMenuSelected;
  final int taskItemTapped; */
  const UserListScreen1(
      {required this.scaffoldKey,
      required this.pageController,

      /* required this.tabMenuSelected,
      required this.taskItemTapped, */
      Key? key})
      : super(key: key);

  @override
  _UserListScreen1State createState() => _UserListScreen1State();
}

class _UserListScreen1State extends State<UserListScreen1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _departmentController = TextEditingController();

  late bool _isDepartmentValid;

  late String _validationText;
  late String _departmentText;

  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  bool _archiveUserTasks = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  //String baseUrl = Globals.baseUrl;

  List<String> users = ["User 1", "User 2", "User 3", "User 4"];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    _isDepartmentValid = true;

    _departmentController.text = '';
    _departmentText = 'Choose user';

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
  }

  @override
  void dispose() {
    _tabController.dispose();
    _departmentController.dispose();
    _departmentText = '';
    super.dispose();
  }

  Future<bool> showExitPopup() async {
    if (widget.pageController.page!.toInt() == 5)
      return await showDialog(
        //show confirm dialogue
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit MyAutoPilot?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                if (Platform.isAndroid)
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
              //return true when click on "Yes"
              child: Text('Yes'),
            ),
          ],
        ),
      );
    else
      return true;
    //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Container(
        //height: MediaQuery.of(context).size.height,
        child: Material(
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
                          'Your Users',
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
                    InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () async {
                        widget.pageController.animateToPage(
                          6,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
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
              // Custom Tab Bar
              Container(
                width: MediaQuery.of(context).size.width * 90 / 100,
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          width: 2, color: MyAutoPilotStyles.appColor)),
                  child: TabBar(
                    onTap: (value) {
                      setState(() {});
                    },
                    labelPadding: EdgeInsets.zero,
                    labelStyle: GoogleFonts.notoSerif(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    controller: _tabController,
                    // give the indicator a decoration (color and border radius)
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                      color: MyAutoPilotStyles.appColor,
                    ),
                    unselectedLabelStyle: GoogleFonts.notoSerif(
                      color: HexColor('#707070'),
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),

                    unselectedLabelColor: HexColor('#707070'),
                    tabs: [
                      Container(
                        width: 65,
                        child: Tab(
                          text: 'All',
                        ),
                      ),
                      Container(
                        width: 65,
                        child: Tab(
                          text: 'Active',
                        ),
                      ),
                      Container(
                        width: 65,
                        child: Tab(
                          text: 'Inactive',
                        ),
                      ),
                      Container(
                        //width: 65,
                        child: Tab(
                          text: 'Deleted',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Custom TabBarView
              Flexible(
                fit: FlexFit.loose,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // All
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: Card(
                                        elevation: 5,
                                        shadowColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.elliptical(2, 2),
                                            bottomRight:
                                                Radius.elliptical(2, 2),
                                            topLeft: Radius.elliptical(2, 2),
                                            bottomLeft: Radius.elliptical(2, 2),
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Container(
                                          height: 80,
                                          color: Colors.white,
                                          /* padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0), */
                                          padding: EdgeInsets.only(
                                            right: 10,
                                            left: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    margin: const EdgeInsets
                                                            .only(
                                                        bottom:
                                                            6.0), //Same as `blurRadius` i guess
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/selfpic.jpg',
                                                        ),
                                                      ),
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey,
                                                          offset: Offset(
                                                              0.0, 1.0), //(x,y)
                                                          blurRadius: 6.0,
                                                        ),
                                                      ],
                                                    ),
                                                    /* child: Image(
                                                    image: AssetImage(
                                                      'assets/images/selfpic.jpg',
                                                    ),
                                                  ), */
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20.0,
                                                      top: 10,
                                                      bottom: 10,
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${data['firstName']}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .notoSerif(
                                                            color: HexColor(
                                                                '#707070'),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          "${data['teamName']}",
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: GoogleFonts
                                                              .notoSans(
                                                            color: HexColor(
                                                                '#707070'),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: IconButton(
                                                    icon: SvgPicture.asset(
                                                      'assets/images/edit.svg',
                                                      color:
                                                          HexColor('#C9C9C9'),
                                                      height: 20,
                                                      width: 20,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  splashColor: Colors.orange
                                                      .withAlpha(30),
                                                  onTap: () async {
                                                    // Here reset the user selected to blank.
                                                    _departmentController.text =
                                                        '';
                                                    _departmentText =
                                                        _departmentController
                                                                .text.isNotEmpty
                                                            ? ''
                                                            : 'Choose user';
                                                    await showModalBottomSheet(
                                                        context: context,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        isScrollControlled:
                                                            true,
                                                        builder: (builder) {
                                                          return StatefulBuilder(
                                                              builder: (BuildContext
                                                                      context,
                                                                  StateSetter
                                                                      setModalState) {
                                                            return Align(
                                                              alignment: Alignment
                                                                  .bottomCenter,
                                                              child:
                                                                  ConstrainedBox(
                                                                constraints:
                                                                    BoxConstraints
                                                                        .tight(
                                                                  Size(
                                                                      MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          90 /
                                                                          100,
                                                                      460),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: const Radius
                                                                              .circular(
                                                                          20.0),
                                                                      topRight:
                                                                          const Radius.circular(
                                                                              20.0),
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              30,
                                                                          left:
                                                                              30,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              'Deleting User',
                                                                              style: GoogleFonts.notoSerif(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.bold,
                                                                                color: MyAutoPilotStyles.appColor,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              10,
                                                                          left:
                                                                              30,
                                                                          right:
                                                                              30,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Deleting a user removes the user from the business process.',
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color:
                                                                                HexColor('#707070'),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              10,
                                                                          left:
                                                                              30,
                                                                          right:
                                                                              30,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Please choose a user to whom the open task of the user being deleted will be assigned to.',
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color:
                                                                                HexColor('#707070'),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin:
                                                                            EdgeInsets.only(
                                                                          top:
                                                                              10,
                                                                          left:
                                                                              30,
                                                                          right:
                                                                              30,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'You can also choose to archive the task and transfer the tasks later to another user.',
                                                                          style:
                                                                              GoogleFonts.notoSans(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color:
                                                                                HexColor('#707070'),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            width:
                                                                                250,
                                                                            child:
                                                                                CheckboxListTile(
                                                                              activeColor: MyAutoPilotStyles.appColor,
                                                                              dense: true,
                                                                              value: _archiveUserTasks,
                                                                              onChanged: (newValue) {
                                                                                setModalState(() {
                                                                                  _archiveUserTasks = !_archiveUserTasks;
                                                                                  if (_archiveUserTasks) _isDepartmentValid = true;
                                                                                });
                                                                              },
                                                                              title: Text(
                                                                                'Archive User Tasks',
                                                                                style: GoogleFonts.notoSans(
                                                                                  color: HexColor('#707070'),
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontSize: 14,
                                                                                ),
                                                                              ),
                                                                              controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                          left:
                                                                              40.0,
                                                                          right:
                                                                              40.0,
                                                                          top:
                                                                              20,
                                                                        ),
                                                                        child:
                                                                            Stack(
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
                                                                              validator: (v) => v == null ? "required field" : null,
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
                                                                                  borderSide: BorderSide(color: MyAutoPilotStyles.appColor),
                                                                                ),
                                                                                focusedBorder: UnderlineInputBorder(
                                                                                  borderSide: BorderSide(color: MyAutoPilotStyles.appColor),
                                                                                ),
                                                                                hintStyle: GoogleFonts.notoSerif(
                                                                                  fontSize: 14,
                                                                                  color: HexColor('#C9C9C9'),
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                              ),
                                                                              mode: Mode.DIALOG,
                                                                              showSelectedItem: false,
                                                                              items: users,
                                                                              maxHeight: (users.length) <= 3 ? (users.length).toDouble() * 55 : 160,
                                                                              showClearButton: false,
                                                                              onChanged: (value) async {
                                                                                setModalState(() {
                                                                                  _departmentController.text = value ?? '';
                                                                                  _departmentText = _departmentController.text.isNotEmpty ? '' : 'Choose user';
                                                                                });
                                                                              },
                                                                              //popupItemDisabled: (String s) => s.startsWith('I'),
                                                                              /* selectedItem: chefPrintDataModel
                          .chefPrint.setting.storeNumberOfAutoPrintChef
                          .toString(), */
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
                                                                      // Top Up Button
                                                                      Container(
                                                                        padding:
                                                                            EdgeInsets.only(top: 20),
                                                                        child:
                                                                            ConstrainedBox(
                                                                          constraints: BoxConstraints.tightFor(
                                                                              width: 210,
                                                                              height: 55),
                                                                          child:
                                                                              ElevatedButton(
                                                                            onPressed:
                                                                                () async {
                                                                              // If 'Archive User Tasks' is checked then no need to select any user.
                                                                              if (_archiveUserTasks) {
                                                                                _isDepartmentValid = true;
                                                                              } else if (!_archiveUserTasks && _departmentController.text.isEmpty) {
                                                                                _isDepartmentValid = false;
                                                                              }

                                                                              if (!_isDepartmentValid) {
                                                                                /* if (_departmentController.text.isEmpty && !_archiveUserTasks) {
                                                                                  _isDepartmentValid = false;
                                                                                } */
                                                                                setModalState(() {});
                                                                                ShowMessage.showFlushBar(context, 'Please rectify the errors.');
                                                                              } else {
                                                                                setModalState(() {
                                                                                  _isDepartmentValid = true;
                                                                                });

                                                                                showDialog(
                                                                                  context: context,
                                                                                  barrierDismissible: false,
                                                                                  builder: (BuildContext context) {
                                                                                    return LoadingDialog();
                                                                                  },
                                                                                );

                                                                                await Future.delayed(new Duration(seconds: 3), () {
                                                                                  Navigator.pop(context); //pop dialog
                                                                                }).then((value) {});
                                                                              }
                                                                            },
                                                                            style:
                                                                                ElevatedButton.styleFrom(
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(30.0),
                                                                              ),
                                                                              primary: MyAutoPilotStyles.appColor,
                                                                            ),
                                                                            child:
                                                                                Text(
                                                                              'ASSIGN & DELETE',
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
                                                        }).then((value) {
                                                      _departmentText =
                                                          'Choose user';
                                                      _archiveUserTasks = false;
                                                    });
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/images/delete.svg',
                                                    color: HexColor('#C9C9C9'),
                                                    height: 20,
                                                    width: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                              ]),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Weekly
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                  4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                      image: AssetImage(
                                                        'assets/images/selfpic.jpg',
                                                      ),
                                                    ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Inactive
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                  4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                      image: AssetImage(
                                                        'assets/images/selfpic.jpg',
                                                      ),
                                                    ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),

                    // Deleted
                    FutureBuilder(
                      future: fetchUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          //UsersDataModel responseModel = snapshot.data;
                          var responseModel = snapshot.data;
                          return AnimationLimiter(
                            child: ListView.builder(
                              itemCount: responseModel['users'].length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = responseModel['users'][index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 500),
                                  child: SlideAnimation(
                                    verticalOffset: 50,
                                    child: FadeInAnimation(
                                      child: InkWell(
                                        splashColor:
                                            Colors.orange.withAlpha(30),
                                        onTap: () {},
                                        child: Card(
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.elliptical(2, 2),
                                              bottomRight:
                                                  Radius.elliptical(2, 2),
                                              topLeft: Radius.elliptical(2, 2),
                                              bottomLeft:
                                                  Radius.elliptical(2, 2),
                                            ),
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            height: 80,
                                            color: Colors.white,
                                            /* padding: const EdgeInsets.fromLTRB(
                                                  4.0, 5.0, 0, 5.0), */
                                            padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 40.0,
                                                      width: 40.0,
                                                      margin: const EdgeInsets
                                                              .only(
                                                          bottom:
                                                              6.0), //Same as `blurRadius` i guess
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/selfpic.jpg',
                                                          ),
                                                        ),
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset: Offset(0.0,
                                                                1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      /* child: Image(
                                                      image: AssetImage(
                                                        'assets/images/selfpic.jpg',
                                                      ),
                                                    ), */
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 20.0,
                                                        top: 10,
                                                        bottom: 10,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "${data['firstName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSerif(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "${data['teamName']}",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: GoogleFonts
                                                                .notoSans(
                                                              color: HexColor(
                                                                  '#707070'),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/edit.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: IconButton(
                                                      icon: SvgPicture.asset(
                                                        'assets/images/delete.svg',
                                                        color:
                                                            HexColor('#C9C9C9'),
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          return LoadingDialog();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //fetchUsers() {}
  Future<Map<String, dynamic>> fetchUsers() async {
    /* print('baseUrl for InnerMenu: $baseUrl');
    print('apiUrl for InnerMenu: $getApiUrlComplementary');

    final response = await http.get(
      Uri.http(baseUrl, getApiUrlComplementary),
      //headers: {HttpHeaders.authorizationHeader: ''},
      headers: Globals.apiHeaders,
    );

    if (response.statusCode == 200) {
      print('Response body : ${response.body}. End of response body.');
      final responseJson = jsonDecode(response.body);
      complementaryDataModel = ComplementaryDataModel.fromJson(responseJson);

      return complementaryDataModel;
    } else {
      throw Exception('Failed to load data.');
    } */

    return {
      'users': [
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 01'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 02'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 03'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 04'},
      ]
    };
  }
}
