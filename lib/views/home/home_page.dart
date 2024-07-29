import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wabiz_client/theme.dart';
import 'package:wabiz_client/view_model/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final numberFormatter = NumberFormat('###,###,###,###');
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 324,
              color: AppColors.white,
              child: Column(
                children: [
                  // text field
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: TextFormField(
                              onTap: () {},
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wabizGray[100]!,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: AppColors.wabizGray[100]!,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                hintText: '새로운 일상이 필요하신가요?',
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search),
                                ),
                                suffixIconColor: AppColors.wabizGray[400],
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none_outlined),
                        ),
                      ],
                    ),
                  ),

                  // 상단
                  Expanded(
                    child: Consumer(
                      builder:
                          (BuildContext context, WidgetRef ref, Widget? child) {
                        final categories =
                            ref.watch(fetchHomeCategoriesProvider);
                        return categories.when(
                          data: (data) => GridView.builder(
                            itemCount: data.length,
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 0,
                            ),
                            itemBuilder: (context, index) {
                              final result = data[index];
                              return InkWell(
                                onTap: () {
                                  context.push('/home/category/${result.id}');
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 38,
                                      backgroundColor: AppColors.bg,
                                      child: Image.asset(
                                        data[index].iconPath ?? '',
                                        height: 42,
                                        width: 42,
                                      ),
                                    ),
                                    const Gap(4),
                                    Text(
                                      data[index].title ?? '??',
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          error: (error, stackTrace) =>
                              const Center(child: Text('error')),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.bg,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Gap(12),
                ],
              ),
            ),
            const Gap(12),

            // 하단
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final project =
                      ref.watch(homeViewModelProvider.notifier).fetchHomeData();
                  return FutureBuilder(
                    future: project,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        if (data.projects.isEmpty) {
                          return Column(
                            children: [
                              const Text('데이터가 없습니다.'),
                              TextButton(
                                onPressed: () {},
                                child: const Text('새로 고침'),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            color: AppColors.white,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                final project = data.projects[index];
                                return InkWell(
                                  onTap: () {
                                    context.push(
                                      '/detail',
                                      extra: json.encode(project.toJson()),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 30,
                                          offset: const Offset(0, 2),
                                          spreadRadius: 4,
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.only(
                                        bottom: 8,
                                        left: 16,
                                        right: 16,
                                        top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  project.thumbnail ?? ''),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                project.isOpen == "close"
                                                    ? "${numberFormatter.format(project.waitlistCount)}명이 기다려요."
                                                    : "${numberFormatter.format(project.totalFundedCount)}명이 인증했어요.",
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                              const Gap(8),
                                              Text(project.title ??
                                                  '아이돌 관리비법 | 준비 안된 얼굴라인도 살리는 세럼'),
                                              const Gap(16),
                                              Text(
                                                project.owner ?? '세상에 없던 브랜드',
                                                style: TextStyle(
                                                  color:
                                                      AppColors.wabizGray[500]!,
                                                ),
                                              ),
                                              const Gap(16),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: AppColors.bg,
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 6,
                                                        vertical: 4),
                                                child: Text(
                                                  project.isOpen == "close"
                                                      ? '오픈예정'
                                                      : '바로구매',
                                                  style: const TextStyle(
                                                      fontSize: 10),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
