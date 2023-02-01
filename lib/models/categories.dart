//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class categories {
  String id;
  String image;
  String title;
  Color color;

  categories(this.id, this.image, this.title, this.color);

  static List<categories> getCategories() {
    return [
      //business entertainment general health science sports technology
      categories('sports', 'assets/images/ball.png', 'Sports', Color(0xffC91C22)),
      categories(
          'general', 'assets/images/po.png', 'Politics', Color(0xff003E90)),
      categories(
          'business', 'assets/images/bu.png', 'Business', Color(0xffCF7E48)),
      categories('health', 'assets/images/he.png', 'Health', Color(0xffED1E79)),
      categories('entertainment', 'assets/images/ball.png', 'Entertainment',
          Color(0xff4882CF)),
      categories(
          'science', 'assets/images/sc.png', 'Science', Color(0xffF2D352)),

    ];
  }
}