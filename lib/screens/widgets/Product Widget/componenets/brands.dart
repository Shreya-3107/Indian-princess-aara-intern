import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/menu_list.dart';
import '../../../../json_model_sample/brands_list.dart';
import '../../../../utils/validation.dart';

class BrandWidget extends StatelessWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  const BrandWidget({super.key,required this.menuItemOnSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        //shrink wrap to avoid error
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        crossAxisCount: size > 1000 ? 3 : (size > 700 ? 2 : 1),
        itemCount: brandsList.length,
        itemBuilder: (BuildContext context, int index) =>
            BrandItems(index: index, menuItemOnSelected: (SelectedMenuItem value) {
              menuItemOnSelected(SelectedMenuItem.productView);
            },),
        staggeredTileBuilder: (int index) {
          return StaggeredTile.fit(1);
        },
        mainAxisSpacing: 30,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}

class BrandItems extends StatelessWidget {
  final ValueChanged<SelectedMenuItem> menuItemOnSelected;
  final int index;
  const BrandItems({super.key, required this.index,required this.menuItemOnSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          brandsList[index]["image"],
          height: 350,
          width: 350,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        // buildTextButton()
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey
            ),
            onPressed: () {
              menuItemOnSelected(SelectedMenuItem.productView);
            },
            child: Text("SHOP NOW"),

        )
      ],
    );
  }
}
