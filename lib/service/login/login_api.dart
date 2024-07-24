import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wabiz_client/models/login/login_model.dart';
import 'package:wabiz_client/shared/model/response_model.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: 'https://localhost:3000/api/v1')
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/signup')
  Future<ResponseModel> signUp(
    @Body() LoginModel body,
  );
}
