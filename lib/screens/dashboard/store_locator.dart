import 'package:flutter/material.dart';

class StoreLocator extends StatelessWidget {
  const StoreLocator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Home/Store Locator",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "STORE LOCATOR",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 1000,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "State",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "BRANCH NAME",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "*Insert address here*",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        const Text(
                          "Phone: 0123456789",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "FIND THE STORE",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "BRANCH NAME",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "*Insert address here*",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        const Text(
                          "Phone: 0123456789",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "FIND THE STORE",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "State",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "BRANCH NAME",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "*Insert address here*",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        const Text(
                          "Phone: 0123456789",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "FIND THE STORE",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "BRANCH NAME",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "*Insert address here*",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const Text(
                          "Phone: 0123456789",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w100),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "FIND THE STORE",
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
    );
  }
}
