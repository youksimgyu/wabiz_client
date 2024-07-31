import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wabiz_client/models/project/project_model.dart';
import 'package:wabiz_client/models/project/reward_model.dart';
import 'package:wabiz_client/shared/model/response_model.dart';

part 'project_api.g.dart';

@RestApi(baseUrl: "https://localhost:3000/api/v1")
abstract class ProjectApi {
  factory ProjectApi(Dio dio, {String baseUrl}) = _ProjectApi;

  @GET("/project/{id}")
  Future<ProjectModel> getProjectByProjectId(
    @Path() String id,
  );

  @POST("/project")
  Future<ResponseModel> createProject(
    @Body() ProjectItemModel body,
  );

  @PUT("/project/{id}")
  Future<ResponseModel> updateProjectOpenState(
    @Path("id") String id,
    @Body() ProjectItemModel body,
  );

  @DELETE("/project/{id}")
  Future<ResponseModel> deleteProject(
    @Path("id") String id,
  );

  @GET("/project/user/{userId}")
  Future<ProjectModel> getProjectByUserId(
    @Path("userId") String userId,
  );

  @POST("/project/reward/{id}")
  Future<ResponseModel> createProjectReward(
    @Path("id") String id,
    @Body() RewardItemModel body,
  );
}
