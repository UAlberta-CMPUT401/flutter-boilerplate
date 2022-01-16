import 'package:flutter_travel_ui/models/clothing.dart';
import 'package:hive/hive.dart';


class outfit {
  final List<clothing> clothes;
  final String category; //Ex. Jeans, Shirt, Pants, etc
  final List<String> tags; //Ex. Winter, weekend, Formal, etc

  outfit(this.clothes, this.category, this.tags);
}