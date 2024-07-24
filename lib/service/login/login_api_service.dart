import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/service/login/login_api.dart';
import 'package:wabiz_client/shared/network_provider.dart';

part 'login_api_service.g.dart';

@riverpod
LoginApi loginApi(LoginApiRef ref) {
  final dio = ref.watch(dioProvider);
  var localhost = 'localhost';

  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = '10.0.2.2';
  }

  return LoginApi(dio, baseUrl: 'https://$localhost:3000/api/v1');
}
