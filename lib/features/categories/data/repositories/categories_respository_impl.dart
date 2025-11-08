import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:ecommerce_app/features/categories/data/models/categories_list_response_model/categories_list_response_model.dart';
import 'package:ecommerce_app/features/categories/data/models/sub_c_ategories_list_response/sub_c_ategories_list_response.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:ecommerce_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource _categoriesRemoteDatasource;

  CategoriesRepositoryImpl(
      {required CategoriesRemoteDatasource categoriesRemoteDatasource})
      : _categoriesRemoteDatasource = categoriesRemoteDatasource;
  @override
  Future<Response<List<CategoryEntity>>> getCAtegories() async {
    try {
      CategoriesListResponseModel response =
          await _categoriesRemoteDatasource.getCAtegories();
      return Success(data: response.data ?? []);
    } catch (e) {
      Failure failure = Failure.handelError(e);
      return FailureResponse(failure: failure);
    }
  }

  @override
  Future<Response<List<SubcategoryEntity>>> getSubCategories(String id) async {
    try {
      SubCAtegoriesListResponse response =
          await _categoriesRemoteDatasource.getSubCategories(id);
      return Success(data: response.data ?? []);
    } catch (e) {
      Failure failure = Failure.handelError(e);
      return FailureResponse(failure: failure);
    }
  }
}
