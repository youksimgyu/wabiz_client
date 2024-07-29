import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/service/project/project_api.dart';
import 'package:wabiz_client/shared/network_provider.dart';

part 'project_api_service.g.dart';

@riverpod
ProjectApi projectApiService(ProjectApiServiceRef ref) {
  final dio = ref.watch(dioProvider);

  return ProjectApi(
    dio,
    baseUrl: dio.options.baseUrl,
  );
}
