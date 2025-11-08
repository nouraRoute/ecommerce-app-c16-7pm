import 'package:json_annotation/json_annotation.dart';

import 'category_response.dart';

part 'categories_list_response_model.g.dart';

@JsonSerializable()
class CategoriesListResponseModel {
  int? results;
  List<CategoryResponse>? data;

  CategoriesListResponseModel({this.results, this.data});

  @override
  String toString() {
    return 'CategoriesListResponseModel(results: $results,  data: $data)';
  }

  factory CategoriesListResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CategoriesListResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoriesListResponseModelToJson(this);
}
