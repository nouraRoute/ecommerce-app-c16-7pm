import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product_response.dart';

part 'products_list_response.g.dart';

@JsonSerializable()
class ProductsListResponse extends Equatable {
  final int? results;
  final List<ProductResponse>? data;

  const ProductsListResponse({this.results, this.data});

  factory ProductsListResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductsListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductsListResponseToJson(this);

  @override
  List<Object?> get props => [results, data];
}
