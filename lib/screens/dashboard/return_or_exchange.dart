import 'package:flutter/material.dart';


class ReturnOrExchange extends StatelessWidget {
  const ReturnOrExchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  // Container(
                  //   padding: EdgeInsets.all(5.0),
                  //   height: 800,
                  //   width: 800,
                  // ),
                  Expanded( // Expand to take remaining space
                    child: Center(
                      child: Container(
                        height: 500,
                        width: 450,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Returns & Exchanges", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                              const SizedBox(height: 40,),
                              const Text("Enter your order number and Email \n        or Phone to find your order", style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15),),
                              const SizedBox(height: 20,),
                              const SizedBox(
                                width: 420,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
                                    hintText: 'Order Number',
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              const SizedBox(
                                width: 420,
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 10.0),
                                    hintText: 'Email or Phone',
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Container(
                                height: 40,
                                width: 420,
                                padding: const EdgeInsets.symmetric(),
                                child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple[800],
                                  ),
                                  child: const Text("FIND YOUR ORDER"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}



