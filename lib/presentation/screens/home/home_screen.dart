import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/presentation/widgets/app_buttons.dart';

/// Home Screen (Dashboard)
/// IA: Home Module - The Hub
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Presently', style: AppTypography.heading1()),
        actions: [
          // Pro Status Badge Placeholder
          Container(
            margin: const EdgeInsets.only(right: AppSpacing.m),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: (isDark ? AppColors.darkPrimary : AppColors.primary)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Free',
              style: AppTypography.caption(
                color: isDark ? AppColors.darkPrimary : AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1.1. Header - User Greeting
            _buildGreetingSection(isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.2. Primary CTA - "Find a Gift"
            _buildPrimaryCTA(context),

            const SizedBox(height: AppSpacing.xl),

            // 1.3. Upcoming Events Widget
            _buildUpcomingEventsSection(isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.4. Recent Recommendations
            _buildRecentRecommendationsSection(isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.5. Ad Placement (placeholder)
            _buildAdPlaceholder(isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, there! 👋',
          style: AppTypography.display(
            color: isDark
                ? AppColors.darkOnBackground
                : AppColors.lightOnBackground,
          ),
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          'What gift are you looking for today?',
          style: AppTypography.body(
            color:
                (isDark
                        ? AppColors.darkOnBackground
                        : AppColors.lightOnBackground)
                    .withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryCTA(BuildContext context) {
    return PrimaryButton(
      text: 'Find a Gift',
      icon: const Icon(Icons.card_giftcard),
      onPressed: () {
        // TODO: Navigate to Gift Profiler
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gift Profiler coming soon!')),
        );
      },
      fullWidth: true,
    );
  }

  Widget _buildUpcomingEventsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Events',
              style: AppTypography.heading2(
                color: isDark
                    ? AppColors.darkOnBackground
                    : AppColors.lightOnBackground,
              ),
            ),
            TextButton(
              onPressed: () {
                // TODO: Navigate to Recipients
              },
              child: const Text('See All'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        _buildEmptyState(
          isDark,
          'No upcoming events',
          'Add recipients to see their birthdays and anniversaries here',
        ),
      ],
    );
  }

  Widget _buildRecentRecommendationsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Recommendations',
          style: AppTypography.heading2(
            color: isDark
                ? AppColors.darkOnBackground
                : AppColors.lightOnBackground,
          ),
        ),
        const SizedBox(height: AppSpacing.m),
        _buildEmptyState(
          isDark,
          'No recommendations yet',
          'Find a gift to see AI-curated recommendations here',
        ),
      ],
    );
  }

  Widget _buildAdPlaceholder(bool isDark) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkSurface : AppColors.lightBorder)
            .withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        'Ad Placement',
        style: AppTypography.caption(
          color: (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
              .withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                .withValues(alpha: 0.3),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            title,
            style: AppTypography.bodyMedium(
              color: isDark
                  ? AppColors.darkOnSurface
                  : AppColors.lightOnSurface,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            subtitle,
            style: AppTypography.bodySmall(
              color:
                  (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                      .withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
