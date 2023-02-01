import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/models/categories.dart';
import 'package:news/modules/DrawerWidget.dart';
import 'package:news/modules/categoriesScreen.dart';
import 'package:news/modules/homeScreen.dart';
import 'package:news/shared/remote/api_manager.dart';
import 'package:news/styles/colors.dart';

class homeLayout extends StatefulWidget {
  static const routeName = 'layout';
  @override
  State<homeLayout> createState() => _homeLayoutState();
}

class _homeLayoutState extends State<homeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.fill),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              backgroundColor: greenColor,
              title: Text('News'),
              centerTitle: true),
          drawer:drawerWidget(drawerAction),
          body: selected == null ? categoriesScreen(selectedCategory):homeScreen(selected!)
      ),
    );
  }
  categories? selected = null;

  void selectedCategory( category){
    selected=category;
    setState(() {
    }
    );

    }
    void drawerAction(){
    selected=null;
    setState(() {
      Navigator.pop(context);
    });
    }
}

