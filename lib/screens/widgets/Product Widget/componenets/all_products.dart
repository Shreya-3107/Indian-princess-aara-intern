import 'package:flutter/material.dart';
import 'package:indian_princess_web_app/custom_widgets/responsive.dart';
import '../../../../Utils/constants.dart';
import 'kurta_product.dart';
import 'salwar_products.dart';
import 'ethnic_products.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  _AllProductState createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            TabBar(
                indicatorColor: kPrimaryColor,
                unselectedLabelColor: Colors.black,
                labelColor: kPrimaryColor,
                indicatorWeight: 2.0,
                unselectedLabelStyle: TextStyle(
                  fontSize: _size.width >= 414 ? 18 : 12,
                ),
                labelStyle: TextStyle(
                  fontSize: _size.width >= 414 ? 18 : 12,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(
                    text: "Kurtas",
                  ),
                  Tab(
                    text: "Salwars",
                  ),
                  Tab(
                    text: "Ethnic",
                  ),
                ]),
            if (ResponsiveLayout.isComputer(context))
              Container(
                height: 350,
                child: const TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: KurtasProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: SalwarsProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: EthnicProductCard(),
                    ),
                  ],
                ),
              ),
            if (!ResponsiveLayout.isComputer(context))
              Container(
                height: 600,
                child: const TabBarView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobSalwarProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobEthnicProductCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: MobKurtaProductCard(),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
