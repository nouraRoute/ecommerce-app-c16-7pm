import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:ecommerce_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUsecase {
  final CategoriesRepository _categoriesRepository;

  GetSubCategoriesUsecase({required CategoriesRepository categoryResponse})
      : _categoriesRepository = categoryResponse;
  Future<Response<List<SubcategoryEntity>>> call(String id) async =>
      await _categoriesRepository.getSubCategories(id);
}
