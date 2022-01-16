import 'dart:typed_data';
//import 'package:hive/hive.dart';

class Clothing {
  final Uint8List imagePath;
  final String category; //Ex. Jeans, Shirt, Pants, etc
  final List<String> tags; //Ex. Winter, weekend, Formal, etc

  Clothing(this.imagePath, this.category, this.tags);
}
