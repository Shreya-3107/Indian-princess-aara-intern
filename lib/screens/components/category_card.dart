import 'package:flutter/material.dart';
import 'package:indian_princess_web_app/json_model_sample/color_list.dart';

import '../../utils/Constants.dart';

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: widget.press,
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Container(
          width: 270,
          decoration: BoxDecoration(
            color: isHover ? Colors.purple[100] : Colors.grey.shade100,
            boxShadow: [if (isHover) kDefaultShadow],
          ),
          child: Card(
            color: Colors.deepPurple.shade50,
            child: Stack(
              children: [
                Image.asset(
                  widget.image,
                  height: 400,
                  width: 400,
                  fit: BoxFit.contain,
                ),
                if (isHover)
                  Positioned(
                    bottom: 15,
                    left: 8,
                    right: 8,
                    child: MaterialButton(
                      color: Colors.purple[800], //kSecondaryColor,
                      height: 40,
                      onPressed: () {},
                      child: Text(
                        widget.title,
                        style: TextStyle(color: kWhiteColor),
                      ),
                    ),
                  ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: TextButton(
                    onPressed: null,
                    child: Text(
                      "New",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      elevation: 2,
                      backgroundColor: Colors.purple[800],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}