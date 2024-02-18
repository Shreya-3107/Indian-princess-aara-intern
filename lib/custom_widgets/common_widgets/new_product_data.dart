import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../../core/menu_list.dart';
import '../../model/product_list.dart';
typedef CartInfoCallBack = void Function(
    SelectedMenuItem, );

class NewProductWidget extends StatefulWidget {
  final CartInfoCallBack menuItemOnSelected;

  final ProductList newProducts;
  final VoidCallback press;
  const NewProductWidget({
    Key? key,
    required this.newProducts,
    required this.press, required this.menuItemOnSelected,
  }) : super(key: key);

  @override
  State<NewProductWidget> createState() => _NewProductWidgetState();
}

class _NewProductWidgetState extends State<NewProductWidget> {
  bool isHover = false;


  @override
  Widget build(BuildContext context) {
    return 
      
      InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: kDefaultDuration,

          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kgreyColor, width: 3),
              boxShadow: [if (isHover) kDefaultShadow]),
          child: Container(
            padding: const EdgeInsets.only(right: 10,top: 5,bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: kSecondaryColor,
                    width: 3
                )
            ),

            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.newProducts.imageUrl,
                  height: 250,
                  width: 100,
                  fit: BoxFit.fitHeight,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.newProducts.productName,
                        style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        width: 130,
                        child: Text(
                          widget.newProducts.productDesc,
                          style:
                          const TextStyle(fontSize: 12,),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 135,
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              "\$${widget.newProducts.price}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Spacer(),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              color: kSecondaryColor,
                              height: 40,
                              onPressed: () {
                                widget.press;
                                widget.menuItemOnSelected(
                                    SelectedMenuItem.shop);
                              },
                              child: const Text(
                                "Shop Now",
                                style: TextStyle(color: kWhiteColor),
                              ),
                            ),
                          ],
                        ),
                      ),

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