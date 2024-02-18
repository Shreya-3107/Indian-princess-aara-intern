import 'package:flutter/material.dart';

import '../../core/menu_list.dart';
import 'menu_items.dart';

class WebMenu extends StatelessWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  const WebMenu({
    Key? key, required this.menuItemOnSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItems(
          title: 'Home',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.home);
          },
        ),
        MenuItems(
          title: 'New Arrivals',
          press: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const Dashboard()));


          },
        ),
        MenuItems(
          title: 'Store Locator',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.storeLocator);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const StoreLocator()));
          },
        ),
        MenuItems(
          title: 'My Order',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.order);
          },
        ),
        MenuItems(
          title: 'Return/Exchange',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.returnOrExchange);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => const ReturnOrExchange()));
          },
        ),
        MenuItems(
          title: 'About Us',
          press: () {

            menuItemOnSelected(
                SelectedMenuItem.aboutUs);

          },
        ),
        MenuItems(
          title: 'Contact Us',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.contactUs);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => ContactUs()));
          },
        ),
        MenuItems(
          title: 'Business Enquiry',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.businessEnquiry);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => BusinessEnquiry()));
          },
        ),
        MenuItems(
          title: 'Refund policy',
          press: () {
            menuItemOnSelected(
                SelectedMenuItem.refundPolicy);
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const RefundPolicy()));
          },
        ),
        MenuItems(
          title: 'Terms & Conditions',
          press: () {

            menuItemOnSelected(
                SelectedMenuItem.termAndServices);

          },
        ),
        MenuItems(
          title: 'FAQ',
          press: () {},
        ),
      ],
    );
  }
}

class MobMenu extends StatelessWidget {
  const MobMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            MenuItems(
              isActive: true,
              title: 'Info',
              press: () {},
            ),
            MenuItems(
              title: 'Policies',
              press: () {},
            ),
          ],
        ),
        Row(
          children: [
            MenuItems(
              title: 'Contact',
              press: () {},
            ),
            MenuItems(
              title: 'SignUp',
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}