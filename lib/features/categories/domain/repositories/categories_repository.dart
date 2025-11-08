import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';

abstract class CategoriesRepository {
  Future<Response<List<CategoryEntity>>> getCAtegories();
  Future<Response<List<SubcategoryEntity>>> getSubCategories(String id);
}
