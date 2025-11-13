// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsListResponse _$ProductsListResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsListResponse(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsListResponseToJson(
        ProductsListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
    };
