class ProductModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final double rating;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.rating = 5.0,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      image: json['image'],
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : 5.0,
      category: json['category'] ?? 'men',
    );
  }
}
