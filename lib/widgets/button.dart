import 'package:flutter/material.dart';

import '../utils/theme.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const Button({Key? key, required this.onPressed, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height *.06,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.white.withOpacity(0.25),
                offset: Offset(0, 0),
                blurRadius: 2,
                spreadRadius: 1
            )
          ]),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none
                  )
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                ThemeProvider.appColor,
              )),
          onPressed: onPressed,
          child: Text(title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Manrope"
              ))),
    );
  }
}
