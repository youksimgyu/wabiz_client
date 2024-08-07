import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz_client/models/project/project_model.dart';
import 'package:wabiz_client/theme.dart';
import 'package:wabiz_client/view_model/project/project_view_model.dart';
import 'package:wabiz_client/views/project/widget/project_detail_widget.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final String project;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  late ProjectItemModel projectItemModel;

  ValueNotifier<bool> isMore = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    projectItemModel = ProjectItemModel.fromJson(json.decode(widget.project));
  }

  @override
  void dispose() {
    isMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.go('/home');
            },
            icon: SvgPicture.asset(
              'assets/icons/home_outlined.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Consumer(builder: (context, ref, child) {
        final project = ref.watch(
            ProjectDetailViewModelProvider(projectItemModel.id.toString()));
        return project.when(
          data: (data) {
            return Column(
              children: [
                Container(
                  height: 240,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        projectItemModel.thumbnail ?? '',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: isMore,
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            Positioned.fill(
                                child: SingleChildScrollView(
                              physics: !value
                                  ? const NeverScrollableScrollPhysics()
                                  : const BouncingScrollPhysics(),
                              child: ProjectWidget(projectItemModel: data),
                            )),
                            if (!value)
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 0,
                                child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white,
                                        Colors.white,
                                        Colors.white,
                                        Colors.white,
                                        Colors.white.withOpacity(0.1),
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                            if (!value)
                              Positioned(
                                left: 16,
                                right: 16,
                                bottom: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    isMore.value = true;
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primary,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '스토리 더보기',
                                          style: TextStyle(
                                            color: AppColors.primary,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Gap(12),
                                        Icon(
                                          Icons.keyboard_arrow_down,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      }),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }),
      bottomNavigationBar:
          BottomAppBarWidget(projectItemModel: projectItemModel),
    );
  }
}
