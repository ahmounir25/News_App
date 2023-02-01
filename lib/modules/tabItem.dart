import 'package:flutter/material.dart';
import 'package:news/styles/colors.dart';

class TabItem extends StatelessWidget {
  String name;
  bool isSelected;
  TabItem(this.name,this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 8,horizontal:12 ),
      decoration: BoxDecoration(
        border: Border.all(color: greenColor),
        color:isSelected?greenColor:Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(name,style:Theme.of(context).textTheme.headline2?.copyWith(
          color:isSelected? Colors.white:greenColor,
          fontSize: 14
        ) ,),
      ),
    );
  }
}
