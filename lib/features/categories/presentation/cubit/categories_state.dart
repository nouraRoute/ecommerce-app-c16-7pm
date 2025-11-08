part of 'categories_cubit.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class GetCategoriesLoadingState extends CategoriesState {}

class GetCategoriesSuccessState extends CategoriesState {
  const GetCategoriesSuccessState();
  @override
  List<Object> get props => [];
}

class GetCategoriesFailureState extends CategoriesState {
  final Failure failure;

  const GetCategoriesFailureState({required this.failure});
  @override
  List<Object> get props => [failure];
}

class GetSubcategoriesLoadingState extends CategoriesState {}

class GetSubcategoriesSuccessState extends CategoriesState {
  final List<SubcategoryEntity> subcategories;

  const GetSubcategoriesSuccessState({required this.subcategories});
  @override
  List<Object> get props => [subcategories];
}

class GetSubcategoriesFailureState extends CategoriesState {
  final Failure failure;

  const GetSubcategoriesFailureState({required this.failure});
  @override
  List<Object> get props => [failure];
}
