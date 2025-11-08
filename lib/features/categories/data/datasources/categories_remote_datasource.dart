import 'package:ecommerce_app/features/categories/data/api/categories_api.dart';
import 'package:ecommerce_app/features/categories/data/models/categories_list_response_model/categories_list_response_model.dart';
import 'package:ecommerce_app/features/categories/data/models/sub_c_ategories_list_response/sub_c_ategories_list_response.dart';
import 'package:injectable/injectable.dart';

abstract class CategoriesRemoteDatasource {
  Future<CategoriesListResponseModel> getCAtegories();
  Future<SubCAtegoriesListResponse> getSubCategories(String id);
}

@Injectable(as: CategoriesRemoteDatasource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final CategoriesApi _api;

  CategoriesRemoteDatasourceImpl({required CategoriesApi api}) : _api = api;
  @override
  Future<CategoriesListResponseModel> getCAtegories() async =>
      await _api.getCategories();

  @override
  Future<SubCAtegoriesListResponse> getSubCategories(String id) async =>
      await _api.getSubcategories(id);
}
