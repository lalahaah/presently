import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';

/// Recipients Screen (Gift CRM)
/// IA: Recipients Module
class RecipientsScreen extends StatelessWidget {
  const RecipientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipients', style: AppTypography.heading1()),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: _buildEmptyState(context, isDark),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to Add Recipient
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add Recipient coming soon!')),
          );
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Add Recipient'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 120,
              color:
                  (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                      .withValues(alpha: 0.2),
            ),
            const SizedBox(height: AppSpacing.l),
            Text(
              'No Recipients Yet',
              style: AppTypography.heading2(
                color: isDark
                    ? AppColors.darkOnSurface
                    : AppColors.lightOnSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              'Add people you buy gifts for to keep track of their preferences, upcoming events, and gift history',
              style: AppTypography.body(
                color:
                    (isDark
                            ? AppColors.darkOnSurface
                            : AppColors.lightOnSurface)
                        .withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add Recipient coming soon!')),
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Add Your First Recipient'),
            ),
          ],
        ),
      ),
    );
  }
}
