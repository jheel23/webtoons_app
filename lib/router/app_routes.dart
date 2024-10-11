import 'package:anime_app/screens/details_screen.dart';
import 'package:anime_app/screens/main_tab.dart';
import 'package:anime_app/screens/tabs/favourites_screen.dart';
import 'package:anime_app/screens/tabs/home_screen.dart';
import 'package:anime_app/screens/tabs/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();
  static AppRoutes instance = AppRoutes._();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static String homeRouteName = '/home';
  static String favouriteRouteName = '/favorites';
  static String detailsRouteName = '/details-screen';
  static String profileRouteName = '/profile';
  GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/details-screen',
        builder: (context, state) => const DetailsScreen(),
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationshell) =>
              MainTab(navigationshell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                name: homeRouteName,
                path: '/home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage<void>(child: HomeScreen()),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: favouriteRouteName,
                path: '/favorites',
                pageBuilder: (context, state) =>
                    const NoTransitionPage<void>(child: FavouritesScreen()),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                name: profileRouteName,
                path: '/profile',
                pageBuilder: (context, state) =>
                    const NoTransitionPage<void>(child: ProfileScreen()),
              ),
            ]),
          ]),
    ],
  );
}
