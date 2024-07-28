import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wabiz_client/models/project/project_model.dart';
import 'package:wabiz_client/models/project/reward_model.dart';
import 'package:wabiz_client/service/project/project_api.dart';
import 'package:wabiz_client/service/project/project_api_service.dart';
import 'package:wabiz_client/shared/model/response_model.dart';

part 'project_repository.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final projectApi = ref.watch(projectApiServiceProvider);
  return ProjectRepository(projectApi);
}

class ProjectRepository {
  final ProjectApi projectApi;

  ProjectRepository(this.projectApi);

  Future<ResponseModel> createProject(ProjectItemModel body) async {
    final result = await projectApi.createProject(body);
    return result;
  }

  Future<ResponseModel> updateProjectOpenState(
      String id, ProjectItemModel body) async {
    final result = await projectApi.updateProjectOpenState(id, body);
    return result;
  }

  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectApi.deleteProject(id);
    return result;
  }

  Future<ProjectModel> getProjectByUserId(String userId) async {
    final result = await projectApi.getProjectByUserId(userId);
    return result;
  }

  Future<ResponseModel> createProjectReward(
      String id, RewardItemModel body) async {
    final result = await projectApi.createProjectReward(id, body);
    return result;
  }
}
