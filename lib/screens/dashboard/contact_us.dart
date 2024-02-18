import 'dart:js';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  ContactUs({Key?key});
  var now = DateTime.now();

  final formKey = GlobalKey<FormState>();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _message = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  bool _isVisible = false;
  bool _isVisiblecomments = true;
  // bool _isPassword = false;
  // bool _hasPasswordNumber = false;
  // bool _hasLower = false;
  // bool _hasUpper = false;
  // bool _hasSpecial = false;
  bool toLogIn = false;


  clear() {
    _userName.text = "";
    _emailId.text = "";
    _message.text = "";
  }


  String? _validateItemRequired(String value) {
    return value.isEmpty ? "Please enter comments" : 'value is Required';
  }
  signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      FocusScope.of(context as BuildContext).unfocus();
    } else {
      clear();
    }
  }
  // addTempUser() async {
  //   AddTempUser addTempUser = AddTempUser(
  //       tempUserName: _userName.text,
  //       mobileNo: _mobileNumber.text,
  //       eMail: _emailId.text,
  //       password: generateMd5(_password.text),
  //       userDesc: _comments.text,
  //       reason: "Inactive",
  //       status: "0");
  //   bool value = false;
  //   value = await _tempApi.addTempUser(addTempUser: addTempUser);
  //   if (value == true) {
  //     showAlertDialog("Created Successfully");
  //   } else {
  //     showAlertDialog("Values must not be empty");
  //   }
  // }

  showAlertDialog(String status) {
    Widget okButton = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple[600],
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        // Navigator.of(context as BuildContext, rootNavigator: true).pop();
        // Navigator.push(
        //     context as BuildContext,
        //     MaterialPageRoute(
        //         builder: (context) => const LoginPage(
        //           theme: "test", title: '',
        //         )));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        child: Text("OK",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15)),
      ),
    );

    AlertDialog alert = AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      title: const Text("Alerts"),
      content: Text(status),
      actions: [
        okButton,
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Center(
                  child:   Column(
                    children: [

                      const SizedBox(
                        height: 30,
                      ),
                      const Text("GET IN TOUCH",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Email : support@indianprincess.com",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text("Phone: +91 7482392892 (Mon - Sat 9Am - 6PM)",style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),), const SizedBox(
                        height: 30,
                      ),
                      const Text("WRITE TO US",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),),


                      SizedBox(
                        width: 700,
                        child: Form(
                            key: formKey,
                            child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    "Name",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),

                                  TextFormField(
                                    controller: _userName,

                                    //maxLength: 30,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    decoration: const InputDecoration(

                                      border: OutlineInputBorder(

                                      ),
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 10.0),

                                    ),
                                    onSaved: (value) {},
                                    validator: (String? value) {
                                      if (value != null &&
                                          value.trim().isEmpty) {
                                        return "Please enter user name";
                                      } else if (value!.trim().length <
                                          4 &&
                                          value.trim().length >= 30) {
                                        return "user name must be Minimum 4 characters and maximum 30 characters";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Email Id",
                                    style: TextStyle(

                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(

                                    onSaved: (value) {},
                                    validator: (String? value) {
                                      if (value.toString() == "") {
                                        return "Please enter email id";
                                      }
                                      Pattern pattern =
                                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                          r"{0,253}[a-zA-Z0-9])?)*$";
                                      RegExp regex =
                                      RegExp(pattern.toString());
                                      if (!regex.hasMatch(value!)) {
                                        return 'Enter a valid email address';
                                      }
                                      return null;
                                    },

                                    controller: _emailId,
                                    //maxLength: 45,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 10.0),
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text(
                                    "Mobile Number",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextFormField(
                                    maxLength: 10,
                                    onSaved: (value) {},
                                    validator: (String? value) {
                                      if (value.toString() == "")
                                        return "Please enter mobile number";
                                      String patttern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = RegExp(patttern);
                                      if (value!.isEmpty) {
                                        return 'Please enter mobile number';
                                      } else {
                                        if (!regExp.hasMatch(value)) {
                                          return 'Please enter valid mobile number';
                                        }
                                      }
                                      return null;
                                    },
                                    controller: _mobileNumber,
                                    //maxLength: 15,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 10.0),
                                    ),
                                  ),
                                  const Text(
                                    "MESSAGE",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(

                                    maxLines: 5,
                                    maxLength: 500,
                                    controller: _message,

                                    //maxLength: 30,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding:
                                      EdgeInsets.symmetric(
                                          vertical: 3.0,
                                          horizontal: 10.0),

                                    ),

                                    onSaved: (value) {},
                                    validator: (String? value) {
                                      if (value != null &&
                                          value.trim().isEmpty) {
                                        return "Please enter a message";
                                      }
                                      return null;
                                    },
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: TextButton(

                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors.purple[800],
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5)))),
                                          onPressed: () async {

                                            // addTempUser();
                                            _isVisiblecomments = true;
                                            signIn();
                                            _isVisible = false;
                                            //await signIn();

                                          },
                                          child: const Text('SEND')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 80,
                                  )
                                ])),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
