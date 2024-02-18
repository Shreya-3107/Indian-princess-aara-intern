import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indian_princess_web_app/screens/dashboard/checkout.dart';
import '../../Utils/constants.dart';
import '../../core/menu_list.dart';
import '../../json_model_sample/shopping_items.dart';

class Cartt extends StatelessWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  Cartt({Key? key, required this.menuItemOnSelected}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child:  Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: _size-40,
                      color: Colors.purple[800],
                      child: Text(
                        "Shopping Cart",
                        style:
                            TextStyle(fontSize: 30, fontWeight: FontWeight.w400,color: Colors.white),
                      ),
                    ),
                    CartWidget(menuItemOnSelected: (SelectedMenuItem value) {
                      menuItemOnSelected(SelectedMenuItem.checkOut);
                    },),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              //now we will make our site responsive
            ],
          ),
    );
  }
}

class CartWidget extends StatefulWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  CartWidget({Key? key, required this.menuItemOnSelected}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {

    num _subtotalState() {
      num subtotal = 0;
          for(int i=0;i<shoppingItems.length;i++){
            if(shoppingItems[i]["is_selected"])
            subtotal = subtotal+ shoppingItems[i]["price"]-shoppingItems[i]["discount"];
          }
      return subtotal;
    }

    return SizedBox(
      width: kMaxWidth,
      // height: 700,
      // color: Colors.grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: DataTable(
              dataRowHeight: 160,
              columns: const [
                DataColumn(label: Text("Item",style: TextStyle(
                  fontWeight: FontWeight.w500,fontSize: 18
                ),)),
                DataColumn(label: Text("Price",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18
                ),)),
                DataColumn(label: Text("Qty",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18
                ),)),
                DataColumn(label: Text("Discount",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18
                ),)),
                DataColumn(label: Text("Subtotal",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18
                ),)),
                DataColumn(label: Text("",style: TextStyle(
                    fontWeight: FontWeight.w500,fontSize: 18
                ),)),
              ],
              rows:  [
                for(int i=0;i<shoppingItems.length;i++)
                  DataRow(cells:[

                   DataCell(
                       ShoppingCartItemColumn(
                         itemRate: shoppingItems[i]["price"]-shoppingItems[i]["discount"],
                         itemPrice: shoppingItems[i]["price"],
                       itemImage:shoppingItems[i]["image"],
                       itemDescription:shoppingItems[i]["image_description"],
                       itemSize:shoppingItems[i]["image_size"],
                       itemQtyCount: shoppingItems[i]["image_qty_count"],
                         isRemove: true,
                       )
                   ),

                   DataCell(
                       Padding(
                         padding: EdgeInsets.only(top:12),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                             children:[
                               Text("Rs. "+(shoppingItems[i]["price"]).toString()
                               ),]
                         ),
                       )
                   ),

                    DataCell(
                        Padding(
                          padding: EdgeInsets.only(top:12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Row(
                                  children: [
                                    IconButton(onPressed: (){
                                      setState(() {
                                        if(shoppingItems[i]["image_qty_count"]>1) {
                                          shoppingItems[i]["image_qty_count"]--;
                                          shoppingItems[i]["price"] =
                                              shoppingItems[i]["x"] *
                                                  shoppingItems[i]["image_qty_count"];
                                          shoppingItems[i]["discount"] =
                                              shoppingItems[i]["y"] *
                                                  shoppingItems[i]["image_qty_count"];
                                          shoppingItems[i]["subtotal"] =
                                              shoppingItems[i]["price"] -
                                                  shoppingItems[i]["discount"];
                                        }});

                                    },
                                        splashRadius: 0.01,
                                        icon: const FaIcon(
                                          FontAwesomeIcons.minus,size: 12,color: Colors.grey,
                                        )),
                                    SizedBox(
                                      child: Text(shoppingItems[i]["image_qty_count"].toString()),
                                    ),
                                    IconButton(onPressed: (){
                                      setState(() {
                                        shoppingItems[i]["image_qty_count"]++;
                                        shoppingItems[i]["price"]=shoppingItems[i]["x"]*shoppingItems[i]["image_qty_count"];
                                        shoppingItems[i]["discount"]=shoppingItems[i]["y"]*shoppingItems[i]["image_qty_count"];
                                        shoppingItems[i]["subtotal"]=shoppingItems[i]["price"]-shoppingItems[i]["discount"];
                                      });

                                    },
                                        splashRadius: 0.01,
                                        icon: const FaIcon(
                                            FontAwesomeIcons.plus,size: 12,color: Colors.grey,
                                        )),
                                  ],
                                )
                              ]
                          ),
                        )
                    ),

                    DataCell(
                        Padding(
                          padding: EdgeInsets.only(top:12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                    Text("Rs. "+(shoppingItems[i]["discount"]).toString()
                                ),]
                          ),
                        )
                    ),
                    DataCell(
                        Padding(
                          padding: EdgeInsets.only(top:12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                  Text("Rs. "+(shoppingItems[i]["price"]-shoppingItems[i]["discount"]).toString()
                                ),]
                          ),
                        )
                    ),
                    DataCell(
                        Padding(
                          padding: EdgeInsets.only(top:12),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.purple[800],
                                    value: shoppingItems[i]["is_selected"],
                                    onChanged: (bool? value) {
                                    setState(() {
                                        shoppingItems[i]["is_selected"] = value!;
                                    });
                                  },
                                  ),
    ]
                          ),
                        )
                    ),
                  ],
                  ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: 450,
            height: 700,
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "DISCOUNT",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Padding(
                  padding:EdgeInsets.all(10) ,child: Row(
                    children: [
                      Text("Coupons"),
                      Spacer(),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.purple[800], // Background color
                        ),
                          onPressed: (){},
                          child: Text("ADD COUPON")
                      )
                    ]
                ),
                ),

                const Text("SUMMARY",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Padding(
                  padding:EdgeInsets.all(10) ,child: Row(
                    children: [
                      Text("Subtotal    "),
                      Spacer(),
                      Text(_subtotalState().toString()),
                      Spacer(),
                    ]
                ),
                ),
               const  Padding(
                  padding:EdgeInsets.all(10) ,child: Row(
                    children: [
                      Text("Discount"),
                      Spacer(),
                      Text("Rs.0"),
                      Spacer(),
                    ]
                ),
                ),
                Divider(),
                Padding(
                  padding:EdgeInsets.all(10) ,child: Row(
                    children: [
                      Text("Order Total",style: TextStyle(fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text((_subtotalState()).toString(),style: TextStyle(fontWeight: FontWeight.w900),),
                      Spacer(),
                    ]
                ),
                ),
                Divider(),

                Row(
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 200,
                      height: 35,
                      child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: Colors.purple[800], // Background color
                        ),
                      onPressed: () {
                        widget.menuItemOnSelected(SelectedMenuItem.checkOut);
                      },
                      child: Text("CHECKOUT"),
                  ),
                    ),
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ShoppingCartItemColumn extends StatelessWidget {
  final String itemImage;
  final String itemDescription;
  final String itemSize;
  final int itemQtyCount;
  final bool isRemove;
  final int itemPrice;
  final int itemRate;

  const ShoppingCartItemColumn(
      {Key? key,
        required this.itemImage,
        required this.itemPrice,
        required this.itemDescription,
        required this.itemSize,
        required this.itemQtyCount,
        required this.isRemove,
        required this.itemRate,
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Container(
        // color: Colors.blue,
        width: 380,
        child: Row(
          children: [
        SizedBox(
          // height: 400,
          width: 100,
          child: Image(
              fit: BoxFit.fill,
              image: AssetImage(itemImage)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                // color: Colors.pink,
                child: Text(itemDescription),
              width: 250,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Size: "+itemSize),
              ),

              isRemove?

              const Row(children: [FaIcon(FontAwesomeIcons.trashCan),Text("  Remove")])

                  : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Qty:"+itemQtyCount.toString()),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Rs. "+itemRate.toString()),
                  ),
                ],)

            ],
          ),
        )
      ],
        ),
      ),
    );
  }
}
