import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:presently/presentation/screens/home/home_screen.dart';
import 'package:presently/presentation/screens/recipients/recipients_screen.dart';
import 'package:presently/presentation/screens/settings/settings_screen.dart';
import 'package:presently/presentation/widgets/scaffold_with_nav_bar.dart';

/// App Router Configuration
/// Using go_router for navigation with StatefulShellRoute for bottom nav
class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'home',
  );
  static final _recipientsNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'recipients',
  );
  static final _settingsNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'settings',
  );

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home Branch
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),

          // Recipients Branch
          StatefulShellBranch(
            navigatorKey: _recipientsNavigatorKey,
            routes: [
              GoRoute(
                path: '/recipients',
                name: 'recipients',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: RecipientsScreen()),
                // TODO: Add child routes
                // - /recipients/:id (Recipient Detail)
              ),
            ],
          ),

          // Settings Branch
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SettingsScreen()),
              ),
            ],
          ),
        ],
      ),

      // TODO: Add full-screen routes outside bottom nav
      // - /profiler (Gift Profiler - 4 steps)
      // - /results (Recommendation Results)
    ],
  );
}
