class Wine {
  final String name;
  final String description;
  final double price;
  final bool isAvailable;
  final String imageUrl;
  final String type;
  final String style;
  final String country;
  bool isFavorite;

  Wine({
    required this.name,
    required this.description,
    required this.price,
    required this.isAvailable,
    required this.imageUrl,
    required this.type,
    required this.style,
    required this.country,
    this.isFavorite = false,
  });

  // Constructor to initialize Wine object from JSON
  factory Wine.fromJson(Map<String, dynamic> json) {
    return Wine(
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      isAvailable: json['isAvailable'],
      imageUrl: json['imageUrl'],
      type: json['type'],
      style: json['style'],
      country: json['country'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
