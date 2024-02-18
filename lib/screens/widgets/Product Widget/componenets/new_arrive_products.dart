import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../../../../Utils/constants.dart';
import '../../../../json_model_sample/new_arrivals_list.dart';


class NewProductCard extends StatelessWidget {
  const NewProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        //shrink wrap to avoid error
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisCount: 3,
        itemCount: newArrivals.length,
        itemBuilder: (BuildContext context, int index) => NewProducts(
          press: () {},
          newproducts: newArrivals[index],
        ),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}

class NewProductsCard extends StatelessWidget {
  const NewProductsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        //shrink wrap to avoid error
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisCount: 2,
        itemCount: newArrivals.length,
        itemBuilder: (BuildContext context, int index) => NewProducts(
          press: () {},
          newproducts: newArrivals[index],
        ),
        staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}

class NewProducts extends StatefulWidget {
  final NewArrivals newproducts;
  final VoidCallback press;
  const NewProducts({
    Key? key,
    required this.newproducts,
    required this.press,
  }) : super(key: key);

  @override
  State<NewProducts> createState() => _NewProductsState();
}

class _NewProductsState extends State<NewProducts> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: InkWell(
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
          child: Container(
                    padding: const EdgeInsets.only(right: 10,top: 5,bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: kSecondaryColor,
                            width: 3
                        )
                    ),

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.newproducts.image,
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
                          widget.newproducts.title,
                          style:
                          const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        const SizedBox(
                          width: 130,
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
                                "\$${widget.newproducts.price}",
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
                    ),
                  )
                ],
              ),
            ),
                  ),
        ),
        ),
      ),
    );
  }
}
