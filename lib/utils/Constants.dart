// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/components/theme.dart';

//Sample data  show or api data show
const bool isSampleDataMode = true;

//color
const kPrimaryColor = Color(0xff654ce6);
const kSecondaryColor = Color(0xffa594ff);
const kDarkblueColor = Color(0xff25396f);
const kgreyColor = Color(0xfff1f1f1);
const kDarkgreyColor = Color(0xff8d91a7);
const kWhiteColor = Color(0xffffffff);

const kDefaultPadding = 20.0;
const kMaxWidth = 1500.0;
const kDefaultDuration = Duration(milliseconds: 250);

//our product shadow
final kDefaultShadow = BoxShadow(
  offset: const Offset(0, 10),
  spreadRadius: 5,
  blurRadius: 20,
  color: const Color(0xFF0700B1).withOpacity(0.15),
);

class Constants {
  static const double kPadding = 10.0;
  static const Color purpleLight = Color(0XFF1e224c);
  static const Color purpleDark = Color(0XFF0d193e);
  static const Color orange = Color(0XFFec8d2f);
  static const Color red = Color(0XFFf44336);
  static const Color blue = Color(0XFF8F94FB);
  static const Color bgGrey = Color(0XFFf4f3f9);
  static const Color green = Color(0XFF38b29b);
  static const Color bgBlue = Color(0XFF566091);
  static const Color bgColor = Color(0XFFf3f6f9);
  static const Color itemColor = Color(0XFFe9ecef);
  static const Color successColor = Color(0XFF0ab39c);
  static const Color failureColor = Color(0XFFf06548);
  static const Color warningColor = Color(0XFFf7b84b);
  static const Color chartLegendColor1 = Color(0XFF405189);
  static const Color chartLegendColor2 = Color(0XFF0ab39c);
  static const Color chartLegendColor3 = Color(0XFFf06548);
  static const Color ackType = Color(0XFF1a237e);
  static TextStyle headerWithBold = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 16);
  static TextStyle headerWithoutBold =
  TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 16);
  static TextStyle columnWithBold = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold,
      fontSize: 13, color: Colors.black87);
  static TextStyle columnWithoutBold = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
      color: Colors.grey);
  static TextStyle locationInfoHeader = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.bold);
  static TextStyle locationInfoHeaderType = TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontWeight: FontWeight.bold);
}

const appPadding = 16.0;
const kPreferredThemeKey = "preferred_theme";
const defaultPadding = 16.0;
const String updateStatusID = "1";
const String deleteStatusID = "0";
const String deleteDevStatus = "0";
const String deleteSimStatus = "0";
const String deleteLocStatus = "0";
const String baseUrl2 = "http://localhost:8000/amr";
const String baseUrl = "http://192.168.135.28:4036";

// RichText buildRichText(String value, bool boolValue) {
//   return RichText(
//       text: TextSpan(
//           text: value,
//           style: TextStyle(
//               fontSize: 10,
//               color: themecontroler.text == "dark"
//                   ? Colors.white70
//                   : Colors.black87,
//               fontFamily: GoogleFonts.poppins().fontFamily),
//           children: [
//             TextSpan(
//                 text: (boolValue) ? '' : '*',
//                 style: const TextStyle(
//                   color: Colors.red,
//                   fontSize: 10.0,
//                 )),
//           ]));
// }

//for create Schedule dropdown text
RichText buildRichText2(String value, bool boolValue, BuildContext context) {
  return RichText(
      text: TextSpan(
        text: value,
        style: TextStyle(
            fontSize: 13,
            color: DynamicTheme.of(context)?.theme == "dark"
                ? Colors.white70
                : Colors.black87,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ));
}

RichText buildRichText3(String value, bool boolValue) {
  return RichText(
      text: TextSpan(
        text: value,
        style: TextStyle(
            fontSize: 13,
            // color: themecontroler.text == 'dark' ? Colors.white70 : Colors.black87,
            fontFamily: GoogleFonts.poppins().fontFamily),
      ));
}
//

// InputDecoration buildInputDecoration(String value) {
//   return InputDecoration(
//     isDense: true,
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// InputDecoration buildInputDecorationForTxtBox(String value) {
//   return InputDecoration(
//     isDense: true,
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// TextStyle buildTextStyle() {
//   return TextStyle(
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     //color:DynamicTheme.of(context)?.theme=='dark'?Colors.white70:Colors.black87,
//     fontSize: 13,
//     color: themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//   );
// }
//
// TextStyle buildTextStyleTheme(buildContext) {
//   return TextStyle(
//     color: themecontroler.text == 'dark' ? Colors.white70 : Colors.black87,
//     fontSize: 13,
//     //fontWeight: FontWeight.bold,
//     fontFamily: GoogleFonts.poppins().fontFamily,
//     //color: Colors.black,
//   );
// }
//
// InputDecoration buildInputDecorationForCalender(String value) {
//   return InputDecoration(
//     isDense: true,
//     suffixIcon: Icon(Icons.calendar_today,
//         color: themecontroler.text == "dark" ? Colors.white70 : Colors.black45),
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// InputDecoration buildInputDecorationPanchayat(String value) {
//   return InputDecoration(
//     counterText: "",
//     isDense: true,
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// InputDecoration buildInputDecorationForTime(String value) {
//   return InputDecoration(
//     isDense: true,
//     suffixIcon: Icon(Icons.access_alarm_outlined,
//         color: themecontroler.text == "dark" ? Colors.white70 : Colors.black45),
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// //for Create Schedule TextBox
// InputDecoration buildInputDecorationForTextBox(String value) {
//   return InputDecoration(
//     isDense: true,
//     contentPadding:
//     const EdgeInsets.only(left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//           color:
//           themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//           width: 1.0),
//     ),
//     border: const OutlineInputBorder(),
//     fillColor: const Color(0xfffeff2f7),
//     hintText: value,
//     hintStyle: buildTextStyle(),
//   );
// }
//
// // For multiselect dropdown
//
// BoxDecoration buildInputDecorationForMulti(String value) {
//   return BoxDecoration(
//     borderRadius: const BorderRadius.all(Radius.circular(4)),
//     border: Border.all(
//         color: themecontroler.text == "dark" ? Colors.white70 : Colors.black87,
//         width: 1.0),
//   );
// }

//
// Size getScreenResolution(BuildContext context) {
//   MediaQueryData mediaQueryData = MediaQuery.of(context);
//   scHeight = mediaQueryData.size.height;
//
//   scWidthMenuIcon = mediaQueryData.size.width;
//   scWidthMenuTile = mediaQueryData.size.width;
//
//   if (mediaQueryData.size.height > 300 && mediaQueryData.size.height < 700) {
//     scHeight = 0.00;
//     //scWidth = scWidth + (mediaQueryData.size.width * 0.10);
//   } else if (mediaQueryData.size.height > 700 &&
//       mediaQueryData.size.height < 800) {
//     scHeight = 0.15;
//     // scWidth = scWidth + (mediaQueryData.size.width * 0.05);
//   } else if (mediaQueryData.size.height > 800 &&
//       mediaQueryData.size.height < 1200) {
//     scHeight = 0.25;
//     // scWidth=0.00;
//   } else {
//     scHeight = 0.25;
//     //scWidth=0.00;
//   }
//   if (mediaQueryData.size.width > 1000 && mediaQueryData.size.width < 1350) {
//     scWidthMenuIcon = mediaQueryData.size.width * 0.0547;
//     scWidthMenuTile = mediaQueryData.size.width * 0.1963;
//     //scWidth = scWidth + (mediaQueryData.size.width * 0.10);
//   } else if (mediaQueryData.size.width > 1351 &&
//       mediaQueryData.size.width < 1700) {
//     scWidthMenuIcon = mediaQueryData.size.width * 0.0456;
//     scWidthMenuTile = mediaQueryData.size.width * 0.1628;
//
//     // scWidth = scWidth + (mediaQueryData.size.width * 0.05);
//   } else if (mediaQueryData.size.width > 1701 &&
//       mediaQueryData.size.width < 2000) {
//     scWidthMenuIcon = mediaQueryData.size.width * 0.0365;
//     scWidthMenuTile = mediaQueryData.size.width * 0.1312;
//
//     // scWidth=0.00;
//   } else {
//     scWidthMenuIcon = mediaQueryData.size.width * 0.0365;
//     scWidthMenuTile = mediaQueryData.size.width * 0.1302;
//
//     //scWidth=0.00;
//   }
//   // scHomeWidth = mediaQueryData.size.width - (scWidthMenuTile);
//   scWidth = mediaQueryData.size.width;
//   return mediaQueryData.size;
// }

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

String generateMd5(String password1) {
  var password = utf8.encode(password1); // convert data to bytes
  var md5 = crypto.md5; // create a new instance of the MD5 hash algorithm
  var digest = md5.convert(password); // calculate the hash
  return digest.toString(); // return the hash as a hex string
}

Color getColor(BuildContext context, String theme) {
  Color clr = Colors.white;
  if (DynamicTheme.of(context)?.theme == "dark") {
    clr = Colors.white70;
  } else {
    clr = Colors.black87;
  }
  return clr;
}
