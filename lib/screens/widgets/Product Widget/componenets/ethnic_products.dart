import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../../../../Utils/constants.dart';
import '../../../../json_model_sample/ethnic_list.dart';


class EthnicProductCard extends StatelessWidget {
  const EthnicProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 4,
      itemCount: ethnicProducts.length,
      itemBuilder: (BuildContext context, int index) => EthnicProducts(
        press: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
        },
        ethnicproduct: ethnicProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class MobEthnicProductCard extends StatelessWidget {
  const MobEthnicProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      //shrink wrap to avoid error
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 2,
      itemCount: ethnicProducts.length,
      itemBuilder: (BuildContext context, int index) => EthnicProducts(
        press: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
        },
        ethnicproduct: ethnicProducts[index],
      ),
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }
}

class EthnicProducts extends StatefulWidget {
  final EthnicProduct ethnicproduct;
  final VoidCallback press;
  const EthnicProducts({
    Key? key,
    required this.ethnicproduct,
    required this.press,
  }) : super(key: key);

  @override
  State<EthnicProducts> createState() => _SamsungProductsState();
}

class _SamsungProductsState extends State<EthnicProducts> {
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
                      widget.ethnicproduct.image,
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.ethnicproduct.title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "\$${widget.ethnicproduct.price}",
                    //   style: const TextStyle(
                    //     fontSize: 16,
                    //   ),
                    // ),
                    Text(
                      "${NumberFormat.currency(symbol: '₹').format(widget.ethnicproduct.price)}",
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
