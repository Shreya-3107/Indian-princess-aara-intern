import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:indian_princess_web_app/screens/components/app_bar_widget.dart';
import 'package:indian_princess_web_app/screens/dashboard/about_us.dart';
import 'package:indian_princess_web_app/screens/dashboard/business_enquiry.dart';
import 'package:indian_princess_web_app/screens/dashboard/checkout.dart';
import 'package:indian_princess_web_app/screens/dashboard/contact_us.dart';
import 'package:indian_princess_web_app/screens/dashboard/refund_policy.dart';
import 'package:indian_princess_web_app/screens/dashboard/return_or_exchange.dart';
import 'package:indian_princess_web_app/screens/dashboard/shopping_cart.dart';
import 'package:indian_princess_web_app/screens/dashboard/store_locator.dart';
import 'package:indian_princess_web_app/screens/dashboard/terms_of_services.dart';
import 'package:indian_princess_web_app/screens/home_page.dart';

import 'package:indian_princess_web_app/screens/users/login.dart';
import 'package:indian_princess_web_app/screens/widgets/Product%20Widget/componenets/product_view.dart';
import '../../core/menu_list.dart';
import '../../custom_widgets/responsive.dart';
import '../components/bottom_bar.dart';
import '../components/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/Product Widget/banner.dart';
import '../widgets/category/category.dart';
import 'orders.dart';



class DashBoardScreen extends StatefulWidget {
  final bool isMenuSelected;
  final ValueChanged<bool> menuOnPressed;
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  final SelectedMenuItem selectedMenuItem;
  final String theme;
  const DashBoardScreen(
      {Key? key,
        required this.isMenuSelected,
        required this.menuOnPressed,
        required this.theme,
        required this.selectedMenuItem, required this.menuItemOnSelected})
      : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  SelectedMenuItem selectedMenuItem = SelectedMenuItem.login;
  late SelectedMenuItem selectedMenuItemLocal;
  bool isMenuClicked = false;
  bool isFullScreen = false;
  String? theme;
  String isItLogin = "1";
  bool _isAppBarVisible = true;
  bool _isBottomBarVisible = true;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      final isScrollingDown = _scrollController.position.userScrollDirection == ScrollDirection.forward;
      final isScrollingUp = _scrollController.position.userScrollDirection == ScrollDirection.reverse;


      if (isScrollingDown) {
        setState(() {
          _isAppBarVisible = true;
        });
      } else if (isScrollingUp) {
        setState(() {
          _isAppBarVisible = false;
        });

        if (_scrollController.position.pixels <=
            _scrollController.position.maxScrollExtent) {

          setState(() {
            _isAppBarVisible = true;
          });
        }
        else {
          setState(() {
            _isAppBarVisible = false;
          });}
      }
      if (_scrollController.position.pixels >=
          _scrollController.position.minScrollExtent  ) {
        setState(() {
          _isBottomBarVisible = true;
        });
      } else {
        setState(() {
          _isBottomBarVisible = false;
        });}
    });

    isMenuClicked = widget.isMenuSelected;
    theme = widget.theme;
    selectedMenuItemLocal = widget.selectedMenuItem;
  }

  @override
  void didUpdateWidget(covariant DashBoardScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    theme = widget.theme;
    selectedMenuItemLocal = widget.selectedMenuItem;
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _isAppBarVisible
                ? PreferredSize(
              preferredSize: const Size(double.infinity, 200),
              child: AppBarWidget(
                theme: "",
                menuItemOnSelected: (changedMenuItem) {
                  if (changedMenuItem == SelectedMenuItem.login) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.login);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.order) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.order);
                    });
                  }else if (changedMenuItem == SelectedMenuItem.storeLocator) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.storeLocator);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.productView) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.productView);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.returnOrExchange) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.returnOrExchange);
                    });
                  }else if (changedMenuItem == SelectedMenuItem.contactUs) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.contactUs);
                    });
                  }else if (changedMenuItem == SelectedMenuItem.home) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.home);
                    });
                  }else if (changedMenuItem == SelectedMenuItem.businessEnquiry) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.businessEnquiry);
                    });
                  }else if (changedMenuItem == SelectedMenuItem.refundPolicy) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.refundPolicy);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.aboutUs) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.aboutUs);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.home) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.home);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.shoppingCart) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.shoppingCart);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.checkOut) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.checkOut);
                    });
                  }
                  else if (changedMenuItem == SelectedMenuItem.termAndServices) {
                    setState(() {
                      widget.menuItemOnSelected(SelectedMenuItem.termAndServices);
                    });
                  }

                },

              ),
            )
                : const SizedBox.shrink(),
            // Your body content goes here
            getBodyWidget(),
            _isBottomBarVisible ? BottomBody() : const SizedBox.shrink(),
          ],
        ),
    );
  }


  getBodyWidget() {
    if (selectedMenuItemLocal == SelectedMenuItem.dashboard) {
      return ProductBanner(menuItemOnSelected: (SelectedMenuItem value) {
        if(value == SelectedMenuItem.dashboard) {
          widget.menuItemOnSelected(SelectedMenuItem.dashboard);
        }
        else if(value == SelectedMenuItem.productView){
          widget.menuItemOnSelected(SelectedMenuItem.productView);
        }
      },);

    }
    else if (selectedMenuItemLocal == SelectedMenuItem.home) {
      return ProductBanner(menuItemOnSelected: (SelectedMenuItem value) {
        if(value == SelectedMenuItem.dashboard) {
          widget.menuItemOnSelected(SelectedMenuItem.dashboard);
        }
        else if(value == SelectedMenuItem.productView){
          widget.menuItemOnSelected(SelectedMenuItem.productView);
        }
      },);
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.storeLocator) {
      return const StoreLocator();
    }else if (selectedMenuItemLocal == SelectedMenuItem.returnOrExchange) {
      return const ReturnOrExchange();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.order) {
      return const MyOrdersWidget();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.aboutUs) {
      return AboutUs();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.termAndServices) {
      return const TermsOfServices();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.refundPolicy) {
      return const RefundPolicy();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.productView) {
      return const ProductView(index: 1);
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.contactUs) {
      return ContactUs();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.businessEnquiry) {
      return const BusinessForm();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.login) {
      return const LoginWidget();
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.checkOut) {
      return CheckoutWidget(menuItemOnSelected: (SelectedMenuItem value) {
        widget.menuItemOnSelected(SelectedMenuItem.shoppingCart);
      },);
    }
    else if (selectedMenuItemLocal == SelectedMenuItem.shoppingCart) {
      return Cartt(menuItemOnSelected: (SelectedMenuItem value) { 
        widget.menuItemOnSelected(SelectedMenuItem.checkOut);
        },) ;
    }
    return const Center(
      child: Text("pages"),
    );
  }
}
