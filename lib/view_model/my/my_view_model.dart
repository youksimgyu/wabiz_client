import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/login/login_model.dart';
import 'package:wabiz_client/repository/my/my_repository.dart';
import 'package:wabiz_client/view_model/login/login_view_model.dart';

part 'my_view_model.freezed.dart';
part 'my_view_model.g.dart';

@freezed
class MyPageState with _$MyPageState {
  const factory MyPageState({
    bool? loginState,
    LoginModel? loginModel,
  }) = _MyPageState;
}

@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() {
    final status = ref.watch(loginViewModelProvider);
    return MyPageState(
      loginState: status.isLogin,
      loginModel: LoginModel(
        id: status.userid,
        email: status.email,
        password: status.password,
        username: status.username,
      ),
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
