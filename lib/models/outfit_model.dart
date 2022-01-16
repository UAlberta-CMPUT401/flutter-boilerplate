
class Outfit {
  String imageUrl;

  String name;


  Outfit({
    this.imageUrl,
    this.name,
  });
}


List<Outfit> outfits = [
  Outfit(
    imageUrl: 'assets/images/venice.jpg',
    name: 'Venice outfit.',
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
