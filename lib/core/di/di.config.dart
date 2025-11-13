// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/api/auth_apis.dart' as _i231;
import '../../features/auth/data/data_source/auth_local_data_source.dart'
    as _i280;
import '../../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i182;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/check_is_logged_usecase.dart'
    as _i241;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/signup_usecase.dart' as _i472;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/cart/data/api/cart_api.dart' as _i209;
import '../../features/cart/data/datasources/cart_remote_datasource.dart'
    as _i15;
import '../../features/cart/data/repositories/cart_repository_impl.dart'
    as _i642;
import '../../features/cart/domain/repositories/cart_repository.dart' as _i322;
import '../../features/cart/domain/usecases/get_products_by_subcategory_usecase.dart'
    as _i600;
import '../../features/cart/presentation/cubit/product_cubit/product_cubit.dart'
    as _i903;
import '../../features/categories/data/api/categories_api.dart' as _i146;
import '../../features/categories/data/datasources/categories_remote_datasource.dart'
    as _i16;
import '../../features/categories/data/repositories/categories_respository_impl.dart'
    as _i225;
import '../../features/categories/domain/repositories/categories_repository.dart'
    as _i488;
import '../../features/categories/domain/usecases/get_categories_usecase.dart'
    as _i76;
import '../../features/categories/domain/usecases/get_sub_categories_usecase.dart'
    as _i963;
import '../../features/categories/presentation/cubit/categories_cubit.dart'
    as _i802;
import 'modules/network.module.dart' as _i287;
import 'modules/secure_cash.module.dart' as _i283;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final secureCashModule = _$SecureCashModule();
    gh.singleton<_i361.Dio>(() => networkModule.getDio());
    gh.singleton<_i558.FlutterSecureStorage>(
        () => secureCashModule.getSecureStorage());
    gh.factory<_i280.AuthLocalDataSource>(() => _i280.AuthLocalDataSourceImpl(
        flutterSecureStorage: gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i231.AuthApis>(() => _i231.AuthApis(gh<_i361.Dio>()));
    gh.factory<_i209.CartApi>(() => _i209.CartApi(gh<_i361.Dio>()));
    gh.factory<_i146.CategoriesApi>(() => _i146.CategoriesApi(gh<_i361.Dio>()));
    gh.factory<_i182.AuthRemoteDataSource>(
        () => _i182.AuthRemoteDataSourceImpl(authApis: gh<_i231.AuthApis>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i280.AuthLocalDataSource>(),
          authDataSource: gh<_i182.AuthRemoteDataSource>(),
        ));
    gh.factory<_i15.CartRemoteDatasource>(
        () => _i15.CartRemoteDatasourceImpl(cartApi: gh<_i209.CartApi>()));
    gh.factoryParam<_i903.ProductCubit, String, dynamic>((
      subcategoryId,
      _,
    ) =>
        _i903.ProductCubit(
          gh<_i600.GetProductsBySubcategoryUsecase>(),
          subcategoryId,
        ));
    gh.factory<_i241.CheckIsLoggedUsecase>(() =>
        _i241.CheckIsLoggedUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.factory<_i911.LoginUsecase>(
        () => _i911.LoginUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.factory<_i472.SignupUsecase>(
        () => _i472.SignupUsecase(authRepository: gh<_i961.AuthRepository>()));
    gh.factory<_i16.CategoriesRemoteDatasource>(() =>
        _i16.CategoriesRemoteDatasourceImpl(api: gh<_i146.CategoriesApi>()));
    gh.factory<_i322.CartRepository>(() => _i642.CartRepositoryImpl(
        cartRemoteDatasource: gh<_i15.CartRemoteDatasource>()));
    gh.factory<_i488.CategoriesRepository>(() => _i225.CategoriesRepositoryImpl(
        categoriesRemoteDatasource: gh<_i16.CategoriesRemoteDatasource>()));
    gh.lazySingleton<_i117.AuthCubit>(() => _i117.AuthCubit(
          gh<_i911.LoginUsecase>(),
          gh<_i472.SignupUsecase>(),
          gh<_i241.CheckIsLoggedUsecase>(),
        ));
    gh.factory<_i963.GetSubCategoriesUsecase>(() =>
        _i963.GetSubCategoriesUsecase(
            categoryResponse: gh<_i488.CategoriesRepository>()));
    gh.factory<_i76.GetCategoriesUsecase>(() => _i76.GetCategoriesUsecase(
        categoriesRepository: gh<_i488.CategoriesRepository>()));
    gh.lazySingleton<_i802.CategoriesCubit>(() => _i802.CategoriesCubit(
          gh<_i76.GetCategoriesUsecase>(),
          gh<_i963.GetSubCategoriesUsecase>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i287.NetworkModule {}

class _$SecureCashModule extends _i283.SecureCashModule {}
