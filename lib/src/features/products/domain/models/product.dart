class Product {
  final String id;
  final String title;
  final double price;
  final String? description;
  final String? image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['thumbnail'],
    );
  }
}
