import 'package:flutter/material.dart';

import '../core/menu_list.dart';
import 'dashboard/dashboard_screen.dart';

class HomePage extends StatefulWidget {
  final String theme;
  const HomePage({Key? key, required this.theme}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuSelected = true;
  SelectedMenuItem selectedMenuItem = SelectedMenuItem.dashboard;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: DashBoardScreen(
                menuItemOnSelected: (changedMenuItem) {
                  setState(() {
                    selectedMenuItem = changedMenuItem;
                  });
                },
                selectedMenuItem: selectedMenuItem,
                theme: widget.theme,
                isMenuSelected: isMenuSelected,
                menuOnPressed: (isMenuPressed) {
                  setState(() {
                    isMenuSelected = isMenuPressed;
                  });
                }),
          ),
        ],
    );
  }
}
