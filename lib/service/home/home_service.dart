import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/service/home/home_api.dart';

import '../../shared/network_provider.dart';

part 'home_service.g.dart';

@riverpod
HomeApi homeService(HomeServiceRef ref) {
  final dio = ref.watch(dioProvider);

  return HomeApi(
    dio,
    baseUrl: dio.options.baseUrl,
  );
}
