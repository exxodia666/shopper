import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  const Product(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.rating,
      required this.description,
      this.isFavorite = false,
      this.inCart = false});

  final String id;
  final String title;
  final String image;
  final double price;
  final String description;
  final double rating;
  final bool isFavorite;
  final bool inCart;

  // factory Product.parseFirebaseDoc(Map<String, dynamic> fbDoc) => Product(
  //     id: fbDoc['id'],
  //     title: fbDoc['title'],
  //     description: fbDoc['description'],
  //     rating: fbDoc['rating'].toDouble(),
  //     image: fbDoc['image'],
  //     price: fbDoc['price'].toDouble());

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({
    required String id,
    String? title,
    String? image,
    double? price,
    String? description,
    double? rating,
    bool? isFavorite,
    bool? inCart,
  }) {
    return Product(
      id: id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      description: description ?? this.description,
      rating: rating ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
      inCart: inCart ?? this.inCart,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, image, price, description, rating, isFavorite, inCart];
}
