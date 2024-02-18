import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../Utils/constants.dart';
import '../../../components/slider_card.dart';

class CarouselWidget extends StatefulWidget {
  late int index;
  CarouselWidget({super.key, required this.index});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: [
              SliderCard(
                  title: 'Kurtas',
                  image: 'assets/images/dashboard/banner_1.png',
                  press: () {

                    // Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Dashboard()));
                  }),
              SliderCard(
                  title: 'Salwars',
                  image: 'assets/images/dashboard/banner_2.png',
                  press: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
                  }),
              SliderCard(
                  title: 'Ethnic',
                  image: 'assets/images/dashboard/banner_3.png',
                  press: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const Dashboard()));
                  }),

            ],
            options: CarouselOptions(
                height:700,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (int p, CarouselPageChangedReason) {
                  setState(() {
                    widget.index = p;
                  });
                })),
        DotsIndicator(
          dotsCount: 3,
          position: widget.index.toDouble(),
          decorator: DotsDecorator(
            activeColor: kPrimaryColor.withOpacity(0.5),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}
