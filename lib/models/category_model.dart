import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Category {
  String categoryName;
  IconData icon;

  Category({
    this.categoryName,
    this.icon,
  });
}


List<Category> categories = [
  Category(
    categoryName: 'Top',
    icon: FontAwesomeIcons.tshirt,
  ),
  Category(
    categoryName: 'Bottom',
    icon: FontAwesomeIcons.binoculars,
  ),
  Category(
    categoryName: 'Outerwear',
    icon: FontAwesomeIcons.snowflake,
  ),
  Category(
    categoryName: 'Accessory',
    icon: FontAwesomeIcons.shoppingBag,
  ),
  Category(
    categoryName: 'Footwear',
    icon: FontAwesomeIcons.shoePrints,
  ),
];

