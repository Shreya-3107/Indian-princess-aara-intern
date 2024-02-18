import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../json_model_sample/brands_list.dart';

class ProductView extends StatefulWidget {
  final int index;

  const ProductView({super.key, required this.index});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String? sizeChart = "S";
  bool isProductDetails = false;
  final List<String> items = [
    'Red',
    'Blue',
    'Orange',
    'Green',
  ];
  String? selectedValue = 'Red';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(
                  flex: 5,
                ),
                Container(
                  color: Colors.purple[100],
                  child: Image.asset(
                    "assets/products/ethnic/Ch_2.png",
                    height: 1100,
                    width: 600,
                    fit: BoxFit.fill,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  // width: 500,
                  // height: 1000,
                  width: 700,
                  // color: Colors.grey[200],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "INSERT NAME OF THE DRESS",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            wordSpacing: 6,
                            letterSpacing: 4,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price : Insert Price",
                              style: TextStyle(
                                fontSize: 17,
                                // fontWeight: FontWeight.w700,
                                wordSpacing: 3,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              "Tax included . Shipping calculated at checkout",
                              style: TextStyle(
                                fontSize: 13,
                                wordSpacing: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "SIZE _ Size chart",
                                  style: TextStyle(
                                      wordSpacing: 2, letterSpacing: 2),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(FontAwesomeIcons.tape)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 80,
                                  child: ListTile(
                                    title: Text("S"),
                                    leading: Radio(
                                        value: "S",
                                        activeColor: Colors.purple[800],
                                        groupValue: sizeChart,
                                        onChanged: (value) {
                                          setState(() {
                                            sizeChart = value;
                                          });
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 80,
                                  child: ListTile(
                                    title: Text("M"),
                                    leading: Radio(
                                        value: "M",
                                        activeColor: Colors.purple[800],
                                        groupValue: sizeChart,
                                        onChanged: (value) {
                                          setState(() {
                                            sizeChart = value;
                                          });
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 80,
                                  child: ListTile(
                                    title: Text("L"),
                                    leading: Radio(
                                        value: "L",
                                        activeColor: Colors.purple[800],
                                        groupValue: sizeChart,
                                        onChanged: (value) {
                                          setState(() {
                                            sizeChart = value;
                                          });
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 110,
                                  child: ListTile(
                                    title: Text("XL"),
                                    leading: Radio(
                                        value: "XL",
                                        activeColor: Colors.purple[800],
                                        groupValue: sizeChart,
                                        onChanged: (value) {
                                          setState(() {
                                            sizeChart = value;
                                          });
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 120,
                                  child: ListTile(
                                    title: Text("XXL"),
                                    leading: Radio(
                                        value: "XXL",
                                        activeColor: Colors.purple[800],
                                        groupValue: sizeChart,
                                        onChanged: (value) {
                                          setState(() {
                                            sizeChart = value;
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        child: DropdownButtonFormField2<String>(
                          // isExpanded: false,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: Text(selectedValue!),
                          // const Text(
                          //   'Select Your Gender',
                          //   style: TextStyle(fontSize: 14),
                          // ),
                          items: items.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          )).toList(),

                          onChanged: (value) {
                            //Do something when selected item is changed.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // DropdownButton2<String>(
                      //   isExpanded: true,
                      //   items: items
                      //       .map((String item) => DropdownMenuItem<String>(
                      //             value: item,
                      //             child: Text(
                      //               item,
                      //               style: const TextStyle(
                      //                 fontSize: 17,
                      //               ),
                      //             ),
                      //           ))
                      //       .toList(),
                      //   value: selectedValue,
                      //   onChanged: (String? value) {
                      //     setState(() {
                      //       selectedValue = value;
                      //     });
                      //   },
                      //   buttonStyleData: const ButtonStyleData(
                      //     padding: EdgeInsets.symmetric(horizontal: 16),
                      //     height: 40,
                      //     width: 140,
                      //   ),
                      //   menuItemStyleData: const MenuItemStyleData(
                      //     overlayColor: MaterialStatePropertyAll(
                      //       Color(0xffe3b9ff)
                      //     ),
                      //     height: 40,
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10),
                      //   child: Column(
                      //     children: [Text("COLOR",style: TextStyle(wordSpacing: 2,letterSpacing: 2),),
                      //       Container(
                      //         color: Colors.white,
                      //         child: Text("RED"),
                      //       )
                      //       ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.purple.shade800,
                              width: 3,
                            ),
                            fixedSize: Size(650, 50),
                            backgroundColor: Colors.white,
                          ),
                          child: const Text("ADD TO CART",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 4)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.purple.shade800,
                              width: 3,
                            ),
                            fixedSize: Size(650, 50),
                            backgroundColor: Colors.purple.shade800,
                          ),
                          child: const Text("BUY IT NOW",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 4)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        //color: Colors.grey[300],
                        width: 210,
                        child: ListTile(
                          leading: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xff6a1b9a), width: 3))),
                            child: const Text(
                              "PRODUCT DETAILS",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: (){
                              setState(() {
                                isProductDetails=!isProductDetails;
                              });
                            },
                              child: isProductDetails?FaIcon(FontAwesomeIcons.minus, color: Colors.purple[800],):FaIcon(FontAwesomeIcons.plus, color: Colors.purple[800]),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        // color: Colors.grey[300],
                        height: isProductDetails?800:0,
                        duration: 0.01.seconds,
                        child: Column(
                          children: [
                            if(isProductDetails)
                             FadeInLeft(
                               child: Text(
                                "Product: Skirt Set \n"
                                    "Top Colour: Red\n"
                                    "Bottom Colour: Red\n"
                                    "Top Type: Crop\n"
                                    "Top Open: Back Open Zipper\n"
                                    "Skirt Open: Drawstring With Back Elastic\n"
                                    "Skirt Type: Panel\n"
                                    "Top Lining: With Lining\n"
                                    "Bottom Lining: With Lining\n"
                                    "Top Design: Printed\n"
                                    "Bottom Design: Printed\n"
                                    "Neckline: Sweetheart Neckline\n"
                                    "Sleeve Length: 3/4th Sleeves\n"
                                    "Sleeve Type: With Sleeves Attached\n"
                                    "- Fit: Regular\n"
                                    "Top Fabric: Tissue\n"
                                    "Bottom Fabric: Art Silk\n",
                                style: TextStyle(
                                  height: 3,
                                  wordSpacing: 1,
                                  letterSpacing: 1,
                                ),
                            ),
                             ),
                            if(isProductDetails == false)
                              FadeOutLeft(
                                child: Text(
                                  "Product: Skirt Set \n"
                                      "Top Colour: Red\n"
                                      "Bottom Colour: Red\n"
                                      "Top Type: Crop\n"
                                      "Top Open: Back Open Zipper\n"
                                      "Skirt Open: Drawstring With Back Elastic\n"
                                      "Skirt Type: Panel\n"
                                      "Top Lining: With Lining\n"
                                      "Bottom Lining: With Lining\n"
                                      "Top Design: Printed\n"
                                      "Bottom Design: Printed\n"
                                      "Neckline: Sweetheart Neckline\n"
                                      "Sleeve Length: 3/4th Sleeves\n"
                                      "Sleeve Type: With Sleeves Attached\n"
                                      "- Fit: Regular\n"
                                      "Top Fabric: Tissue\n"
                                      "Bottom Fabric: Art Silk\n",
                                  style: TextStyle(
                                    height: 3,
                                    wordSpacing: 1,
                                    letterSpacing: 1,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
