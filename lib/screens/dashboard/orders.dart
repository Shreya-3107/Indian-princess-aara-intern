import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:indian_princess_web_app/screens/dashboard/track_order.dart';

import '../../json_model_sample/ordered_items.dart';
import '../../json_model_sample/shopping_items.dart';

class MyOrdersWidget extends StatefulWidget {
  const MyOrdersWidget({super.key});

  @override
  State<MyOrdersWidget> createState() => _MyOrdersWidgetState();
}

class _MyOrdersWidgetState extends State<MyOrdersWidget> {
  bool isLastOrder = false;
  bool isAllOrder = true;
  bool isTrackOrder = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Container(
            height: 50,
            alignment: Alignment.center,
            width: size,
            color: Colors.purple[800],
            child: const Text(
              "MY ORDERS",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Container(
                    decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                      )
                    ]),
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: isLastOrder
                              ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.purple.shade800,
                                        width: 3))),
                            alignment: Alignment.center,
                            width: 80,
                            child: Text(
                              "Last Order",
                              style: TextStyle(
                                color: Colors.purple[800],
                              ),
                            ),
                          )
                              : TextButton(
                              onPressed: () {
                                setState(() {
                                  isLastOrder = true;
                                  isAllOrder = false;
                                  isTrackOrder = false;
                                });
                              },
                              child: Text(
                                "Last Order",
                                style: TextStyle(color: Colors.purple[800]),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: isAllOrder
                              ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.purple.shade800,
                                        width: 3))),
                            alignment: Alignment.center,
                            width: 80,
                            child: Text(
                              "All Orders",
                              style: TextStyle(
                                color: Colors.purple[800],
                              ),
                            ),
                          )
                              : TextButton(
                              onPressed: () {
                                setState(() {
                                  isLastOrder = false;
                                  isAllOrder = true;
                                  isTrackOrder = false;
                                });
                              },
                              child: Text(
                                "All Orders",
                                style: TextStyle(color: Colors.purple[800]),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: isTrackOrder
                              ? Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.purple.shade800,
                                        width: 3))),
                            alignment: Alignment.center,
                            width: 80,
                            child: Text(
                              "Track Order",
                              style: TextStyle(
                                color: Colors.purple[800],
                              ),
                            ),
                          )
                              : TextButton(
                              onPressed: () {
                                setState(() {
                                  isLastOrder = false;
                                  isAllOrder = false;
                                  isTrackOrder = true;
                                });
                              },
                              child: Text(
                                "Track Order",
                                style: TextStyle(color: Colors.purple[800]),
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (isLastOrder) const LastOrderWidget(),
                  if (isAllOrder) const AllOrderWidget(),
                  if (isTrackOrder) const TrackOrderWidget(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LastOrderWidget extends StatefulWidget {
  const LastOrderWidget({super.key});

  @override
  State<LastOrderWidget> createState() => _LastOrderWidgetState();
}

class _LastOrderWidgetState extends State<LastOrderWidget> {
  num _subtotalState() {
    num subtotal = 0;
    for (int i = 0; i <shoppingItems.length; i++) {
      if (shoppingItems[i]["is_selected"]) {
        subtotal =
            subtotal + shoppingItems[i]["price"] - shoppingItems[i]["discount"];
      }
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Column(
      children: [
        size>1030?Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                for (int i = 0; i < shoppingItems.length; i++)
                  LastOrderList(
                    itemRate: shoppingItems[i]["price"] -
                        shoppingItems[i]["discount"],
                    itemPrice: shoppingItems[i]["price"],
                    itemImage: shoppingItems[i]["image"],
                    itemDescription: shoppingItems[i]["image_description"],
                    itemSize: shoppingItems[i]["image_size"],
                    itemQtyCount: shoppingItems[i]["image_qty_count"],
                    isRemove: true,
                  )
              ],
            ),
            Column(
              children: [
                Container(
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),

                  // padding: EdgeInsets.all(15),
                  width: 450,
                  // height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "ORDER DETAILS",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Order ID"),
                          Spacer(),
                          Text("#43sgf1j34h"),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Order placed on"),
                          Spacer(),
                          Text("Insert date"),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Name",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "Insert Name",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Bill ID"),
                          Spacer(),
                          Text("#43jh41j34h"),
                          // Spacer(),
                        ]),
                      ),
                      Center(
                        child: SizedBox(
                          height: 30,
                          width: 90,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[800],
                              ),
                              child: const Text("Bill Copy")),
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "SHIPMENT DETAILS ",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Shipment ID",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "#4j3k42k",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Name",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "Insert Name",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipment Address",
                                style: TextStyle(),
                              ),
                              Spacer(),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Insert Address Insert Address Insert Address "
                                        "Insert Address Insert Address Insert Address ",
                                    style: TextStyle(),
                                  )),
                              // Spacer(),
                            ]),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            width: 110,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("Track Order")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),

                  // padding: EdgeInsets.all(15),
                  width: 450,
                  // height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "SUMMARY",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text("Subtotal    "),
                          const Spacer(),
                          Text(_subtotalState().toString()),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Discount"),
                          Spacer(),
                          Text("Rs.0"),
                          // Spacer(),
                        ]),
                      ),
                      const Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text(
                            "Order Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            (_subtotalState()).toString(),
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          // Spacer(),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ): Column(
          children: [
            Column(
              children: [
                for (int i = 0; i < shoppingItems.length; i++)
                  LastOrderList(
                    itemRate: shoppingItems[i]["price"] -
                        shoppingItems[i]["discount"],
                    itemPrice: shoppingItems[i]["price"],
                    itemImage: shoppingItems[i]["image"],
                    itemDescription: shoppingItems[i]["image_description"],
                    itemSize: shoppingItems[i]["image_size"],
                    itemQtyCount: shoppingItems[i]["image_qty_count"],
                    isRemove: true,
                  )
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                Container(
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),

                  // padding: EdgeInsets.all(15),
                  width: 450,
                  // height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "ORDER DETAILS",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Order ID"),
                          Spacer(),
                          Text("#43sgf1j34h"),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Order placed on"),
                          Spacer(),
                          Text("Insert date"),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Name",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "Insert Name",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Bill ID"),
                          Spacer(),
                          Text("#43jh41j34h"),
                          // Spacer(),
                        ]),
                      ),
                      Center(
                        child: SizedBox(
                          height: 30,
                          width: 90,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple[800],
                              ),
                              child: const Text("Bill Copy")),
                        ),
                      ),
                      const Divider(),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "SHIPMENT DETAILS ",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Shipment ID",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "#4j3k42k",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "Name",
                            style: TextStyle(),
                          ),
                          Spacer(),
                          Text(
                            "Insert Name",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shipment Address",
                                style: TextStyle(),
                              ),
                              Spacer(),
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Insert Address Insert Address Insert Address "
                                        "Insert Address Insert Address Insert Address ",
                                    style: TextStyle(),
                                  )),
                              // Spacer(),
                            ]),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            width: 110,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("Track Order")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),

                  // padding: EdgeInsets.all(15),
                  width: 450,
                  // height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "SUMMARY",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text("Subtotal    "),
                          const Spacer(),
                          Text(_subtotalState().toString()),
                          // Spacer(),
                        ]),
                      ),
                      const Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text("Discount"),
                          Spacer(),
                          Text("Rs.0"),
                          // Spacer(),
                        ]),
                      ),
                      const Divider(),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text(
                            "Order Total",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            (_subtotalState()).toString(),
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          // Spacer(),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class LastOrderList extends StatelessWidget {
  final String itemImage;
  final String itemDescription;
  final String itemSize;
  final int itemQtyCount;
  final bool isRemove;
  final int itemPrice;
  final int itemRate;

  const LastOrderList({
    Key? key,
    required this.itemImage,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemSize,
    required this.itemQtyCount,
    required this.isRemove,
    required this.itemRate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          )
        ]),
        padding: const EdgeInsets.all(15),

        // color: Colors.blue,
        width: 500,
        child: Row(
          children: [
            SizedBox(
              // height: 400,
              width: 100,
              child: Image(fit: BoxFit.fill, image: AssetImage(itemImage)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // color: Colors.pink,
                    width: 340,
                    // color: Colors.pink,
                    child: Text(itemDescription),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Size: $itemSize"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Qty:$itemQtyCount"),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Rs. $itemRate"),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AllOrderWidget extends StatefulWidget {
  const AllOrderWidget({super.key});

  @override
  State<AllOrderWidget> createState() => _AllOrderWidgetState();
}

class _AllOrderWidgetState extends State<AllOrderWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size,
          // padding: EdgeInsets.all(10.0),
          //color: Colors.green,
          child: Column(
            children: [
              for (int i = 0; i < 3; i++)
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: OrderComponent(),
                )
            ],
          ),
        )
      ],
    );
  }
}

class OrderComponent extends StatefulWidget {
  const OrderComponent({super.key});

  @override
  State<OrderComponent> createState() => _OrderComponentState();
}

class _OrderComponentState extends State<OrderComponent> {
  bool selected = false;
  double animatedHeight = ((190 * orderedItems.length)) as double;

  num _subtotalState() {
    num subtotal = 0;
    for (int i = 0; i < shoppingItems.length; i++) {
      if (shoppingItems[i]["is_selected"]) {
        subtotal =
            subtotal + shoppingItems[i]["price"] - shoppingItems[i]["discount"];
      }
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            )
          ]),
      //color: Colors.white,
      width: size>1150?1100:600,

      //height: selected ? animatedHeight : 250,

      height: size>1150?(selected? animatedHeight+20 : 250): (selected?animatedHeight+690 : 431),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0),
            child: Row(
              children: [
                Text(
                  "ORDER ID:   ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Insert ID")
              ],
            ),
          ),
          size>1150? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: 0.seconds,
                height: selected?animatedHeight-50:175,
                margin: const EdgeInsets.all(15.0),

                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                    )
                  ],
                  // color: Colors.grey[200],

                  color: Colors.grey[200],
                  border: const Border(
                    top: BorderSide(
                      width: 2,
                      color: Color(0xFFEFEFEF),
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Color(0xFFEFEFEF),
                    ),
                  ),
                ),
                // decoration: const BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey,
                //         blurRadius: 5.0,
                //       )
                //     ]
                // ),
                child: selected
                    ? Column(
                  children: [
                    for (int i = 0; i < orderedItems.length; i++)
                      AllOrderList(
                        index : i,
                        itemRate: orderedItems[i]["price"] -
                            orderedItems[i]["discount"],
                        itemPrice: orderedItems[i]["price"],
                        itemImage: orderedItems[i]["image"],
                        itemDescription: orderedItems[i]
                        ["image_description"],
                        itemSize: orderedItems[i]["image_size"],
                        itemQtyCount: orderedItems[i]["image_qty_count"],
                        isRemove: true,
                      )
                  ],
                )
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < orderedItems.length; i++)
                        AllOrderList(
                          index : i,
                          itemRate: orderedItems[i]["price"] -
                              orderedItems[i]["discount"],
                          itemPrice: orderedItems[i]["price"],
                          itemImage: orderedItems[i]["image"],
                          itemDescription: orderedItems[i]
                          ["image_description"],
                          itemSize: orderedItems[i]["image_size"],
                          itemQtyCount: orderedItems[i]
                          ["image_qty_count"],
                          isRemove: true,
                        )
                    ],
                  ),
                ),
              ),
              selected
                  ? FadeInRight(
                duration: 1.seconds,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(children: [
                            const Text(
                              "ORDER DETAILS",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey[100],
                                      side: const BorderSide(width: 1.0)),
                                  onPressed: () {
                                    setState(() {
                                      selected = !selected;
                                    });
                                  },
                                  child: Text(
                                    "View less",
                                    style: TextStyle(
                                        color: Colors.purple[800]),
                                  ),
                                )),
                          ]),
                        ),
                      ),
                      FadeInRight(
                          delay:0.25.seconds,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Order ID"),
                                  Spacer(),
                                  Text("#43sgf1j34h"),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Order placed on"),
                                  Spacer(),
                                  Text("Insert date"),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Insert Name",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Bill ID"),
                                  Spacer(),
                                  Text("#43jh41j34h"),
                                  // Spacer(),
                                ]),
                              ),
                              Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 90,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple[800],
                                      ),
                                      child: const Text("Bill Copy")),
                                ),
                              ),
                            ],
                          )),

                      const Divider(),
                      FadeInRight(
                        delay: 0.5.seconds,
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "SHIPMENT DETAILS ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900, fontSize: 15),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "Shipment ID",
                                  style: TextStyle(),
                                ),
                                Spacer(),
                                Text(
                                  "#4j3k42k",
                                  style: TextStyle(),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "Name",
                                  style: TextStyle(),
                                ),
                                Spacer(),
                                Text(
                                  "Insert Name",
                                  style: TextStyle(),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shipment Address",
                                      style: TextStyle(),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Insert Address Insert Address Insert Address "
                                              "Insert Address Insert Address Insert Address ",
                                          style: TextStyle(),
                                        )),
                                    // Spacer(),
                                  ]),
                            ),
                          ],
                        ),
                      ),

                      const Divider(),
                      FadeInRight(
                          delay: 0.75.seconds,
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "SUMMARY ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900, fontSize: 15),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs.2000",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Discount ",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs.0",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order Total",
                                        style: TextStyle(),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                          width: 200,
                                          child: Text(
                                            "Rs.2000",
                                            style: TextStyle(),
                                          )),
                                      // Spacer(),
                                    ]),
                              ),
                            ],
                          )),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            width: 110,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("Track Order")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : FadeInRightBig(
                  from : 100,
                  duration: 1.seconds,
                  child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "ORDER PLACED:  ",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                          Text(
                            "Insert date",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text(
                            "TOTAL:  ",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                          Text(
                            _subtotalState().toString(),
                            style: const TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                side: const BorderSide(width: 1.0)),
                            onPressed: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: const Text(
                              "View all details",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 30,
                              width: 110,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple[800],
                                  ),
                                  child: const Text("FEEDBACK",style: TextStyle(
                                    color: Colors.white
                                  ),)),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 130,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("TRACK ORDER")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ): Column(
            children: [
              AnimatedContainer(
                duration: 0.seconds,
                height: selected?animatedHeight-50:175,
                margin: const EdgeInsets.all(15.0),

                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1.0,
                    )
                  ],
                  // color: Colors.grey[200],

                  color: Colors.grey[200],
                  border: const Border(
                    top: BorderSide(
                      width: 2,
                      color: Color(0xFFEFEFEF),
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Color(0xFFEFEFEF),
                    ),
                  ),
                ),
                // decoration: const BoxDecoration(
                //     color: Colors.white,
                //     boxShadow: [
                //       BoxShadow(
                //         color: Colors.grey,
                //         blurRadius: 5.0,
                //       )
                //     ]
                // ),
                child: selected
                    ? Column(
                  children: [
                    for (int i = 0; i < orderedItems.length; i++)
                      AllOrderList(
                        index : i,
                        itemRate: orderedItems[i]["price"] -
                            orderedItems[i]["discount"],
                        itemPrice: orderedItems[i]["price"],
                        itemImage: orderedItems[i]["image"],
                        itemDescription: orderedItems[i]
                        ["image_description"],
                        itemSize: orderedItems[i]["image_size"],
                        itemQtyCount: orderedItems[i]["image_qty_count"],
                        isRemove: true,
                      )
                  ],
                )
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int i = 0; i < orderedItems.length; i++)
                        AllOrderList(
                          index : i,
                          itemRate: orderedItems[i]["price"] -
                              orderedItems[i]["discount"],
                          itemPrice: orderedItems[i]["price"],
                          itemImage: orderedItems[i]["image"],
                          itemDescription: orderedItems[i]
                          ["image_description"],
                          itemSize: orderedItems[i]["image_size"],
                          itemQtyCount: orderedItems[i]
                          ["image_qty_count"],
                          isRemove: true,
                        )
                    ],
                  ),
                ),
              ),
              selected
                  ? FadeInRight(
                duration: 1.seconds,
                child: Container(
                  margin: const EdgeInsets.only(top:15,left: 20),
                  decoration:
                  const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                    )
                  ]),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 450,
                        color: Colors.purple[800],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(children: [
                            const Text(
                              "ORDER DETAILS",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.grey[100],
                                      side: const BorderSide(width: 1.0)),
                                  onPressed: () {
                                    setState(() {
                                      selected = !selected;
                                    });
                                  },
                                  child: Text(
                                    "View less",
                                    style: TextStyle(
                                        color: Colors.purple[800]),
                                  ),
                                )),
                          ]),
                        ),
                      ),
                      FadeInRight(
                          delay:0.5.seconds,
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Order ID"),
                                  Spacer(),
                                  Text("#43sgf1j34h"),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Order placed on"),
                                  Spacer(),
                                  Text("Insert date"),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Insert Name",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text("Bill ID"),
                                  Spacer(),
                                  Text("#43jh41j34h"),
                                  // Spacer(),
                                ]),
                              ),
                              Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 90,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple[800],
                                      ),
                                      child: const Text("Bill Copy")),
                                ),
                              ),
                            ],
                          )),

                      const Divider(),
                      FadeInRight(
                        delay: 1.seconds,
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "SHIPMENT DETAILS ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900, fontSize: 15),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "Shipment ID",
                                  style: TextStyle(),
                                ),
                                Spacer(),
                                Text(
                                  "#4j3k42k",
                                  style: TextStyle(),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(children: [
                                Text(
                                  "Name",
                                  style: TextStyle(),
                                ),
                                Spacer(),
                                Text(
                                  "Insert Name",
                                  style: TextStyle(),
                                ),
                                // Spacer(),
                              ]),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shipment Address",
                                      style: TextStyle(),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                        width: 200,
                                        child: Text(
                                          "Insert Address Insert Address Insert Address "
                                              "Insert Address Insert Address Insert Address ",
                                          style: TextStyle(),
                                        )),
                                    // Spacer(),
                                  ]),
                            ),
                          ],
                        ),
                      ),

                      const Divider(),
                      FadeInRight(
                          delay: 1.5.seconds,
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "SUMMARY ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900, fontSize: 15),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Subtotal",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs.2000",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(children: [
                                  Text(
                                    "Discount ",
                                    style: TextStyle(),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Rs.0",
                                    style: TextStyle(),
                                  ),
                                  // Spacer(),
                                ]),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Order Total",
                                        style: TextStyle(),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                          width: 200,
                                          child: Text(
                                            "Rs.2000",
                                            style: TextStyle(),
                                          )),
                                      // Spacer(),
                                    ]),
                              ),
                            ],
                          )),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: SizedBox(
                            height: 30,
                            width: 110,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("Track Order")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
                  : FadeIn(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(children: [
                          Text(
                            "ORDER PLACED:  ",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                          Text(
                            "Insert date",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(children: [
                          const Text(
                            "TOTAL:  ",
                            style: TextStyle(),
                          ),
                          // Spacer(),
                          Text(
                            _subtotalState().toString(),
                            style: const TextStyle(),
                          ),
                          // Spacer(),
                        ]),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                side: const BorderSide(width: 1.0)),
                            onPressed: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: const Text(
                              "View all details",
                              style: TextStyle(color: Colors.black),
                            ),
                          )),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              height: 30,
                              width: 110,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple[800],
                                  ),
                                  child: const Text("FEEDBACK")),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 130,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[800],
                                ),
                                child: const Text("TRACK ORDER")),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}

class AllOrderList extends StatelessWidget {
  final String itemImage;
  final String itemDescription;
  final String itemSize;
  final int itemQtyCount;
  final bool isRemove;
  final int itemPrice;
  final int itemRate;
   final int index;
   const AllOrderList({
    Key? key,
    required this.itemImage,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemSize,
    required this.itemQtyCount,
    required this.isRemove,
    required this.itemRate,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 7, top: 5),
      child: FadeInLeft(
        duration : ((index+1)*0.5).seconds,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                )
              ]),
          // color: Colors.white,
          width: 500,
          child: Row(
            children: [
              SizedBox(
                // height: 400,
                width: 100,
                child: Image(fit: BoxFit.fill, image: AssetImage(itemImage)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // color: Colors.pink,
                      width: 340,
                      // color: Colors.pink,
                      child: Text(itemDescription),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Size: $itemSize"),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Qty:$itemQtyCount"),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Rs. $itemRate"),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}