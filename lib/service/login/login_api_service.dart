import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/shared/network_provider.dart';

import 'login_api.dart';

part 'login_api_service.g.dart';

@Riverpod(keepAlive: true)
LoginApi loginApi(LoginApiRef ref) {
  final dio = ref.watch(dioProvider);

  return LoginApi(
    dio,
    baseUrl: dio.options.baseUrl,
  );
}
