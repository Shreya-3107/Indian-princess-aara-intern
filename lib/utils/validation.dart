import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/menu_list.dart';
class Validator {
  static String valueExists(dynamic value) {
    if (value == null || value.isEmpty) {
      return 'Please fill this field';
    } else {
      return '';
    }
  }

  static String passwordCorrect(dynamic value) {
    var emptyResult = valueExists(value);
    if (emptyResult == null || emptyResult.isEmpty) {
      var pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[#?!@$%^&*-]).{8,}$';
      var regExp = RegExp(pattern);
      if (!regExp.hasMatch(value)) {
        return 'Your password must be at least 8 symbols with number, big and small letter and special character (!@#\$%^&*).';
      } else {
        return null!;
      }
    } else {
      return emptyResult;
    }
  }

  static String validateEmail(dynamic value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regExp = RegExp(pattern);
    var emptyResult = valueExists(value);
    if (emptyResult != null) {
      return emptyResult;
    } else if (!regExp.hasMatch(value)) {
      return 'Not a valid email address. Should be your@email.com';
    } else {
      return null!;
    }
  }
}


String? validateUsertypeRequired(
    String value, String userNullValue, String minimumChar) {
  //print("aa");
  if (value.toString() == "") {
    return userNullValue;
  } else if (value.length < 2) {
    return minimumChar;
  } else {
    return null;
  }
  // return value.isEmpty ? 'User name is Required' : null;
}

String? countValues(String value, String userNullValue, String minimumChar) {
  if (value.toString() == "") {
    return userNullValue;
  // ignore: prefer_is_empty
  } else if (value.length < 1) {
    return minimumChar;
  } else {
    return null;
  }
  // return value.isEmpty ? 'User name is Required' : null;
}

String? validateUserRequired(
    String value, String userNullValue, String minimumChar) {
  if (value.toString() == "") {
    return userNullValue;
  } else if (value.isEmpty) {
    return minimumChar;
  } else {
    return null;
  }
  // return value.isEmpty ? 'User name is Required' : null;
}



String dateConvert(String dateString) {
  if (dateString != '-') {
    DateTime date = DateTime.parse(dateString.toString());
    var date1 = DateFormat('dd/MMM/yyyy HH:mm').format(date);
    return date1;
  } else {
    return '-';
  }
}

String dateFormatConvert(String dateString) {
  if (dateString != '-') {
    DateTime date = DateTime.parse(dateString.toString());
    var date1 = DateFormat('dd/MMM/yyyy').format(date);
    return date1;
  } else {
    return '-';
  }
}

String getId(String no, String name) {
  if (no.length == 2) {
    return "$name-0$no";
  } else if (no.length == 1) {
    return "$name-00$no";
  } else {
    return "$name-$no";
  }
}
TextButton buildTextButton() {
  return TextButton(
      onPressed: () {

      },
      style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          elevation: 2,
          backgroundColor: Colors.grey.shade50),
      child: const Text("SHOP NOW"));
}









// SelectedMenuItem getMenu(String name) {
//   if (name == "SelectedMenuItem.dashboard") {
//     return SelectedMenuItem.dashboard;
//   } else if (name == "SelectedMenuItem.liveData") {
//     return SelectedMenuItem.liveData;
//   } else if (name == "SelectedMenuItem.reportData") {
//     return SelectedMenuItem.reportData;
//   } else if (name == "SelectedMenuItem.listTicket") {
//     return SelectedMenuItem.listTicket;
//   } else if (name == "SelectedMenuItem.errorHandlingAlarm") {
//     return SelectedMenuItem.errorHandlingAlarm;
//   } else {
//     return SelectedMenuItem.dashboard;
//   }
// }

String getDec(String no) {
  if (no.length == 1) {
    return "0$no";
  } else {
    return no;
  }
}

int compareString(bool ascending, String value1, String value2) =>
    ascending ? value1.compareTo(value2) : value2.compareTo(value1);
