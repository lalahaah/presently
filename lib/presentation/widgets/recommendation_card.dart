import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_radius.dart';
import '../../core/constants/app_spacing.dart';
import '../../core/constants/app_elevation.dart';
import '../../core/constants/app_component_values.dart';

/// Recommendation Card 위젯
/// Design System Spec:
/// - Structure: 1:1 Image Ratio, 커브드 코너(16px)
/// - Badge: AI 추천 점수 또는 'Best Match' 라벨 상단 배치
/// - Content: 상품명(Bold) + 가격 지표($$$) + AI 코멘트(Italic)
/// - Action: 'View on Amazon' 골드 버튼 (Full width)
class RecommendationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String priceIndicator; // $, $$, $$$
  final String aiReason;
  final String? aiGreeting;
  final String? badge;
  final VoidCallback? onViewProduct;
  final VoidCallback? onSave;
  final bool showActions;

  const RecommendationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.priceIndicator,
    required this.aiReason,
    this.aiGreeting,
    this.badge,
    this.onViewProduct,
    this.onSave,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: AppElevation.card,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.recommendationCardRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Badge
          _buildImageSection(isDark),

          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and Price
                _buildTitleSection(isDark),

                const SizedBox(height: AppSpacing.s),

                // AI Reason
                _buildAIReason(isDark),

                if (aiGreeting != null) ...[
                  const SizedBox(height: AppSpacing.s),
                  _buildAIGreeting(isDark),
                ],

                if (showActions) ...[
                  const SizedBox(height: AppSpacing.m),
                  _buildActions(isDark),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(bool isDark) {
    return Stack(
      children: [
        // 1:1 Aspect Ratio Image
        AspectRatio(
          aspectRatio: AppComponentValues.cardImageAspectRatio,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.recommendationCard),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: isDark ? AppColors.darkSurface : AppColors.lightBorder,
                  child: Icon(
                    Icons.card_giftcard,
                    size: 48,
                    color: isDark
                        ? AppColors.darkOnSurface
                        : AppColors.lightOnSurface,
                  ),
                );
              },
            ),
          ),
        ),

        // Badge
        if (badge != null)
          Positioned(
            top: AppSpacing.s,
            right: AppSpacing.s,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: AppColors.aiBadge,
                borderRadius: AppRadius.radiusS,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                badge!,
                style: AppTypography.caption(
                  color: isDark
                      ? AppColors.darkOnPrimary
                      : AppColors.lightOnPrimary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTitleSection(bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTypography.bodyBold(
              color: isDark
                  ? AppColors.darkOnSurface
                  : AppColors.lightOnSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.s),
        Text(
          priceIndicator,
          style: AppTypography.priceIndicator(color: AppColors.priceIndicator),
        ),
      ],
    );
  }

  Widget _buildAIReason(bool isDark) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.auto_awesome,
          size: 16,
          color: isDark ? AppColors.darkPrimary : AppColors.primary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            aiReason,
            style: AppTypography.aiComment(
              color: isDark
                  ? AppColors.darkOnSurface.withValues(alpha: 0.8)
                  : AppColors.lightOnSurface.withValues(alpha: 0.8),
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildAIGreeting(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkPrimary : AppColors.primary).withValues(
          alpha: 0.1,
        ),
        borderRadius: AppRadius.radiusS,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.message_outlined,
            size: 14,
            color: isDark ? AppColors.darkPrimary : AppColors.primary,
          ),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              aiGreeting!,
              style: AppTypography.bodySmall(
                color: isDark
                    ? AppColors.darkOnSurface
                    : AppColors.lightOnSurface,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onViewProduct,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark
                  ? AppColors.darkPrimary
                  : AppColors.primary,
              foregroundColor: isDark
                  ? AppColors.darkOnPrimary
                  : AppColors.lightOnPrimary,
            ),
            child: const Text('View on Amazon'),
          ),
        ),
        if (onSave != null) ...[
          const SizedBox(width: AppSpacing.s),
          IconButton(
            onPressed: onSave,
            icon: const Icon(Icons.bookmark_border),
            color: isDark ? AppColors.darkPrimary : AppColors.primary,
          ),
        ],
      ],
    );
  }
}
