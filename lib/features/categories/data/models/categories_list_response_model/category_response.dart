import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends CategoryEntity {
  @override
  @JsonKey(name: '_id')
  String? id;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryResponse({
    this.id,
    super.name,
    this.slug,
    super.image,
    this.createdAt,
    this.updatedAt,
  }) : super(id: id);

  @override
  String toString() {
    return 'CategoryResponse(id: $id, name: $name, slug: $slug, image: $image, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}
