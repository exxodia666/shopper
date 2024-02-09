// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      description: json['description'] as String,
      isFavorite: json['isFavorite'] as bool? ?? false,
      inCart: json['inCart'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
      'rating': instance.rating,
      'isFavorite': instance.isFavorite,
      'inCart': instance.inCart,
    };
