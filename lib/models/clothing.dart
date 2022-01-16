import 'dart:typed_data';
import 'package:hive/hive.dart';
part 'clothing.g.dart';


@HiveType()
class clothing {
  @HiveField(0)
  final Uint8List imagePath;
  @HiveField(1)
  final String category; //Ex. Jeans, Shirt, Pants, etc
  @HiveField(2)
  final List<String> tags; //Ex. Winter, weekend, Formal, etc 

  clothing(this.imagePath, this.category, this.tags);
}
