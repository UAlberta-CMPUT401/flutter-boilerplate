import 'dart:typed_data';
import 'package:hive/hive.dart';


class clothing {
  final Uint8List imagePath;
  final String category; //Ex. Jeans, Shirt, Pants, etc
  final List<String> tags; //Ex. Winter, weekend, Formal, etc 

  clothing(this.imagePath, this.category, this.tags);
}

// todo(TurnipXenon): replace once actual database comes
List<clothing> clothings = [
  clothing(
      Uint8List(0),
      "Jeans",
      ["winter", "weekend", "formal"]
  ),
  clothing(
      Uint8List(0),
      "Shirt",
      ["summer", "weekend", "informal"]
  ),
  clothing(
      Uint8List(0),
      "Jeans",
      ["spring", "weekdays", "formal"]
  ),
  clothing(
      Uint8List(0),
      "PAnts",
      ["work", "formal"]
  ),
  clothing(
      Uint8List(0),
      "Pants",
      ["fall", "informal"]
  ),
  clothing(
      Uint8List(0),
      "Shoes",
      ["weekdays", "formal"]
  ),
];