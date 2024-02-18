import 'package:flutter/material.dart';
import 'package:indian_princess_web_app/custom_widgets/responsive.dart';
import '../../../../Utils/constants.dart';
import '../../components/category_card.dart';



class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;
    return Container(
      // color: kgreyColor,
      height: 550,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryCard(
                    image: "assets/products/banner/Ch_2.png",
                    title: 'Kurtas',
                    press: () {}),
                CategoryCard(
                    image: "assets/products/banner/Ch_2.png",
                    title: 'Salwar',
                    press: () {}),
                CategoryCard(
                    image: "assets/products/banner/Ch_Chudi_4.png",
                    title: 'Ethnic',
                    press: () {}),
                CategoryCard(
                    image: "assets/products/banner/ban_5.png",
                    title: 'Ethnic',
                    press: () {}),
                CategoryCard(
                    image: "assets/products/banner/Ch_2.png",
                    title: 'Kurtas',
                    press: () {}),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            height: 40,
            width: 100,
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                elevation: 2,
                backgroundColor: Colors.purple[800],
              ),
              child: Text(
                "VIEW ALL",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


