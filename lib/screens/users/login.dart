import 'package:flutter/material.dart';
import '../../utils/validation.dart';


class LoginWidget extends StatefulWidget {

  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool toReg = false;

  var myText = 'Not submitted yet';

  var firstController = TextEditingController();
  var lastController = TextEditingController();
  var eController = TextEditingController();
  var passController = TextEditingController();

  bool isDesktop(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width >= 600;

  bool isMobile(BuildContext context) =>
      MediaQuery
          .of(context)
          .size
          .width < 600;

  bool _obscureText = true;

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String submitText = "Status: Yet to submit ";

  @override
  void initState() {
    super.initState();
    _userName.text = "cadet29manikandan";
    _password.text = "ManiBalaKRMB9499!";
  }

  signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      FocusScope.of(context).unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(" User Name and Password Cannot Be Empty")));
    }
  }

  signInPage() async {
    //value = await _tempApi.signIn(_userName.text, _password.text);
    if (_userName.text == "cadet29manikandan" &&
        _password.text == "ManiBalaKRMB9499!") {

      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //     builder: (context) => const HomeScreen()));
    } else {
      // print("error");
    }
  }

  // toRegPageController() {
  //   setState(() {
  //     toReg = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 300,
          child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30,),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.purple[800],
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Email id field.......
                    const Text(
                      "User Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                      onSaved: (value) {},
                      validator: Validator.valueExists,
                      controller: _userName,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        border: OutlineInputBorder(),
                        //labelText: 'Enter username',
                        hintText: 'Username',
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          // width: 100,
                        ),
                        Expanded(
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.grey,
                                  backgroundColor:
                                  Colors.transparent,
                                  alignment:
                                  const Alignment(1, 0.2)),
                              onPressed: () {
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //         const ForgotDelete()));
                              },
                              child: const Text(
                                'Forgot Password?',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                      onSaved: (value) {},
                      validator: Validator.passwordCorrect,
                      controller: _password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        border: const OutlineInputBorder(),
                        //labelText: 'Enter Password',
                        // suffixIcon: InkWell(onTap: _togglePassword, child: const Icon(Icons.visibility_off)),
                        suffixIcon: IconButton(
                          //padding: const EdgeInsetsDirectional.only(end: 12.0),
                          icon: _obscureText
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                        hintText: 'Password',
                      ),
                    ),

                    const SizedBox(
                      height: 5,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.crop_square_rounded,
                          color: Colors.black,
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                              color: Colors.black, fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 361,
                          height: 37,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.purple[800],
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                  shape:
                                  const RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(
                                              5)))),
                              onPressed: () async {
                                await signInPage();
                              },
                              child: const Text('SIGN IN')),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    TextButton(onPressed: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => const RegistrationPage() )
                      // );
                    },
                      child: const Text("Create Account",
                        style: TextStyle(
                          color: Colors.black,

                        ),),

                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ]
              )
          ),
        ),
      ),
    );
  }
}