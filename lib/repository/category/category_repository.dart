import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/category/category_model.dart';
import 'package:wabiz_client/service/category/category_api.dart';
import 'package:wabiz_client/service/category/category_api_service.dart';

part 'category_repository.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final categoryApi = ref.watch(categoryApiServiceProvider);
  return CategoryRepository(categoryApi);
}

class CategoryRepository {
  CategoryApi categoryApi;
  CategoryRepository(this.categoryApi);

  Future<CategoryModel> getCategoryProjects(
    String categoryId,
    String projectTypeId,
  ) async {
    final result =
        await categoryApi.getProjectsByProjectType(categoryId, projectTypeId);
    return result;
  }

  Future<CategoryModel> getProjectsByCategoryId(String categoryId) async {
    final result = await categoryApi.getProjectsByCategoryId(categoryId);
    return result;
  }
}
