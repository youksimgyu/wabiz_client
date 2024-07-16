import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/service/home/home_api.dart';

import '../../shared/network_provider.dart';

part 'home_service.g.dart';

@riverpod
HomeApi homeService(HomeServiceRef ref) {
  final dio = ref.watch(dioProvider);
  var localhost = "localhost";
  if (defaultTargetPlatform == TargetPlatform.android) {
    localhost = "10.0.2.2";
  }
  return HomeApi(dio, baseUrl: "http://$localhost:3000/api/v1");
}
