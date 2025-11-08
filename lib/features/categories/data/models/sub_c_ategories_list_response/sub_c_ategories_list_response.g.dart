// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_c_ategories_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubCAtegoriesListResponse _$SubCAtegoriesListResponseFromJson(
        Map<String, dynamic> json) =>
    SubCAtegoriesListResponse(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SubCategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCAtegoriesListResponseToJson(
        SubCAtegoriesListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
    };
