import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/login/login_model.dart';
import 'package:wabiz_client/repository/login/login_repository.dart';
import 'package:wabiz_client/shared/model/response_model.dart';

part 'login_view_model.freezed.dart';
part 'login_view_model.g.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(false) bool isLogin,
    int? userid,
    String? email,
    String? password,
    String? username,
  }) = _LoginState;

  factory LoginState.init() {
    return const LoginState(
      isLogin: false,
      userid: 0,
      email: '',
      password: '',
      username: '',
    );
  }
}

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState.init();
  }

  Future<bool> singUp(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).signUp(body);
    if (result.status == 'ok') {
      return true;
    } else if (result.status == '400') {
      return false;
    } else {
      return false;
    }
  }

  Future<ResponseModel?> signIn(String email, String password) async {
    final response = await ref.watch(loginRepositoryProvider).signIn(
          LoginModel(
            email: email,
            password: password,
          ),
        );

    if (response != null) {
      final data = LoginModel.fromJson(jsonDecode(response.body ?? ""));
      state = state.copyWith(
        isLogin: true,
        userid: data.id,
        email: data.email,
        username: data.username,
      );
    }
    return response;
  }

  Future<bool> checkEmail(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).checkEmail(body);

    if (result.status == "ok") {
      return true;
    }
    return false;
  }

  bool signOut() {
    state = state.copyWith(
      isLogin: false,
      email: "",
      username: "",
      password: "",
    );
    return true;
  }
}
