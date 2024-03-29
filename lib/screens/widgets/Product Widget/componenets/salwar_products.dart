import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../../../../Utils/constants.dart';
import '../../../../json_model_sample/salwar_list.dart';


class SalwarsProductCard extends StatelessWidget {
  const SalwarsProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 4,
      itemCount: salwarProducts.length,
      itemBuilder: (BuildContext context, int index) => SalwarProducts(
        press: () {},
        salwarproducts: salwarProducts[index], SalwarProducts: null,
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class MobSalwarProductCard extends StatelessWidget {
  const MobSalwarProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 2,
      itemCount: salwarProducts.length,
      itemBuilder: (BuildContext context, int index) => SalwarProducts(
        press: () {},
        salwarproducts: salwarProducts[index], SalwarProducts: null,
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class SalwarProducts extends StatefulWidget {
  final SalwarProduct salwarproducts;
  final VoidCallback press;
  const SalwarProducts({
    Key? key,
    required this.salwarproducts,
    required this.press, required SalwarProducts,
  }) : super(key: key);

  @override
  State<SalwarProducts> createState() => _SalwarProductsState();
}

class _SalwarProductsState extends State<SalwarProducts> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: AnimatedContainer(
          duration: kDefaultDuration,
          width: 300,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kgreyColor, width: 3),
              boxShadow: [if (isHover) kDefaultShadow]),
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      widget.salwarproducts.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.salwarproducts.title,
                      style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "\$${widget.salwarproducts.price}",
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Text(
                      "${NumberFormat.currency(symbol: '₹').format(widget.salwarproducts.price)}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              isHover
                  ? Container(
                      color: Colors.black12,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            color: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            height: 40,
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
                            },
                            child: const Text(
                              "Quick View",
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            color: kSecondaryColor,
                            height: 40,
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
                            },
                            child: const Text(
                              "Shop Now",
                              style: TextStyle(color: kWhiteColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ));
  }
}
