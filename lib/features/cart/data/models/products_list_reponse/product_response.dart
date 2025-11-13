import 'package:ecommerce_app/features/cart/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/categories/data/models/categories_list_response_model/category_response.dart';
import 'package:ecommerce_app/features/categories/data/models/sub_c_ategories_list_response/subcategory_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'brand.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends ProductEntity {
  final Brand? brand;
  final List<dynamic>? availableColors;
  @override
  final List<SubCategoryResponse>? subcategory;
  @override
  final CategoryResponse? category;
  const ProductResponse({
    super.sold,
    super.images,
    this.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    this.category,
    this.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.priceAfterDiscount,
    this.availableColors,
  }) : super(category: category, subcategory: subcategory);

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
