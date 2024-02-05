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
      required this.description});

  final String id;
  final String title;
  final String image;
  final double price;
  final String description;
  final double rating;

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
    required String title,
    required String image,
    required double price,
    required String description,
    required double rating,
  }) {
    return Product(
      id: id,
      title: title,
      image: image,
      price: price,
      description: description,
      rating: rating,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        price,
        description,
        rating,
      ];
}
