import 'package:hive/hive.dart';

part 'product.g.dart'; // Add this line

@HiveType(typeId: 0) // Add this annotation
class Product {
  @HiveField(0) // Add this annotation
  final String id;
  @HiveField(1) // Add this annotation
  final String title;
  @HiveField(2) // Add this annotation
  final String desc;
  @HiveField(3) // Add this annotation
  final String image;
  @HiveField(4) // Add this annotation
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });
}
