import 'package:flutter/material.dart';
import 'package:news/models/categories.dart';
import 'package:news/modules/DrawerWidget.dart';
import 'package:news/modules/categoriesScreen.dart';
import 'package:news/modules/categoryItem.dart';
import 'package:news/modules/homeScreen.dart';

class categoriesScreen extends StatelessWidget {
  static const String routeName = 'Categories';
  Function callBackFunction;
  categoriesScreen(this.callBackFunction);
  @override
  Widget build(BuildContext context) {
    List<categories> allCategories = categories.getCategories();
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pick Your Category',
            style: Theme.of(context).textTheme.headline2?.copyWith(
              fontSize: 25,color: Colors.black ,fontWeight: FontWeight.bold
            ),
          ),
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        callBackFunction(allCategories[index]);
                      },
                      child: categoryItem(allCategories[index],index));
                },
                itemCount: allCategories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
