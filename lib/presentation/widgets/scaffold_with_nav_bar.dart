import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/constants/app_icon_size.dart';

/// Scaffold with Bottom Navigation Bar
/// Used with StatefulShellRoute for maintaining state across tabs
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: isDark ? AppColors.darkPrimary : AppColors.primary,
        unselectedItemColor:
            (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                .withValues(alpha: 0.6),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        iconSize: AppIconSize.bottomNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Recipients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),

      // FAB only on Home tab (index 0)
      floatingActionButton: navigationShell.currentIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () {
                // TODO: Navigate to Gift Profiler
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Gift Profiler coming soon!')),
                );
              },
              icon: const Icon(Icons.card_giftcard),
              label: const Text('Find a Gift'),
            )
          : null,
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
