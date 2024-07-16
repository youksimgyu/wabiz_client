import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/home/home_model.dart';
import 'package:wabiz_client/repository/home/home_repository.dart';
import 'package:wabiz_client/shared/model/category.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<HomeItemModel> projects,
  }) = _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late HomeRepository homeRepository;

  @override
  HomeState? build() {
    homeRepository = ref.watch(homeRepositoryProvider);
    return null;
  }

  void update(List<HomeItemModel> projects) {
    state = state?.copyWith(projects: [...projects]);
  }

  Future<HomeModel> fetchHomeData() async {
    final result = await homeRepository.getHomeProjects();
    update(result.projects);
    return result;
  }
}

@riverpod
Future<List<ProjectCategory>> fetchHomeCategories(
    FetchHomeCategoriesRef ref) async {
  await Future.delayed(const Duration(seconds: 1));
  List<ProjectCategory> categories = [
    const ProjectCategory(
      id: 1,
      category: "Mobile App",
      title: "펀딩+",
      iconPath: "assets/icons/categories/1.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 2,
      category: "Web App",
      title: "혜택",
      iconPath: "assets/icons/categories/2.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 3,
      category: "Mobile App",
      title: "스토어",
      iconPath: "assets/icons/categories/3.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 4,
      category: "Web App",
      title: "뷰티워크",
      iconPath: "assets/icons/categories/4.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 5,
      category: "Mobile App",
      title: "새학기",
      iconPath: "assets/icons/categories/5.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 6,
      category: "Web App",
      title: "오픈예정",
      iconPath: "assets/icons/categories/6.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 7,
      category: "Mobile App",
      title: "펀딩+",
      iconPath: "assets/icons/categories/7.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 8,
      category: "Web App",
      title: "오픈예정",
      iconPath: "assets/icons/categories/8.png",
      created: "2021-09-01",
    ),
    const ProjectCategory(
      id: 9,
      category: "Mobile App",
      title: "펀딩+",
      iconPath: "assets/icons/categories/9.png",
      created: "2021-09-01",
    ),
  ];
  return categories;
}
