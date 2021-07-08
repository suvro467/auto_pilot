import 'package:auto_pilot/shared/globals.dart';
import 'package:auto_pilot/shared/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingDialog extends Dialog {
  final String message;
  final double width;
  final double height;
  LoadingDialog({
    this.message = 'Please Wait ...',
    this.width = 130,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new SizedBox(
          width: width,
          height: height,
          child: new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: CircularProgressIndicator(color: MyAutoPilotStyles.appColor),
                ),
                Text(
                  message,
                  style: GoogleFonts.notoSerif(
                    fontSize: 14,
                    color: MyAutoPilotStyles.appColor,
                    fontWeight: FontWeight.normal,
                    //decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
