import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/home/home_model.dart';
import 'package:wabiz_client/service/home/home_api.dart';
import 'package:wabiz_client/service/home/home_service.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeApi homeApi;

  HomeRepository(this.homeApi);

  Future<HomeModel> getHomeProjects() async {
    final result = await homeApi.getHomeProjects();
    return result;
  }
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  final homeApi = ref.watch(homeServiceProvider);
  return HomeRepository(homeApi);
}
