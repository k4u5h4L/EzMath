import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  late String text;
  late int? fillColor;
  late int textColor;
  late double textSize;
  late Function callback;

  CalcButton({
    required this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize = 28,
    required this.callback,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          onPressed: () {
            callback(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                fontSize: textSize,
              ),
            ),
          ),
          color: fillColor != null ? Color(fillColor!) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
