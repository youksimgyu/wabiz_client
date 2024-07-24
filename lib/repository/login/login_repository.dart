import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/login/login_model.dart';
import 'package:wabiz_client/service/login/login_api_service.dart';
import 'package:wabiz_client/shared/model/response_model.dart';

import '../../service/login/login_api.dart';

part 'login_repository.g.dart';

class LoginRepository {
  LoginApi loginApi;

  LoginRepository(this.loginApi);

  Future<ResponseModel> signUp(LoginModel body) async {
    final result = await loginApi.signUp(body);
    return result;
  }

  Future<ResponseModel> checkEmail(LoginModel body) async {
    final result = await loginApi.checkEmail(body);
    return result;
  }
}

@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final loginApi = ref.watch(loginApiProvider);
  return LoginRepository(loginApi);
}
