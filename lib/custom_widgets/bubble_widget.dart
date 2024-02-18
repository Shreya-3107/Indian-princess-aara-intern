
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';

import '../utils/Constants.dart';

class BubbleWidget extends StatelessWidget {
  final Widget image;
  const BubbleWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image,
        Positioned.fill(
          child: FloatingBubbles.alwaysRepeating(
            noOfBubbles: 30,
            colorsOfBubbles: const [
              Constants.bgGrey,
            ],
            sizeFactor: 0.01,
            opacity: 20,
            speed: BubbleSpeed.slow,
            paintingStyle: PaintingStyle.fill,
            shape: BubbleShape.circle, //This is the default
          ),
        )
      ],
    );
  }
}
