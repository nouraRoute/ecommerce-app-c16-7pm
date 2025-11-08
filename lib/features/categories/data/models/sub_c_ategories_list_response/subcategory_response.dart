import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subcategory_response.g.dart';

@JsonSerializable()
class SubCategoryResponse extends SubcategoryEntity {
  @override
  @JsonKey(name: '_id')
  // ignore: overridden_fields
  final String? id;

  final String? slug;
  final String? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SubCategoryResponse({
    this.id,
    super.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  }) : super(id: id);

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);
}
