import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  final CategoriesRepository _categoriesRepository;

  GetCategoriesUsecase({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository;

  Future<Response<List<CategoryEntity>>> call() async =>
      await _categoriesRepository.getCAtegories();
}
