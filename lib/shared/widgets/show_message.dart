import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ShowMessage {
  static showMessage(BuildContext context, String error,
      {bool isDismissable = true, bool dismissCurrentScreen = false}) {
    showModalBottomSheet(
        context: context,
        isDismissible: isDismissable,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            error,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Proxima',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.green;
                          return Color.fromRGBO(
                              252, 128, 25, 1); // Use the component's default.
                        },
                      ),
                    ),
                    child: const Text(
                      '      Ok      ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      if (dismissCurrentScreen) Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  static showErrorMessage(BuildContext context, String error) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Proxima',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.green;
                          return Color.fromRGBO(
                              252, 128, 25, 1); // Use the component's default.
                        },
                      ),
                    ),
                    child: const Text(
                      '      Ok      ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
          );
        });
  }

  static showFlushBar(BuildContext context, String message) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.easeOutBack,
      forwardAnimationCurve: Curves.easeOutQuint,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
            color: (Colors.blue[800])!,
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: true,
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.error_outline,
        color: Colors.yellow[100],
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontSize: 14.0, color: Colors.white, fontFamily: 'Proxima'),
      ),
    ).show(context);
  }

  /* static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        width: MediaQuery.of(context).size.width * 75 / 100,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        //margin: EdgeInsets.all(10.0),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Proxima',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.85)));
  } */

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        width: MediaQuery.of(context).size.width * 75 / 100,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        //margin: EdgeInsets.only(bottom: 30.0),
        elevation: 3,
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Proxima',
            fontSize: 14,
            color: HexColor('#707070'),
          ),
        ),
        backgroundColor: Colors.white));
  }

  static showSnackBarWithStatus(
      BuildContext context, String message, String status) {
    var backGroundColor = Colors.black.withOpacity(0.90);
    if (status == 'success') {
      backGroundColor = (Colors.green[800])!.withOpacity(0.90);
    } else if (status == 'error') {
      backGroundColor = (Colors.red[600])!.withOpacity(0.90);
    }

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        width: MediaQuery.of(context).size.width * 75 / 100,
        duration: Duration(seconds: 2),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        //margin: EdgeInsets.all(10.0),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Proxima',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        backgroundColor: backGroundColor));
  }
}
