import 'package:flutter/material.dart';
import 'package:indian_princess_web_app/screens/components/theme.dart';
import '../../core/menu_list.dart';
import '../../custom_widgets/responsive.dart';
import 'package:marquee/marquee.dart';

import '../../json_model_sample/sub_menu_list.dart';
import '../../utils/Constants.dart';
import 'main_menu.dart';

class AppBarWidget extends StatefulWidget {
  final String theme;
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  const AppBarWidget({Key? key, required this.theme, required this.menuItemOnSelected}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {

  bool isExpanded = false;
  String? theme;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = widget.theme;
  }

  @override
  void didUpdateWidget(covariant AppBarWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    theme = widget.theme;

  }

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 25,
            color: Colors.purple[800],
            child: Marquee(
              text: "World Wide Shopping COD Within India                                                                         "
                  "COD AVAILABLE on all Orders                                                                         "
                  "Hassle Offer 14 Days Exchange & Returns                                                                         ",
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
          ),// Use your custom MarqueeWidget here

          Container(
            color: kWhiteColor,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: kMaxWidth,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            if (!ResponsiveLayout.isComputer(context))
                              IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  color: Colors.grey,
                                  icon: const Icon(Icons.menu)),

                            if (ResponsiveLayout.isComputer(context))
                              WebMenu(menuItemOnSelected: (SelectedMenuItem value)
                              {
                                if(value == SelectedMenuItem.order ){
                                widget.menuItemOnSelected(SelectedMenuItem.order);
                                }
                                else if(value == SelectedMenuItem.aboutUs){
                                  widget.menuItemOnSelected(SelectedMenuItem.aboutUs);
                                }else if(value == SelectedMenuItem.home){
                                  widget.menuItemOnSelected(SelectedMenuItem.home);
                                }else if(value == SelectedMenuItem.storeLocator){
                                  widget.menuItemOnSelected(SelectedMenuItem.storeLocator);
                                }else if(value == SelectedMenuItem.returnOrExchange){
                                  widget.menuItemOnSelected(SelectedMenuItem.returnOrExchange);
                                }else if(value == SelectedMenuItem.contactUs){
                                  widget.menuItemOnSelected(SelectedMenuItem.contactUs);
                                } else if(value == SelectedMenuItem.termAndServices){
                                  widget.menuItemOnSelected(SelectedMenuItem.termAndServices);
                                }else if(value == SelectedMenuItem.businessEnquiry){
                                  widget.menuItemOnSelected(SelectedMenuItem.businessEnquiry);
                                }else if(value == SelectedMenuItem.refundPolicy){
                                  widget.menuItemOnSelected(SelectedMenuItem.refundPolicy);
                                }
                                },
                              ),

                            const Spacer(),

                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: kDarkgreyColor,
                                size: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                widget.menuItemOnSelected(
                                    SelectedMenuItem.shoppingCart);
                                // Navigator.of(context).push(
                                //     MaterialPageRoute(builder: (context) => Cartt()));
                              },
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: kDarkgreyColor,
                                size: 25,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                widget.menuItemOnSelected(
                                    SelectedMenuItem.login);
                              },
                              icon: const Icon(
                                Icons.person_outline,
                                color: kDarkgreyColor,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),

              ],
            ),
          ),
          Row(
            children:[
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double imageSize = constraints.maxWidth >= 348 ? 100.0 : 75.0;
                  double height = constraints.maxHeight >= 150 ? 100.0 : 75.0;

                  // return Card(
                  //     child: Ink.image(
                  //               image: AssetImage('assets/images/IP Logo_1.png'),
                  //               child: InkWell(onTap:(){Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));} ,),
                  //     ),
                  //
                  //   );
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset(
                      'assets/images/IP Logo_1.png',
                      width: imageSize,
                      height: height,
                      fit: BoxFit.fitHeight,// You can adjust the height proportionally if needed
                    ),
                  );

                },
              ),
              const Spacer(),
              if(currentWidth>930)
                for(int i=0;i<subMenuList.length;i++)
                  Container(
                    // alignment: Alignment.centerLeft,
                    width: 125,
                    // margin:EdgeInsets.symmetric(horizontal: 50),
                    child: PopupMenuButton<String>(
                      tooltip: "",
                      splashRadius: 0.01,
                      offset: const Offset(20, 50),
                      icon:  Text(subMenuList[i]["title"]![0].toString(), style: TextStyle(fontSize: 16),),
                      itemBuilder: (context) => [
                        for(int j=0;j<subMenuList[i]["sub_title"]!.length;j++)
                          PopupMenuItem(
                            child: Text(subMenuList[i]["sub_title"]![j]),
                          ),
                      ],
                    ),
                  ),
              const Spacer(),

            ],
          ),
        ],
      ),
    );
  }


// Widget build(BuildContext context) {
//   //double height = MediaQuery.of(context).size.height;
//   double width = MediaQuery.of(context).size.width;
//   return
//     Scaffold(
//
//     //drawerScrimColor: Colors.transparent,
//     //  backgroundColor: const Color(0xfff4f3f9),
//
//     appBar: AppBar(
//
//
//       // Builder(
//       //   builder: (BuildContext context) {
//       //     return
//       //       Container(
//       //         height: 30,
//       //         color: Colors.purple[800],
//       //         // child: Row(
//       //         //   mainAxisAlignment: MainAxisAlignment.center,
//       //         //   children: <Widget>[
//       //         //     Spacer(),
//       //         //     Text("World Wide Shopping \n COD Within India",
//       //         //       style: TextStyle(
//       //         //         color: Colors.white,
//       //         //         fontFamily: "RaleWay",
//       //         //       ),textAlign: TextAlign.center,),
//       //         //     Spacer(),
//       //         //     Text("COD AVAILABLE \n On all Orders",
//       //         //       style: TextStyle(
//       //         //           color: Colors.white
//       //         //       ),textAlign: TextAlign.center,),
//       //         //     Spacer(),
//       //         //     Text("Hassle Offer \n 14 Days Exchange & Returns",
//       //         //       style: TextStyle(
//       //         //           color: Colors.white
//       //         //       ),textAlign: TextAlign.center,)
//       //         //     ,Spacer(),
//       //         //
//       //         //   ],
//       //         // ),
//       //
//       //         child: TopAnimationText(),
//       //       );
//       //
//       //
//       //
//       //   },
//       // ),
//       title:
//       Builder(
//         builder: (BuildContext context) {
//           return
//             Container(
//               height: 30,
//               color: Colors.purple[800],
//               child:  Marquee(
//                 text: "World Wide Shopping COD Within India                                                                         "
//                     "COD AVAILABLE on all Orders                                                                         "
//                     "Hassle Offer 14 Days Exchange & Returns                                                                         ",
//                 style: const TextStyle(color: Colors.white70,),
//
//               ),
//             );
//
//
//
//         },
//       ),
//       // actions: <Widget>[
//       //   // IconButton(
//       //   //   icon: isFullscreen
//       //   //       ? const Icon(Icons.fullscreen)
//       //   //       : const Icon(Icons.fullscreen_exit),
//       //   //   color: Colors.black,
//       //   //   //color: Colors.black,
//       //   //   tooltip: 'Full Screen',
//       //   //   onPressed: () {
//       //   //     if (width > 500) {
//       //   //       isFullscreen = !isFullscreen;
//       //   //       setFullScreen(isFullscreen);
//       //   //     }
//       //   //   },
//       //   // ),
//       //   const SizedBox(
//       //     width: 25,
//       //   ),
//       //   IconButton(
//       //       color: Colors.black,
//       //       tooltip: 'Dark/Light',
//       //       onPressed: () {
//       //         if (theme != null && theme == "dark") {
//       //           //const DarkMode(theme: "");
//       //           DynamicTheme.of(context)?.theme = "light";
//       //         } else {
//       //           DynamicTheme.of(context)?.theme = "dark";
//       //         }
//       //       },
//       //       icon:
//       //           Icon(theme == "light" ? Icons.light_mode : Icons.dark_mode)),
//       //   const SizedBox(
//       //     width: 25,
//       //   ),
//       //   PopupMenuButton(
//       //     constraints: const BoxConstraints(
//       //       //minWidth: 5.0 * 5.0,
//       //       maxWidth: 300,
//       //     ),
//       //     // add icon, by default "3 dot" icon
//       //
//       //     tooltip: 'Notification',
//       //
//       //     icon: const Icon(
//       //       Icons.notifications_active_outlined,
//       //       color: Colors.black,
//       //       size: 25,
//       //     ),
//       //     itemBuilder: (context) {
//       //       return [
//       //         const PopupMenuItem<int>(
//       //             value: 0,
//       //             child: SizedBox(
//       //               height: 400,
//       //               width: 300,
//       //               // child: tabview()
//       //             )),
//       //       ];
//       //     },
//       //   ),
//       //   const SizedBox(
//       //     width: 50,
//       //   ),
//       //   PopupMenuButton(
//       //       // add icon, by default "3 dot" icon
//       //
//       //       tooltip: 'User Details',
//       //       icon: const Icon(
//       //         Icons.account_circle_outlined,
//       //         color: Colors.black,
//       //       ),
//       //       itemBuilder: (context) {
//       //         return [
//       //           const PopupMenuItem<int>(
//       //             value: 0,
//       //             child: Text("welcome User"),
//       //           ),
//       //           const PopupMenuItem<int>(
//       //             value: 1,
//       //             child: ListTile(
//       //               leading: Icon(Icons.account_circle_outlined),
//       //               title: Text("Profile"),
//       //             ),
//       //           ),
//       //           const PopupMenuItem<int>(
//       //             value: 2,
//       //             child: ListTile(
//       //               leading: Icon(Icons.language),
//       //               title: Text("Help"),
//       //             ),
//       //           ),
//       //           const PopupMenuItem<int>(
//       //             value: 3,
//       //             child: ListTile(
//       //               leading: Icon(Icons.settings_outlined),
//       //               title: Text("Settings"),
//       //             ),
//       //           ),
//       //           const PopupMenuItem<int>(
//       //             value: 4,
//       //             child: ListTile(
//       //               leading: Icon(Icons.lock),
//       //               title: Text("Lock Screen"),
//       //             ),
//       //           ),
//       //           const PopupMenuItem<int>(
//       //             value: 5,
//       //             child: ListTile(
//       //               leading: Icon(Icons.logout_outlined),
//       //               title: Text("Logout"),
//       //             ),
//       //           ),
//       //         ];
//       //       },
//       //       onSelected: (value) {
//       //         if (value == 0) {
//       //           //print("My account menu is selected.");
//       //         } else if (value == 1) {
//       //           //print("Profile menu is selected.");
//       //         } else if (value == 2) {
//       //           //print("Setting menu is selected.");
//       //         } else if (value == 3) {
//       //           //print("help menu is selected.");
//       //         } else if (value == 4) {
//       //           //print("lock screen menu is selected.");
//       //         } else if (value == 5) {
//       //           //print("Logout menu is selected.");
//       //         }
//       //
//       //       }),
//       //   const SizedBox(
//       //     width: 50,
//       //   ),
//       // ],
//     ),
//     body: Container(
//       color: kWhiteColor,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Container(
//             constraints: const BoxConstraints(
//               maxWidth: kMaxWidth,
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5),
//                   child: Row(
//                     children: [
//                       if (!ResponsiveLayout.isComputer(context))
//                         IconButton(
//                             onPressed: () {
//                               Scaffold.of(context).openDrawer();
//                             },
//                             color: Colors.grey,
//                             icon: const Icon(Icons.menu)),
//
//                       if (ResponsiveLayout.isComputer(context)) const WebMenu(),
//
//                       const Spacer(),
//
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.search,
//                           color: kDarkgreyColor,
//                           size: 25,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Navigator.of(context).push(
//                           //     MaterialPageRoute(builder: (context) => Cartt()));
//                         },
//                         icon: const Icon(
//                           Icons.shopping_cart_outlined,
//                           color: kDarkgreyColor,
//                           size: 25,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Navigator.of(context).push(MaterialPageRoute(
//                           //     builder: (context) => LoginPage(
//                           //       title: "",
//                           //       theme: '',
//                           //     )));
//                         },
//                         icon: const Icon(
//                           Icons.person_outline,
//                           color: kDarkgreyColor,
//                           size: 25,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Divider(
//             thickness: 2,
//           ),
//         ],
//       ),
//     ),
//   );
// }
}



