class CategoryIcon {
  String imageUrl;
  String name;


  CategoryIcon({
    this.imageUrl,
    this.name,
  });
}

final List<CategoryIcon> categories = [
  CategoryIcon(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Dress',
  ),
  CategoryIcon(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hoodie',
  ),
  CategoryIcon(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Jean',
  ),
];
