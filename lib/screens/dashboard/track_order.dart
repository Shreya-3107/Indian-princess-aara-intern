import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({Key? key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              TrackOrderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackOrderWidget extends StatefulWidget {
  const TrackOrderWidget({super.key});

  @override
  State<TrackOrderWidget> createState() => _TrackOrderWidgetState();
}

class _TrackOrderWidgetState extends State<TrackOrderWidget> {
  String? selectedOption = "OrderID";
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [


        Container(
          height: 400,
          width: 450,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "TRACK YOUR ORDER",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ListTile(
                        title: const Text('OrderID'),
                        leading: Radio<String>(
                          activeColor: Colors.purple[800],
                          value: "OrderID",
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
                      width: 180,
                      child: ListTile(
                        title: const Text('ShippmentID'),
                        leading: Radio<String>(
                          activeColor: Colors.purple[800],
                          value: "ShippmentID",
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
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 420,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 10.0),
                      hintText: 'Enter Order ID or Tracking Number',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 40,
                  width: 420,
                  padding: const EdgeInsets.symmetric(),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[800],
                    ),
                    child: const Text("Track Order"),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

