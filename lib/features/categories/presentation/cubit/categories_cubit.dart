import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/categories/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/categories/domain/entities/subcategory_entity.dart';
import 'package:ecommerce_app/features/categories/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_app/features/categories/domain/usecases/get_sub_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@lazySingleton
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesUsecase, this._getSubCategoriesUsecase)
      : super(CategoriesInitial());
  final GetCategoriesUsecase _categoriesUsecase;
  final GetSubCategoriesUsecase _getSubCategoriesUsecase;
  List<CategoryEntity> categories = [];
  CategoryEntity? selectedCategory;
  getCAtegories() async {
    emit(GetCategoriesLoadingState());

    Response<List<CategoryEntity>> response = await _categoriesUsecase();
    switch (response) {
      case Success<List<CategoryEntity>>():
        categories = response.data;
        selectedCategory = categories.first;
        emit(const GetCategoriesSuccessState());
        if (selectedCategory?.id != null) {
          getSubcategories();
        } else {
          print('--->${selectedCategory?.id}');
          print('--->${selectedCategory?.name}');
          print('--->${categories.length}');
        }
      case FailureResponse<List<CategoryEntity>>():
        emit(GetCategoriesFailureState(failure: response.failure));
    }
  }

  getSubcategories() async {
    if (selectedCategory == null) return;
    emit(GetSubcategoriesLoadingState());

    Response<List<SubcategoryEntity>> response =
        await _getSubCategoriesUsecase(selectedCategory!.id!);
    switch (response) {
      case Success<List<SubcategoryEntity>>():
        emit(GetSubcategoriesSuccessState(subcategories: response.data));
      case FailureResponse<List<SubcategoryEntity>>():
        emit(GetSubcategoriesFailureState(failure: response.failure));
    }
  }

  onItemClick(CategoryEntity categoryEntity) {
    selectedCategory = categoryEntity;
    getSubcategories();
  }
}
