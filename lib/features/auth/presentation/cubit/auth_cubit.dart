import 'package:ecommerce_app/core/network/error_handling.dart';
import 'package:ecommerce_app/core/network/network_response_model.dart';
import 'package:ecommerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/usecase/check_is_logged_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecase/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUsecase, this._signupUsecase, this._checkIsLoggedUsecase)
      : super(AuthInitial());
  final LoginUsecase _loginUsecase;
  final SignupUsecase _signupUsecase;
  final CheckIsLoggedUsecase _checkIsLoggedUsecase;

  login(String email, String password) async {
    Logger().i('Loading');

    emit(LoginLoadingState());
    Response<void> response =
        await _loginUsecase(email: email, password: password);
    switch (response) {
      case Success<void>():
        emit(LoginSuccessState());
      case FailureResponse<void>():
        emit(LoginFailureState(failure: response.failure));
    }
  }

  signup(UserEntity user) async {
    emit(SignupLoadingState());
    Response<void> response = await _signupUsecase(user: user);
    switch (response) {
      case Success<void>():
        emit(SignupSuccessState());
      case FailureResponse<void>():
        emit(SignupFailureState(failure: response.failure));
    }
  }

  checkIsLogged() async {
    await Future.delayed(Duration(seconds: 5));
    bool isLogged = await _checkIsLoggedUsecase();
    emit(CheckIsLoggedState(isLogged: isLogged));
  }
}
