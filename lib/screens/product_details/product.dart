import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../../Utils/constants.dart';
import '../../json_model_sample/new_arrivals_list.dart';
import '../../model/product_list.dart';
import '../../model/trending_model.dart';

class ProductPage extends StatelessWidget {
  final List<ProductList>? trendingProducts;
  const ProductPage({Key? key, this.trendingProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        //shrink wrap to avoid error
        shrinkWrap: true,
        // physics: const ScrollPhysics(),
        crossAxisCount: 4,
        itemCount: newArrivals.length,
        itemBuilder: (BuildContext context, int index) => TrendingProducts(press: () {}, trendingitems: trendingItems[index],),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}

class TrendingProducts extends StatefulWidget {
  final TrendingItems trendingitems;
  final VoidCallback press;
  const TrendingProducts({super.key, required this.trendingitems, required this.press,});

  @override
  State<TrendingProducts> createState() => _TrendingProductsState();
}

class _TrendingProductsState extends State<TrendingProducts> {
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
              padding: const EdgeInsets.only(top : 8.0),
              child: Column(
                children: [

                  Image.asset(
                    widget.trendingitems.image,
                    height: 150,
                    width: 140,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    widget.trendingitems.title,
                    style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Text(
                    NumberFormat.currency(symbol: '₹').format(widget.trendingitems.price),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            if (isHover) Container(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: kSecondaryColor,
                      width: 3
                  )
              ),

              child: Row(
                children: [

                  Image.asset(
                    widget.trendingitems.image,
                    height: 250,
                    width: 190,
                    fit: BoxFit.contain,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        widget.trendingitems.title,
                        style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const SizedBox(
                        width: 100,
                        child: Text(
                          "Some information about the clothes",
                          style:
                          TextStyle(fontSize: 12,),
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
                              "\$${widget.trendingitems.price}",
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
                                // Navigator.push(context, MaterialPageRoute(
                                //     builder: (context) => const Dashboard()));
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
