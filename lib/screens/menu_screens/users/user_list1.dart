import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:auto_pilot/shared/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
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
  bool isDelegatesExpanded = false;
  bool isRepeatExpanded = false;
  bool isSupportExpanded = false;
  bool isPersonalExpanded = false;

  Map<String, double> tasksCompleted = {'Flutter': 90, 'Kotlin': 10};
  Map<String, double> tasksOnTime = {'Flutter': 60, 'Kotlin': 40};
  Map<String, double> approvedBenchaMark = {'Flutter': 80, 'Kotlin': 20};

  late Widget editIcon;
  late Widget deleteIcon;

  //String baseUrl = Globals.baseUrl;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    editIcon = SvgPicture.asset(
      'assets/images/edit.svg',
      color: HexColor('#C9C9C9'),
      height: 40,
      width: 40,
    );

    deleteIcon = SvgPicture.asset(
      'assets/images/delete.svg',
      color: HexColor('#C9C9C9'),
      height: 40,
      width: 40,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                                    child: InkWell(
                                      splashColor: Colors.orange.withAlpha(30),
                                      onTap: () {
                                        /* setState(() {
                                                          item_val = items[index];
                                                        }); */

                                        // On tapping the list item, the following bottom sheet will pop up
                                        /* showModalBottomSheet(
                                          clipBehavior: Clip.antiAlias,
                                          context: context,
                                          isScrollControlled: true,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                topRight:
                                                    Radius.circular(20.0)),
                                          ),
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  ListTile(
                                                    leading: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .grey[300],
                                                            //offset: Offset(0.0, 1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.edit,
                                                          color:
                                                              Color(0xff132ba3),
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    //subtitle: Text("subtitle Edit"),
                                                    onTap: () async {
                                                      var complementary =
                                                          await getComplementaryInfo(data
                                                                  .storeComplementaryId
                                                                  .toString())
                                                              .onError((error,
                                                                  stackTrace) {
                                                        print(error.toString());
                                                        return null;
                                                      });
                                                      if (complementary !=
                                                          null) {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                            return AddComplementary(
                                                              isEdit: true,
                                                              complementaryId:
                                                                  complementary[
                                                                      'complementaryId'],
                                                              complementaryName:
                                                                  complementary[
                                                                      'complementaryName'],
                                                              printingName:
                                                                  complementary[
                                                                      'printingName'],
                                                              details:
                                                                  complementary[
                                                                      'details'],
                                                              minimumAmount:
                                                                  complementary[
                                                                      'minimumAmount'],
                                                              collectionStatus:
                                                                  complementary[
                                                                              'collectionStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              waitingStatus:
                                                                  complementary[
                                                                              'waitingStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              restaurantStatus:
                                                                  complementary[
                                                                              'restaurantStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              deliveryStatus:
                                                                  complementary[
                                                                              'deliveryStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              websiteStatus:
                                                                  complementary[
                                                                              'websiteStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              systemStatus:
                                                                  complementary[
                                                                              'systemStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              dineOrderStatus:
                                                                  complementary[
                                                                              'dineOrderStatus'] ==
                                                                          1
                                                                      ? true
                                                                      : false,
                                                              storeId:
                                                                  complementary[
                                                                      'storeId'],
                                                              storeComplementaryOrder:
                                                                  complementary[
                                                                      'storeComplementaryOrder'],
                                                            );
                                                          }),
                                                        );
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      } else {
                                                        ShowMessage
                                                            .showErrorMessage(
                                                                context,
                                                                'Could not fetch data, please try again later.');
                                                      }
                                                    },
                                                  ),
                                                  Divider(
                                                    height: 0,
                                                    thickness: 1.0,
                                                    color: Colors.grey[300],
                                                    indent: 20,
                                                    endIndent: 20,
                                                  ),
                                                  ListTile(
                                                    leading: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors
                                                                .grey[300],
                                                            //offset: Offset(0.0, 1.0), //(x,y)
                                                            blurRadius: 6.0,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color:
                                                              Color(0xff132ba3),
                                                          size: 15,
                                                        ),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      'Delete',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                    ),
                                                    //subtitle: Text("Delete contents"),
                                                    onTap: () async {
                                                      Navigator.pop(context);
                                                      showDialog<void>(
                                                        context: context,
                                                        barrierDismissible:
                                                            false, // user must tap button!
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Confirmation'),
                                                            content:
                                                                SingleChildScrollView(
                                                              child: ListBody(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      'Are you sure?'),
                                                                  /* Text(
                                                                                                                              'Would you like to approve of this message?'), */
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                child: Text(
                                                                    'Confirm'),
                                                                onPressed:
                                                                    () async {
                                                                  // Show the progress dialogue.
                                                                  var responseResult =
                                                                      {};
                                                                  ProgressDialog
                                                                      progressDialog =
                                                                      ProgressDialog(
                                                                          context,
                                                                          message: Text(
                                                                              "This is the message"),
                                                                          title:
                                                                              Text("This is the title"));

                                                                  progressDialog
                                                                      .setTitle(
                                                                          Text(
                                                                              "Updating"));
                                                                  progressDialog
                                                                      .setMessage(
                                                                          Text(
                                                                              "Please Wait, Updating data ..."));
                                                                  // Show the progress dialogue here before calling the API.
                                                                  progressDialog
                                                                      .show();
                                                                  await deleteComplementary(data
                                                                          .storeComplementaryId
                                                                          .toString())
                                                                      .then(
                                                                          (value) {
                                                                        responseResult =
                                                                            value;
                                                                        progressDialog
                                                                            .dismiss();
                                                                      })
                                                                      .timeout(
                                                                          Duration(
                                                                              seconds:
                                                                                  10),
                                                                          onTimeout:
                                                                              (() {}))
                                                                      .onError(
                                                                          (error,
                                                                              stackTrace) {});
                                                                  print(
                                                                      responseResult);
                                                                  if (!Globals
                                                                      .checkEmpty(
                                                                          responseResult)) {
                                                                    progressDialog
                                                                        .dismiss();
                                                                    if (!Globals.checkEmpty(responseResult[
                                                                            'status']) &&
                                                                        !Globals.checkEmpty(
                                                                            responseResult['msg'])) {
                                                                      ShowMessage
                                                                          .showSnackBarWithStatus(
                                                                        context,
                                                                        responseResult[
                                                                            'msg'],
                                                                        responseResult[
                                                                            'status'],
                                                                      );
                                                                    }
                                                                  } else {
                                                                    progressDialog
                                                                        .dismiss();

                                                                    ShowMessage
                                                                        .showSnackBarWithStatus(
                                                                      context,
                                                                      'Error! please try again after some time',
                                                                      'error',
                                                                    );
                                                                  }

                                                                  Navigator.pop(
                                                                      context);
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              TextButton(
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black38),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                       */
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                4.0, 5.0, 0, 5.0),
                                            child: ListTile(
                                              title: Text(
                                                "${data['firstName']}",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  /* color: DineOrderStyles
                                                                          .departmentListItemColor, */
                                                  fontFamily: 'Proxima',
                                                ),
                                              ),
                                              trailing: Container(
                                                height: 50.0,
                                                width: 50.0,
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      228, 241, 255, 0.44),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5)),
                                                ),
                                                child: Center(child: editIcon),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.black26,
                                            height: 0.0,
                                          ),
                                        ],
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
                  /* ListView(children: [
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
                                            height: 70,
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Transform.scale(
                                                        scale: 2.5,
                                                        child: SvgPicture.asset(
                                                          'assets/images/delegate task.svg',
                                                          color: MyAutoPilotStyles.appColor,
                                                          //semanticsLabel: 'Email Mobile',
                                                          height: 10,
                                                          width: 10,
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                          left: 20,
                                                        ),
                                                        child: Text(
                                                          'Test',
                                                          style: GoogleFonts.notoSerif(
                                                            color: HexColor('#707070'),
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                          left: 10,
                                                        ),
                                                        child: Text(
                                                          'Delegated Tasks',
                                                          style: GoogleFonts.notoSerif(
                                                            color: HexColor('#707070'),
                                                            fontWeight: FontWeight.normal,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                       */
                  // Weekly
                  ListView(children: [
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
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),

                  // Inactive
                  ListView(children: [
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
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),

                  // Deleted
                  ListView(children: [
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
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: SvgPicture.asset(
                                      'assets/images/delegate task.svg',
                                      color: MyAutoPilotStyles.appColor,
                                      //semanticsLabel: 'Email Mobile',
                                      height: 10,
                                      width: 10,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Test',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      'Delegated Tasks',
                                      style: GoogleFonts.notoSerif(
                                        color: HexColor('#707070'),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            )
          ],
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
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 01'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 01'},
        {'firstName': 'Suvradip Roy', 'teamName': 'Team 01'},
      ]
    };
  }
}
