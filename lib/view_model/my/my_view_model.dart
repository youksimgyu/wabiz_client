import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/repository/my/my_repository.dart';

part 'my_view_model.freezed.dart';
part 'my_view_model.g.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    bool? loginState,
  }) = _MyPageState;
}

@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() {
    return const MyPageState(
      loginState: false,
    );
  }

  void fetchUserProjects() async {}

  void updateProjectOpenState(String id) async {
    await ref.watch(myRepositoryProvider).updateProjectOpenState(id);
  }

  void deleteProject(String id) async {
    await ref.watch(myRepositoryProvider).deleteProject(id);
  }
}
