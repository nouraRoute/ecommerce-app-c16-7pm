// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      sold: (json['sold'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
      id: json['id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      imageCover: json['imageCover'] as String?,
      category: json['category'] == null
          ? null
          : CategoryResponse.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
      availableColors: json['availableColors'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'sold': instance.sold,
      'images': instance.images,
      'ratingsQuantity': instance.ratingsQuantity,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imageCover': instance.imageCover,
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'brand': instance.brand,
      'availableColors': instance.availableColors,
      'subcategory': instance.subcategory,
      'category': instance.category,
    };
