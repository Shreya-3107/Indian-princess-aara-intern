
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indian_princess_web_app/screens/dashboard/shopping_cart.dart';

import '../../core/menu_list.dart';
import '../../json_model_sample/shopping_items.dart';

class CheckoutWidget extends StatefulWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  const CheckoutWidget({super.key,required this.menuItemOnSelected});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController _userName = TextEditingController();
  final TextEditingController _emailId = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pincode = TextEditingController();

  bool toLogIn = false;
  bool isOrder = true;
  bool isShipping = false;
  bool isPayment = false;

  String? selectedOption = "home";
  String? _selectedOption = "COD";

  clear() {
    _userName.text = "";
    _emailId.text = "";
    _mobileNumber.text = "";
    _address.text = "";
    _pincode.text = "";
  }

  String? _validateItemRequired(String value) {
    return value.isEmpty ? "Please enter address" : null;
  }

  bool validateDetails(){
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      clear();
      return true ;
    }
    return false;
  }

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

  num _subtotalState() {
    num subtotal = 0;
    for(int i=0;i<shoppingItems.length;i++){
      if(shoppingItems[i]["is_selected"])
        subtotal = subtotal+ shoppingItems[i]["price"]-shoppingItems[i]["discount"];
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: 800,
          // padding: EdgeInsets.symmetric(horizontal: 150),
          // color: Colors.grey[200],

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              (isOrder)?
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey
                      )
                    ]
                ),

                width: _size,
                // height: 500,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: _size,
                      height: 50,
                      color: Colors.purple[800],
                      child: Center(child: Text("ORDER SUMMARY", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)),
                    ),
                    SizedBox(height: 20,),
                    Container(

                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      // color: Colors.grey[100],
                      // height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for(int i=0; i<shoppingItems.length;i++)
                            Column(
                                children: [
                                  if(shoppingItems[i]["is_selected"])
                                    ShoppingCartItemColumn(
                                      itemRate: shoppingItems[i]["price"]-shoppingItems[i]["discount"],
                                      itemImage:shoppingItems[i]["image"],
                                      itemDescription:shoppingItems[i]["image_description"],
                                      itemSize:shoppingItems[i]["image_size"],
                                      itemQtyCount: shoppingItems[i]["image_qty_count"],
                                      isRemove: false,
                                      itemPrice: shoppingItems[i]["price"],


                                    ),
                                ]
                            ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              primary: Colors.purple[800], // Background color
                            ),
                            onPressed: () {
                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Cartt()));
                              widget.menuItemOnSelected(
                                  SelectedMenuItem.shoppingCart);
                            },
                            child: Text("BACK TO CART"),
                          ),
                        ),

                        SizedBox(
                          width: 20,
                        ),

                        SizedBox(
                          width: 150,
                          height: 35,
                          child: ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              primary: Colors.purple[800], // Background color
                            ),
                            onPressed: () {
                              setState(() {
                                isOrder = false;
                                isShipping = true;
                              });
                            },
                            child: Text("CONFIRM ORDER"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ): Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey
                      )
                    ]
                ),
                width: _size,
                height: 50,
                // color: Colors.white,
                child: Row(
                    children: [
                      Text("ORDER SUMMARY",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
                      ),
                        SizedBox(width: 10,),
                        FaIcon(FontAwesomeIcons.check,color: Colors.purple[800],size: 20,),
                      Spacer(),
                      SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            primary: Colors.grey[200], // Background color
                          ),
                          onPressed: () {
                            setState(() {
                              isOrder = true;
                              isShipping = false;
                              isPayment = false;
                            });

                          },
                          child: Text("CHANGE",style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple[800],
                          ),),
                        ),
                      ),
                    ]

                ),
              ),

              SizedBox(height: 30,),
              isShipping?
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey
                      )
                    ]
                ),
                width: _size,
                // color: Colors.white,
                child: Column(
                  children: [

                    Container(
                      alignment: Alignment.center,
                      width: 800,
                      color: Colors.purple[800],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("SHIPPING DETAILS", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: 500,
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              controller: _userName,
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
                                hintText: 'Full Name*',
                              ),
                              onSaved: (value) {},
                              validator: (String? value) {
                                if (value != null &&
                                    value.trim().isEmpty) {
                                  return "Please enter full name";
                                }
                                else if (value!.trim().length >= 30) {
                                  return "Name must be Maximum 30 characters";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 8,
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
                                hintText: 'Email ID*',
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
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
                                hintText: 'Mobile Number*',
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),

                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  minLines: 1,
                                  maxLines: 2,
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
                                    contentPadding:
                                    EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 10.0),
                                    border: OutlineInputBorder(),
                                    hintText: 'Address*',
                                  ),
                                  validator: (value) => _validateItemRequired(value!),
                                  onSaved: (value) =>
                                  _address.text = value!,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onSaved: (value) {},
                              validator: (String? value) {
                                if (value.toString() == "") {
                                  return "Please enter pincode";
                                }
                                String patttern =
                                    r'^\d{6}$';
                                RegExp regExp = RegExp(patttern);
                                if (value!.isEmpty) {
                                  return 'Please enter pincode';
                                } else {
                                  if (!regExp.hasMatch(value)) {
                                    return 'Please enter valid pincode';
                                  }
                                }
                                return null;
                              },
                              controller: _pincode,
                              //maxLength: 15,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Pin Code*',
                                contentPadding:
                                EdgeInsets.symmetric(
                                    vertical: 3.0,
                                    horizontal: 10.0),
                              ),
                            ),
                            const SizedBox(height: 8,),
                            const Text(
                              "Select address type",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                  width: 130,
                                  child: ListTile(
                                    title: const Text('Home'),
                                    leading: Radio<String>(
                                      activeColor: Colors.purple[800],
                                      value: "home",
                                      groupValue: selectedOption,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 150,
                                  child: ListTile(
                                    title: const Text('Office'),
                                    leading: Radio<String>(
                                      activeColor: Colors.purple[800],
                                      value: "office",
                                      groupValue: selectedOption,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedOption = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    SizedBox(
                      width: 200,
                      height: 35,
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.purple[800], // Background color
                        ),
                        onPressed: () {
                          if(validateDetails()){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder:(context) => Placeholder() )
                              );
                          }

                        },
                        child: Text("PROCEED TO PAY"),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ): Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.grey
                      )
                    ]
                ),
                width: _size,
                height: 50,
                // color: Colors.white,
                child: Row(
                    children: [
                      Text("SHIPPING ADDRESS",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(width: 10,),
                      if(isOrder == false)FaIcon(FontAwesomeIcons.check,color: Colors.purple[800],size: 20,),
                      Spacer(),
                      if(isOrder== false)
                          SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            primary: Colors.grey[200], // Background color
                          ),
                          onPressed: () {

                            setState(() {
                              isOrder = false;
                              isShipping = true;
                              isPayment = false;
                            });

                          },
                          child: Text("CHANGE",style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple[800],
                          ),),
                        ),
                      ),
                    ]

                ),
              ),
              SizedBox(height: 30,),

              // isPayment?
              // Container(
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 5.0,
              //             color: Colors.grey
              //         )
              //       ]
              //   ),
              //   // color: Colors.white,
              //   child: Column(
              //     children: [
              //       Container(
              //         width: 800,
              //           color: Colors.purple[800]
              //           ,child: const Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Text("PAYMENT METHOD", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),),
              //         ),
              //       ),
              //       Container(
              //         child: Column(
              //           children: [
              //             SizedBox(
              //               height: 40,
              //               width: 270,
              //               child: ListTile(
              //                 title: const Text('Cash On Delivery'),
              //                 leading: Radio<String>(
              //                   activeColor: Colors.purple[800],
              //                   value: "COD",
              //                   groupValue: _selectedOption,
              //                   onChanged: (String? value) {
              //                     setState(() {
              //                       _selectedOption = value;
              //                     });
              //                   },
              //                 ),
              //                 trailing: FaIcon(FontAwesomeIcons.moneyBill, color: Colors.grey[600],),
              //               ),
              //             ),
              //
              //             SizedBox(
              //               height: 40,
              //               width: 270,
              //               child: ListTile(
              //                 title: const Text('Credit or Debit Card'),
              //                 leading: Radio<String>(
              //                   activeColor: Colors.purple[800],
              //                   value: "Card",
              //                   groupValue: _selectedOption,
              //                   onChanged: (String? value) {
              //                     setState(() {
              //                       _selectedOption = value;
              //                     });
              //                   },
              //                 ),
              //                 trailing: FaIcon(FontAwesomeIcons.creditCard, color: Colors.grey[600],),
              //               ),
              //             ),
              //
              //             SizedBox(
              //               height: 40,
              //               width: 270,
              //               child: ListTile(
              //                 title: const Text('Netbanking'),
              //                 leading: Radio<String>(
              //                   activeColor: Colors.purple[800],
              //                   value: "NB",
              //                   groupValue: _selectedOption,
              //                   onChanged: (String? value) {
              //                     setState(() {
              //                       _selectedOption = value;
              //                     });
              //                   },
              //                 ),
              //                 trailing: FaIcon(FontAwesomeIcons.buildingColumns, color: Colors.grey[600],),
              //               ),
              //             ),
              //
              //             SizedBox(
              //               height: 40,
              //               width: 270,
              //               child: ListTile(
              //                 title: const Text('UPI'),
              //                 leading: Radio<String>(
              //                   activeColor: Colors.purple[800],
              //                   value: "UPI",
              //                   groupValue: _selectedOption,
              //                   onChanged: (String? value) {
              //                     setState(() {
              //                       _selectedOption = value;
              //                     });
              //                   },
              //                 ),
              //                 trailing: FaIcon(FontAwesomeIcons.googlePay, color: Colors.grey[600],),
              //               ),
              //             ),
              //
              //           ],
              //         ),
              //       ),
              //
              //       SizedBox(height: 20,),
              //
              //       SizedBox(
              //         width: 200,
              //         height: 35,
              //         child: ElevatedButton(
              //           style:ElevatedButton.styleFrom(
              //             primary: Colors.purple[800], // Background color
              //           ),
              //           onPressed: () {
              //             setState(() {
              //               isOrder = false;
              //               isShipping = false;
              //               isPayment = true;
              //             });
              //           },
              //           child: Text("PROCEED TO PAY"),
              //         ),
              //       ),
              //
              //       SizedBox(height: 20,),
              //
              //     ],
              //   ),
              // ): Container(
              //   alignment: Alignment.centerLeft,
              //   padding: const EdgeInsets.all(8.0),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //             blurRadius: 5.0,
              //             color: Colors.grey
              //         )
              //       ]
              //   ),
              //   width: _size,
              //   height: 50,
              //   // color: Colors.white,
              //   child: Row(
              //       children: [
              //         Text("PAYMENT ADDRESS",
              //           style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
              //         ),
              //         SizedBox(width: 10,),
              //       ]
              //
              //   ),
              // ),
            ],
          ),
        ),
      SizedBox(
        width: 50,
      ),

        Container(
          margin: EdgeInsets.only(top:20),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                )
              ]
          ),

          // padding: EdgeInsets.all(15),
          width: 450,
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               Container(
                 width: 450,
                 color: Colors.purple[800],
                 child: Padding(
                   padding : EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,
                   child: Text("SUMMARY",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
              ),
                 ),
               ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10) ,child: Row(
                  children: [
                    Text("Subtotal    "),
                    Spacer(),
                    Text(_subtotalState().toString()),
                    // Spacer(),
                  ]
              ),
              ),
              const  Padding(
                padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: Row(
                  children: [
                    Text("Discount"),
                    Spacer(),
                    Text("Rs.0"),
                    // Spacer(),
                  ]
              ),
              ),
              Divider(),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),child: Row(
                  children: [
                    Text("Order Total",style: TextStyle(fontWeight: FontWeight.bold),),
                    Spacer(),
                    Text((_subtotalState()).toString(),style: TextStyle(fontWeight: FontWeight.w900),),
                    // Spacer(),
                  ]
              ),
              ),
              Divider(),

            ],
          ),
        ),
        Spacer(),
    ]
    );
  }
}

