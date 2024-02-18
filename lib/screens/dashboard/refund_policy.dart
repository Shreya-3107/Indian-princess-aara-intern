import 'package:flutter/material.dart';

class RefundPolicy extends StatelessWidget {
  const RefundPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "REFUND POLICY",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 500,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "REFUND POLICY",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("*Insert policy information here*"),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "CANCELLATION POLICY",
                  style: TextStyle(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("*Insert policy information here*"),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
