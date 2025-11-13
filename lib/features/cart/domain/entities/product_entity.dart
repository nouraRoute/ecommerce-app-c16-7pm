import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? sold;
  final List<String>? images;
  final List<SubcategoryEntity>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryEntity? category;
  final double? ratingsAverage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? id;
  final int? priceAfterDiscount;

  const ProductEntity(
      {required this.sold,
      required this.images,
      required this.subcategory,
      required this.ratingsQuantity,
      required this.title,
      required this.slug,
      required this.description,
      required this.quantity,
      required this.price,
      required this.imageCover,
      required this.category,
      required this.ratingsAverage,
      required this.createdAt,
      required this.updatedAt,
      required this.id,
      required this.priceAfterDiscount});
  @override
  List<Object?> get props {
    return [
      sold,
      images,
      subcategory,
      ratingsQuantity,
      id,
      title,
      slug,
      description,
      quantity,
      price,
      imageCover,
      category,
      ratingsAverage,
      createdAt,
      updatedAt,
      id,
      priceAfterDiscount,
    ];
  }
}
