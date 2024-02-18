// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
// import '../../Utils/constants.dart';
// import '../../main_page.dart';
//
//
//
// //change the name of class
// class ProductBanner extends StatefulWidget {
//   const ProductBanner({Key? key}) : super(key: key);
//
//   @override
//   _ProductBannerState createState() => _ProductBannerState();
// }
//
// class _ProductBannerState extends State<ProductBanner> {
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         CarouselSlider(
//             items: [
//               SliderCard(
//                   title: 'Kurtas',
//                   image: 'assets/products/banner/Ch_2.png',
//                   press: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
//                   }),
//               SliderCard(
//                   title: 'Salwars',
//                   image: 'assets/products/banner/Ch_Chudi_4.png',
//                   press: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
//                   }),
//               SliderCard(
//                   title: 'Ethnic',
//                   image: 'assets/products/banner/Ch_Chudi_4.png',
//                   press: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
//                   }),
//               SliderCard(
//                   title: 'Saree',
//                   image: 'assets/products/banner/Saree.png',
//                   press: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const MasterScreen()));
//                   }),
//             ],
//             options: CarouselOptions(
//                 height: _size.width == 300
//                     ? 250
//                     : _size.width >= 500
//                         ? 500
//                         : 300,
//                 aspectRatio: 16 / 9,
//                 viewportFraction: 1,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: const Duration(seconds: 3),
//                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 scrollDirection: Axis.horizontal,
//                 onPageChanged: (int p, CarouselPageChangedReason) {
//                   setState(() {
//                     index = p;
//                   });
//                 })),
//         DotsIndicator(
//           dotsCount: 4,
//           position: index.toDouble(),
//           decorator: DotsDecorator(
//             activeColor: kPrimaryColor.withOpacity(0.5),
//             size: const Size.square(9.0),
//             activeSize: const Size(18.0, 9.0),
//             activeShape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0)),
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class SliderCard extends StatelessWidget {
//   const SliderCard({
//     Key? key,
//     required this.title,
//     required this.image,
//     required this.press,
//   }) : super(key: key);
//   final String title, image;
//   final VoidCallback press;
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       color: kgreyColor,
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AutoSizeText(
//                 "$title Made For You",
//                 textAlign: TextAlign.center,
//                 minFontSize: 16,
//                 maxLines: 2,
//                 style: TextStyle(
//                   fontSize: _size.width >= 500 ? 28 : 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               InkWell(
//                 onTap: press,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   decoration: const BoxDecoration(
//                     color: Colors.black,
//                   ),
//                   child: Text(
//                     "Shop Now",
//                     style: TextStyle(
//                       fontSize: _size.width >= 500 ? 18 : 12,
//                       color: kWhiteColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )),
//           Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 image,
//                 height: _size.width >= 500 ? 400 : 200,
//                 width: _size.width >= 500 ? 400 : 200,
//                 fit: BoxFit.contain,
//               ),
//             ],
//           )),
//         ],
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/menu_list.dart';
import '../../../json_model_sample/brands_list.dart';
import '../../../json_model_sample/new_arrivals_list.dart';
import '../../../utils/Constants.dart';
import '../../../utils/validation.dart';
import '../../components/slider_card.dart';
import '../../product_details/product.dart';
import '../category/category.dart';
import 'componenets/all_products.dart';
import 'componenets/brands.dart';
import 'componenets/carousel.dart';
import 'componenets/kurta_product.dart';
import 'componenets/new_arrive_products.dart';
import 'componenets/testimonials.dart';




//change the name of class
class ProductBanner extends StatefulWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  const ProductBanner({Key? key,required this.menuItemOnSelected}) : super(key: key);

  @override
  _ProductBannerState createState() => _ProductBannerState();
}

class _ProductBannerState extends State<ProductBanner> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 20),
          
          CarouselWidget(index: index,),
          
          Container(
            // padding: EdgeInsets.all(50.0),
            constraints: const BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20,),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Brands",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),

                BrandWidget(menuItemOnSelected: (SelectedMenuItem value) {
                  widget.menuItemOnSelected(SelectedMenuItem.productView);
                },),

                const SizedBox(height: 20,),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trending Products",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20,),

                ProductPage(),

                const SizedBox(
                  height: 40,
                ),
                size>1350?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/dashboard/gift_card.png',
                      height: size>800?600:300,
                      width: size>800?750:450,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 500,
                      width: 550,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GIFT CARD",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                              "We value our relationships with both current and future customers,\nand we hope that we can convey our appreciation to them through the exceptional quality of the product and the efficient delivery that we provide"),
                        ],
                      ),
                    )
                  ],
                ):
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/dashboard/gift_card.png',
                        height: size>800?600:300,
                        width: size>800?750:450,
                        fit: BoxFit.fill,
                      ),

                      Container(
                        alignment: Alignment.center,
                        height: 250,
                        width: 450,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "GIFT CARD",
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(

                                "We value our relationships with both current and future customers,\nand "
                                    "we hope that we can convey our appreciation to them through the exceptional quality of the product"
                                    " and the efficient delivery that we provide",textAlign: TextAlign.center,),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: const Text(
                    "Our Products",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const KurtasProductCard(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: kSecondaryColor, width: 3))),
                  child: const Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Category(),
                // Row(children: [
                //   Expanded(
                //       child: SizedBox(width: kMaxWidth, height: 980, child: Category()))
                // ]),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/dashboard/design.png",
                  // height: 600,
                  width: kMaxWidth,
                  fit: BoxFit.fill,
                ),
                (size>700)?
                const DesktopTestimonials()
                 :
                 const MobileTestimonials(),


                 // if (!ResponsiveLayout.isComputer(context)) const NewProductsCard(),

                //now we create trending Product model
                const SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}


