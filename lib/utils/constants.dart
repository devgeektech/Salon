import 'package:flutter/material.dart';


const Color kUniversalColor = Color(0xff0E0A75);
const Color kSecendoryColor = Color(0xffCAAF66);
const Color kScaffoldBgColor = Color(0xffEEF1F8);
const Color countryPickerColor = Color(0xffe7e0ec);
Color kTextGrey = const Color(0xff383838);

const BoxDecoration kContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30)
    ),
);

void nextScreen(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
void nextScreenPushReplacement(context, page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}

ShapeBorder cardRadius = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
    ),
);


double getHeight(context)=>MediaQuery.of(context).size.height;
double getWidth(context)=>MediaQuery.of(context).size.width;

String likeNotificationID = '2';
String followNotificationID = '1';
String commentNotificationID = '3';
String inviteGroupNotificationID = '4';


// MOVIES CONSTANTS
const double kButtonHeight = 48;
const double kCardAspectRatio = 0.75;

const double kPadding = 20;
const double kSectionPadding = 40;




const BorderRadius kAllBorderRadius = BorderRadius.all(
    Radius.circular(kPadding),
);





Map<String, String> headerBearerOption(String token) => {
  "Content-Type": "application/json",
  'Authorization': 'Bearer $token',
};

enum ApiState { loading, success, error, notFound }