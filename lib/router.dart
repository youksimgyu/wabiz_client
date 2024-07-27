import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wabiz_client/views/category/category_page.dart';
import 'package:wabiz_client/views/home/home_page.dart';
import 'package:wabiz_client/views/login/sign_in_page.dart';
import 'package:wabiz_client/views/login/sign_up_page.dart';
import 'package:wabiz_client/views/my/my_page.dart';
import 'package:wabiz_client/views/project/add_project_page.dart';
import 'package:wabiz_client/views/project/add_reward_project.dart';
import 'package:wabiz_client/views/wabiz_app_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/login",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      path: "/sign-up",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) {
        return const SignUpPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return WabizAppShell(
          currentIndex: switch (state.uri.path) {
            var path when path.startsWith("/my") => 3,
            _ => 0,
          },
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/home",
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'category/:id',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return CategoryPage(categoryId: id);
              },
            )
          ],
        ),
        GoRoute(
          path: '/my',
          parentNavigatorKey: _shellNavigatorKey,
          builder: (context, state) => const MyPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/add',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const AddProjectPage(),
      routes: [
        GoRoute(
            path: 'reward/:id',
            builder: (context, state) {
              final projectId = state.extra as String;
              return AddRewardProject(projectId: projectId);
            }),
      ],
    ),
  ],
);
