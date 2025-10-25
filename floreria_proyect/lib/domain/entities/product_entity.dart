class ProductEntity {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final String category;
  final double rating;
  final int reviews;
  final int stock;
  final bool isAvailable;
  final bool isFavorite;
  final List<String>? colors;
  final List<String>? sizes;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    this.rating = 4.5,
    this.reviews = 0,
    this.stock = 10,
    this.isAvailable = true,
    this.isFavorite = false,
    this.colors,
    this.sizes,
  });

  ProductEntity copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    double? rating,
    int? reviews,
    int? stock,
    bool? isAvailable,
    bool? isFavorite,
    List<String>? colors,
    List<String>? sizes,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
      stock: stock ?? this.stock,
      isAvailable: isAvailable ?? this.isAvailable,
      isFavorite: isFavorite ?? this.isFavorite,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
    );
  }
}
