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
  final TextEditingController _searchController = TextEditingController();

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
                    borderSide: BorderSide(color: HexColor('#C9C9C9')),
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
                    onPressed: () async {},
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
          ],
        ),
      ),
    );
  }

  getSearchResults() {
    for (int i = 0; i < 10; i++) {
      searchResults.add({
        'Description': 'This is the small description of the tasks assigned.',
        'By': 'Sujoy Banerjee'
      });
    }
  }
}
