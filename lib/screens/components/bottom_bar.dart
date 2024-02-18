import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBody extends StatelessWidget {
  const BottomBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 400,
          width: currentWidth>1000?currentWidth:1000,
          color: Colors.purple[800],
          child: Row(
            children: [
              // const SizedBox(
              //   width: 280,
              // ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "INFO",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()));
                      },
                      child: const Text(
                        "About Us",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const TrackOrder()));
                      },
                      child: const Text(
                        "Track Order",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const StoreLocator()));
                      },
                      child: const Text(
                        "Store Locator",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const BusinessEnquiry()));
                      },
                      child: const Text(
                        "Business Enquiry",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUs()));
                      },
                      child: const Text(
                        "Contact Us",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ReturnOrExchange()));
                      },
                      child: const Text(
                        "Return/Exchange",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsOfServices()));
                      },
                      child: const Text(
                        "Terms Of Service",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RefundPolicy()));
                      },
                      child: const Text(
                        "Refund Policy",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "POLICIES",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "FAQ",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Secure Shopping",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Terms and Conditions",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Shipping policy",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Return & Exchange policy",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Refund & Cancellation policy",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Return/Exchange form",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "CONTACT",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "For any related query call or WhatsApp us at\n1234567890",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "(Mon - Sat 9.00 AM - 6.00 PM IST)",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Email us at support@abc.com",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              Spacer(),
              Container(
                padding: const EdgeInsets.all(20.0),
                child:  const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "SIGN UP AND SAVE",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w100),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Subscribe to get special offers,\nfree giveaways and once-in-a-lifetime\ndeals",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                        width: 200,
                        height: 40,
                        // Note: Same code is applied for the TextFormField as well
                        child : TextField(
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.white
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.mail,color: Colors.white,),
                            hintText: "Enter your email",
                            hintStyle: TextStyle(
                                fontSize: 13,
                                color: Colors.white
                            ),
                            focusedBorder:UnderlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder( //<-- SEE HERE
                              borderSide: BorderSide(
                                  width: 1, color: Colors.white),
                            ),
                          ),
                        )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 80,
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.instagram,size: 20,color: Colors.white,),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.facebook,size: 20,color: Colors.white,),
                          Spacer(),
                          FaIcon(FontAwesomeIcons.pinterest,size: 20,color: Colors.white,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 280,
              // )
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}