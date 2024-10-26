class Product {
  final String id;
  final String title;
  final String? desc;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    this.desc,
    required this.price,
    required this.image,
  });
}
