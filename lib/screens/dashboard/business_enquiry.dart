import 'package:flutter/material.dart';

class BusinessForm extends StatefulWidget {
  const BusinessForm({Key?key});

  @override
  State<BusinessForm> createState() => _BusinessFormState();
}

class _BusinessFormState extends State<BusinessForm> {
  bool _obscureText = false;

  bool _obscureText1 = true;

  final formKey = GlobalKey<FormState>();

  final TextEditingController _fullName = TextEditingController();

  final TextEditingController _emailId = TextEditingController();

  final TextEditingController _mobileNumber = TextEditingController();

  // final TextEditingController _password = TextEditingController();

  final TextEditingController _stateCity = TextEditingController();

  final TextEditingController _address = TextEditingController();

  final TextEditingController _note = TextEditingController();

  bool _isVisible = false;

  bool _isVisiblecomments = true;

  bool _isPassword = false;

  bool _hasPasswordNumber = false;

  bool _hasLower = false;

  bool _hasUpper = false;

  bool _hasSpecial = false;

  bool toLogIn = false;

  clear() {
    _fullName.text = "";
    _emailId.text = "";
    _mobileNumber.text = "";
    _address.text = "";
    _note.text = "";
    _stateCity.text = "";
  }


  String? _validateAddress(String value) {
    return value.isEmpty ? "Please enter address" : 'value is Required';
  }

  String? _validateNote(String value) {
    return value.isEmpty ? "Please enter a note" : 'value is Required';
  }
  signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      FocusScope.of(context).unfocus();
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
        // Navigator.of(context, rootNavigator: true).pop();
        // Navigator.push(
        //     context,
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
    showDialog(
      context: context,
      builder: (BuildContext contexts) {
        return alert;
      },
    );
  }

  onPasswordChanged(String password) {
    final hasUppercase = RegExp(r'[A-Z]');
    final hasNumber = RegExp(r'[0-9]');
    final hasLowercase = RegExp(r'[a-z]');
    final hasSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    setState(() {
      _isPassword = false;
      if (password.length >= 8 && password.length <= 30) {
        _isPassword = true;
      }
      _hasPasswordNumber = false;
      if (hasNumber.hasMatch(password)) {
        _hasPasswordNumber = true;
      }
      _hasLower = false;
      if (hasLowercase.hasMatch(password)) {
        _hasLower = true;
      }
      _hasUpper = false;
      if (hasUppercase.hasMatch(password)) {
        _hasUpper = true;
      }
      _hasSpecial = false;
      if (hasSpecial.hasMatch(password)) {
        _hasSpecial = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Text("Home/Business Enquiry",style: TextStyle(
          fontSize: 15,
        ),),
        SizedBox(
          height: 15,
        ),
        Text("BUSINESS ENQUIRY",style: TextStyle(
          fontSize: 25,
          fontWeight:  FontWeight.w800,
        ),),
        SizedBox(
          height: 25,
        ),
        Container(
          child: Row(
            children: [
              Spacer(),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 1050,
                    width: 900,
                    color: Colors.purple[800]
                  ),
                  Container(
                    height: 850,
                    width: 700,
                    color: Colors.purple[100]),
                  Container(
                    height: 800,
                    width: 600,
                      color: Colors.purple[100],
                    child: Form(
                        key: formKey,
                        child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 30,
                              ),
                             const  Center(
                                child: Text("Please Fill Below Form",style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                ),),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Full Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,

                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                controller: _fullName,

                                //maxLength: 30,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration(
                                  filled : true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.deepPurple
                                    )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.deepPurple,
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
                                    return "Please enter full name ";
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
                                  // fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
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
                                  filled : true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.deepPurple,
                                      )
                                  ),
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
                                  // fontSize: 12,
                                  fontWeight: FontWeight.w600,
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
                                  filled : true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.deepPurple,
                                      )
                                  ),
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
                                "State and City",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),

                              TextFormField(
                                controller: _stateCity,

                                //maxLength: 30,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: const InputDecoration(
                                  filled : true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.deepPurple,
                                      )
                                  ),
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
                                    return "Please State and City";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              if (_isVisiblecomments)
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Address",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      maxLines: 5,
                                      maxLength: 500,
                                      // maxLength: 255,
                                      keyboardType:
                                      TextInputType.multiline,
                                      obscureText: false,
                                      controller: _address,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      decoration:
                                      const InputDecoration(
                                        filled : true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.deepPurple
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.deepPurple,
                                            )
                                        ),
                                        contentPadding:
                                        EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 10.0),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) =>
                                          _validateAddress(
                                              value!),
                                      onSaved: (value) =>
                                      _address.text = value!,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text(
                                      "Note",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,

                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextFormField(
                                      maxLines: 5,
                                      maxLength: 500,
                                      // maxLength: 255,
                                      keyboardType:
                                      TextInputType.multiline,
                                      obscureText: false,
                                      controller: _note,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      decoration:
                                      const InputDecoration(
                                        filled : true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.deepPurple
                                            )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.deepPurple,
                                            )
                                        ),
                                        contentPadding:
                                        EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 10.0),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value) =>
                                          _validateNote(
                                              value!),
                                      onSaved: (value) =>
                                      _note.text = value!,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              else
                                const SizedBox.shrink(),
                              Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 30,
                                  child: TextButton(
                                      style: TextButton.styleFrom(
                                          // side: BorderSide(
                                          //   width: 2,
                                          //   color: Colors.deepPurple,
                                          // ),
                                          foregroundColor: Colors.white,
                                          backgroundColor:Colors.purple[800],
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                          ),
                                      ),
                                      onPressed: () async {
                                        // addTempUser();
                                        _isVisiblecomments = true;
                                        signIn();
                                        _isVisible = false;
                                        //await signIn();
                                      },
                                      child: const Text('Sign Up')),
                                ),
                              ),
                            ]
                        )
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),

        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
