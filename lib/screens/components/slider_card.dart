import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../utils/Constants.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    Key? key,
    required this.title,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String title, image;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            image,
            // width: _size.width,
            fit: BoxFit.cover,
          ),
        ),
        // ),
      ],
    );
  }
}