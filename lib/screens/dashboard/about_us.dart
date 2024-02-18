import 'dart:js';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key?key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var now = DateTime.now();
  bool? isChecked = false;
  bool? check1 = false;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();

  final TextEditingController _message = TextEditingController();

  final TextEditingController _emailId = TextEditingController();

  bool _isVisible = false;

  bool _isVisiblecomments = true;

  // bool _isPassword = false;
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
            child: Center(
              child:   Column(
                children: [
                  const SizedBox(
                      width:500,
                      height: 300,
                      child: Placeholder()
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("ABOUT US",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                      children:[
                        Spacer(),
                        SizedBox(
                          width: 1000,
                          child: Text("Generating random paragraphs can be an excellent way for"
                              " writers to get their creative flow going at the beginning "
                              "of the day. The writer has no idea what topic the random"
                              " paragraph will be about when it appears. This forces the"
                              " writer to use creativity to complete one of three common "
                              "writing challenges. The writer can use the paragraph as the"
                              " first one of a short story and build upon it. A second option"
                              " is to use the random paragraph somewhere in a short story "
                              "they create. The third option is to have the random paragraph"
                              " be the ending paragraph in a short story. No matter which of"
                              " these challenges is undertaken, the writer is forced t",
                            textAlign: TextAlign.center,),
                        ),
                        Spacer(),
                      ]
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset("assets/images/IP Logo 2.png"),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text("CONTACT US",style: TextStyle(
                    fontSize: 25,
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
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.green
                                    )
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
                              ),
                              // Checkbox( //only check box
                              //     value: check1,
                              //     activeColor: Colors.purple[800],
                              //     onChanged: (bool? value){
                              //       setState(() {
                              //         check1 = value;
                              //       });
                              //     }
                              // ),
                            ])),
                  ),

                ],
              ),
            ),
          ),
        );
  }
}
