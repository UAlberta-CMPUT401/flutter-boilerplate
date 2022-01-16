import 'clothing_model.dart';
class Outfit {
  String imageUrl;

  String name;

  final List<Clothing> clothes;
  final String category; //Ex. Jeans, Shirt, Pants, etc
  final List<String> tags; //Ex. Winter, weekend, Formal, etc

  Outfit({

    this.imageUrl,
    this.name,
    this.clothes,
    this.category,
    this.tags,
  });
}



List<Outfit> outfits = [
  Outfit(
    imageUrl: 'assets/images/venice.jpg',
    name: 'Venice outfit.',
    category: 'winter',
  ),
  Outfit(
    imageUrl: 'assets/images/paris.jpg',
    name: 'Paris outfit.',
  ),
  Outfit(
    imageUrl: 'assets/images/newdelhi.jpg',
    name: 'Delhi outfit.',
  ),
  Outfit(
    imageUrl: 'assets/images/saopaulo.jpg',
    name: 'Sao Paulo outfit.',
  ),
  Outfit(
    imageUrl: 'assets/images/newyork.jpg',
    name: 'New York outfit.',
  ),
];
