import 'package:flutter/material.dart';

import 'bubble_widget.dart';
//import 'package:flutter_svg/flutter_svg.dart';


class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BubbleWidget(
          image: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset(
                  "assets/images/full_background_user.png",
                  // width: MediaQuery.of(context).size.width,
                  // fit: BoxFit.fitHeight,
                  //  height: MediaQuery.of(context).size.height*0.50 ,

                  // scale: 1,
                ).image,
              ),
            ),
          ),
        ),
        child,
        //),
      ],
    );
  }
}
