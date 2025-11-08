// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesListResponseModel _$CategoriesListResponseModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesListResponseModel(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesListResponseModelToJson(
        CategoriesListResponseModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
    };
