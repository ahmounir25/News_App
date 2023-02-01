import 'package:flutter/material.dart';
import 'package:news/models/categories.dart';

class categoryItem extends StatelessWidget {
 categories category;
 int index;
 categoryItem(this.category,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.only(
            topRight:Radius.circular(15) ,
            topLeft:Radius.circular(15) ,
            bottomRight:index%2==0 ?Radius.circular(15) :Radius.circular(0) ,
            bottomLeft: index%2==0 ?Radius.circular(0) :Radius.circular(15)
          ),
          color: category.color,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: [
          Image(image: AssetImage(category.image),height: 120),
          Text(category.title,style: TextStyle(
            color: Colors.white,fontWeight: FontWeight.bold
          ),),
        ],
      ),
    );
  }
}
