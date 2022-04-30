// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery_store/src/config/custom_colors.dart';
import 'package:my_grocery_store/src/pages/common_widgets/custom_shimmer.dart';
import 'package:my_grocery_store/src/pages/home/components/item_tile.dart';
import '../../config/app_data.dart' as appData;
import '../common_widgets/app_name_widget.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String selectedCategory = 'Frutas';

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        isLoading = false;
      }
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
              right: 16,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            // campo de pesquisa
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customSwatchColor,
                  size: 21,
                ),
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          ),
          //categorias
          Container(
            padding: EdgeInsets.only(
              left: 25,
            ),
            height: 40,
            child: !isLoading ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  onPressed: () {
                    setState(() {
                      selectedCategory = appData.categories[index];
                    });
                  },
                  category: appData.categories[index],
                  isSelected: appData.categories[index] == selectedCategory,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
              itemCount: appData.categories.length,
            ) :
            ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) => Container(
                margin: EdgeInsets.only(right: 12),
                alignment: Alignment.center,
                child: CustomShimmer(
                  height: 20,
                  width: 80,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              ),
            ),
          ),
          //grid
          Expanded(
            child: !isLoading
                ? GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: appData.items.length,
                    itemBuilder: (_, index) {
                      return ItemTile(
                        item: appData.items[index],
                      );
                    },
                  )
                : GridView.count(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.8,
                    children: List.generate(10, (index) => CustomShimmer(
                      height: double.infinity,
                      width: double.infinity,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
