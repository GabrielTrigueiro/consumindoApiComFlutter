// * modelo do produto

class ProdutoModel {
  final String title;
  final String description;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  // ! para criar o modelo todos os campos são obrigatórios
  ProdutoModel({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  // ! criar um produto através de um json
  factory ProdutoModel.fromMap(Map<String, dynamic> map) {
    return ProdutoModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] != null ? map['price'] * 1.0 : 0.0,
      rating: map['rating'] != null ? map['rating'] * 1.0 : 0.0,
      brand: map['brand'] ?? '',
      category: map['category'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      images: List<String>.from(map['images'] ?? []),
    );
  }
}
