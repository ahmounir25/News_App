import 'package:flutter/material.dart';
import 'package:news/layout/home_layout.dart';
import 'package:news/models/categories.dart';
import 'package:news/modules/DrawerWidget.dart';

class drawerWidget extends StatelessWidget {
  Function callBackFun;

  drawerWidget(this.callBackFun);

  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ))),
      width: MediaQuery.of(context).size.width * .7,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Row(
      children: [
      Icon(Icons.menu),
      InkWell(
        onTap: () {
          callBackFun();
        },
        child: Text('Categories', style: TextStyle(color: Colors.black),))
        ],

    ),
    SizedBox(height: 20,),
    Row(
    children: [
    Icon(Icons.settings),
    Text('Settings',style: TextStyle(color: Colors.black),)
    ],
    )
    ,
    ]
    ,
    )
    ,
    );
  }
}
