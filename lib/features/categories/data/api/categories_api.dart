import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/endpoints.dart';
import 'package:ecommerce_app/features/categories/data/models/categories_list_response_model/categories_list_response_model.dart';
import 'package:ecommerce_app/features/categories/data/models/sub_c_ategories_list_response/sub_c_ategories_list_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'categories_api.g.dart';

@injectable
@RestApi()
abstract class CategoriesApi {
  @factoryMethod
  factory CategoriesApi(Dio dio) = _CategoriesApi;

  @GET(Endpoints.categories)
  Future<CategoriesListResponseModel> getCategories();
  @GET('${Endpoints.categories}/{id}${Endpoints.subcategories}')
  Future<SubCAtegoriesListResponse> getSubcategories(@Path("id") String id);
}
