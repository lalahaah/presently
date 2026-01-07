import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/presentation/widgets/app_buttons.dart';
import 'package:presently/l10n/app_localizations.dart';
import 'package:presently/presentation/screens/gift_profiler/gift_profiler_screen.dart';

/// Home Screen (Dashboard)
/// IA: Home Module - The Hub
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle, style: AppTypography.heading1()),
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
              l10n.free,
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
            _buildGreetingSection(context, isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.2. Primary CTA - "Find a Gift"
            _buildPrimaryCTA(context),

            const SizedBox(height: AppSpacing.xl),

            // 1.3. Upcoming Events Widget
            _buildUpcomingEventsSection(context, isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.4. Recent Recommendations
            _buildRecentRecommendationsSection(context, isDark),

            const SizedBox(height: AppSpacing.xl),

            // 1.5. Ad Placement (placeholder)
            _buildAdPlaceholder(context, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.homeGreeting,
          style: AppTypography.display(
            color: isDark
                ? AppColors.darkOnBackground
                : AppColors.lightOnBackground,
          ),
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          l10n.homeSubtitle,
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
    final l10n = AppLocalizations.of(context);
    return PrimaryButton(
      text: l10n.findGift,
      icon: const Icon(Icons.card_giftcard),
      onPressed: () {
        // Navigate to Gift Profiler
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const GiftProfilerScreen()),
        );
      },
      fullWidth: true,
    );
  }

  Widget _buildUpcomingEventsSection(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.upcomingEvents,
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
              child: Text(l10n.seeAll),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        _buildEmptyState(
          context,
          isDark,
          l10n.noUpcomingEvents,
          l10n.noUpcomingEventsDesc,
        ),
      ],
    );
  }

  Widget _buildRecentRecommendationsSection(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.recentRecommendations,
          style: AppTypography.heading2(
            color: isDark
                ? AppColors.darkOnBackground
                : AppColors.lightOnBackground,
          ),
        ),
        const SizedBox(height: AppSpacing.m),
        _buildEmptyState(
          context,
          isDark,
          l10n.noRecommendations,
          l10n.noRecommendationsDesc,
        ),
      ],
    );
  }

  Widget _buildAdPlaceholder(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
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
        l10n.adPlacement,
        style: AppTypography.caption(
          color: (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
              .withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    bool isDark,
    String title,
    String subtitle,
  ) {
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
