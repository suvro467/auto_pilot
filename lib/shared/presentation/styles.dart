import 'package:auto_pilot/shared/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAutoPilotStyles {
  /// Styles :
  // Background common colour for the widgets in the app
  static Color appColor = HexColor('#82C4E2');
  static Color notificationColor = HexColor('#C41717');
  static TextStyle listTileHeaderTitle = GoogleFonts.notoSans(
    fontSize: 14,
    color: HexColor('#707070'),
    fontWeight: FontWeight.normal,
  );
  static const TextStyle listTileSubTitle = TextStyle(
    fontFamily: 'Proxima',
    fontStyle: FontStyle.normal,
    fontSize: 13,
    color: Color.fromRGBO(126, 128, 140, 1),
  );
  static const TextStyle listTileTitle = TextStyle(
    fontFamily: 'Proxima',
    fontStyle: FontStyle.normal,
    fontSize: 13,
    color: Colors.black,
  );

  /// Colors:
  static const Color primaryTextColor = Colors.black;
  static const Color secondaryTextColor = Color(0xFF616161);
  static const Color drawerMenuColor = Color.fromRGBO(252, 128, 25, 1);
  static const Color buttonBlackColor = Colors.black;
  static const Color buttonOrangeColor = Color.fromRGBO(252, 128, 25, 1);
  static const Color dineOrderGreyColor = Color.fromRGBO(126, 128, 140, 1);
  static const Color drawerHeaderColor =
      Colors.grey; //Color.fromRGBO(217, 227, 227, 1);
  static const Color validationColor = Color.fromRGBO(250, 74, 91, 1);
  static const Color buttonGreenColor = Color.fromRGBO(46, 204, 113, 1);
  static const Color buttonPressBackgroundColor =
      Color.fromRGBO(60, 125, 87, 1);
  static const Color buttonTextColor = Color.fromRGBO(127, 193, 73, 1);
  static const Color buttonDisplayOn = Color.fromRGBO(19, 43, 163, 1);
  static const Color percentGreenColor = Color.fromRGBO(73, 180, 19, 1);
  static const Color listItemDescColor = Color.fromRGBO(60, 59, 59, 1);
  static const Color currencyOrangeColor = Color.fromRGBO(248, 109, 55, 1);
  static const Color deliveryColor = Color.fromRGBO(28, 81, 184, 1);
  static const Color collectionColor = Color.fromRGBO(51, 72, 97, 1);
  static const Color restaurantColor = Color.fromRGBO(212, 0, 88, 1);
  static const Color waitingColor = Color.fromRGBO(230, 196, 21, 1);
  static const Color departmentListItemColor = Color.fromRGBO(106, 105, 105, 1);
  static const Color createButtonTextColor = Color.fromRGBO(24, 132, 208, 1);
  static const Color switchColor = Color.fromRGBO(96, 178, 70, 1);
  static const Color staffCircleColor = Color.fromRGBO(154, 143, 239, 1);
  static const Color staffTextColor = Color.fromRGBO(137, 134, 134, 1);
  static const Color bulkEmailRectangleColor = Color.fromRGBO(233, 170, 28, 1);
  static const Color bulkEmailDateColor = Color.fromRGBO(141, 138, 138, 1);
  static const Color bulkEmailRectangleColorBlue =
      Color.fromRGBO(69, 88, 182, 1);
  static const Color bulkEmailSMSText = Color.fromRGBO(110, 109, 109, 1);
  static const Color staffListColor = Color.fromRGBO(0, 26, 51, 1);
  static const Color approvedColor = Color.fromRGBO(19, 160, 166, 1);
  static const Color declinedColor = Color.fromRGBO(234, 149, 130, 1);
  static const Color visibleColor = Color.fromRGBO(64, 86, 161, 1);
  static const Color hideColor = Color.fromRGBO(161, 168, 197, 1);
  static const Color readColor = Color.fromRGBO(104, 184, 138, 1);
  static const Color unReadColor = Color.fromRGBO(246, 121, 93, 1);

  /// Icons:
  static Widget drawerMenuIcon = Transform.scale(
    scale: 0.7,
    child: Icon(Icons.menu),
  );

  static Widget closeWindowIcon = Transform.scale(
      scale: 0.7,
      child: SvgPicture.asset(
        'assets/images/exit.svg',
        color: MyAutoPilotStyles.appColor,
        //semanticsLabel: 'Email Mobile',
        height: 10,
        width: 10,
      ));

  static Widget menuTrailingIcon = Transform.scale(
    scale: 0.7,
    child: Icon(Icons.arrow_forward_ios),
  );

  /// Dividers:
  static const Divider menuItemDivider = Divider(
    color: dineOrderGreyColor,
  );

  // Box Decorations:

  // Pressed Tab Menu Box Decoration
  static const BoxDecoration tabMenuPressedBoxDecoration = BoxDecoration(
    border: Border(
      bottom: BorderSide(
        width: 2.0,
        color: Color.fromRGBO(19, 43, 163, 1),
      ),
    ),
  );

  // DateTime Format
  static String getDineOrderDateFormat(DateTime dt) {
    if (DateTime.now().year == dt.year) {
      return 'd M H:i A';
    } else {
      return 'd M Y H:i A';
    }
  }

  static String getDineOrderDateFormatMultiDate(DateTime dt) {
    return 'd M Y H:i A';
  }

  static String getDineOrderDateFormatMultiDateInitial(DateTime dt) {
    if (DateTime.now().year == dt.year) {
      return 'd M ';
    } else {
      return 'd M Y';
    }
  }

  static String getDineOrderSingleDateFormat(DateTime dt) {
    return 'd M Y ';
  }
}
