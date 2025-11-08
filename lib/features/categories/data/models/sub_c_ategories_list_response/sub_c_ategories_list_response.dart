import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'subcategory_response.dart';

part 'sub_c_ategories_list_response.g.dart';

@JsonSerializable()
class SubCAtegoriesListResponse extends Equatable {
  final int? results;
  final List<SubCategoryResponse>? data;

  const SubCAtegoriesListResponse({this.results, this.data});

  factory SubCAtegoriesListResponse.fromJson(Map<String, dynamic> json) {
    return _$SubCAtegoriesListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubCAtegoriesListResponseToJson(this);

  @override
  List<Object?> get props => [results, data];
}
