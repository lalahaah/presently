import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/gift_constants.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Step 4: 예산 설정
class Step4Budget extends StatelessWidget {
  final double budgetMin;
  final double budgetMax;
  final Function(double, double) onBudgetChanged;

  const Step4Budget({
    super.key,
    required this.budgetMin,
    required this.budgetMax,
    required this.onBudgetChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목
          Text(
            l10n.step4Title,
            style: AppTypography.display(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.s),

          // 부제목
          Text(
            l10n.step4Subtitle,
            style: AppTypography.body(
              color:
                  (isDark
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground)
                      .withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // 예산 범위 표시
          Center(
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.l),
              decoration: BoxDecoration(
                color: (isDark ? AppColors.darkPrimary : AppColors.primary)
                    .withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    _formatBudgetRange(l10n, budgetMin, budgetMax),
                    style: AppTypography.display(
                      color: isDark ? AppColors.darkPrimary : AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Range Slider
          RangeSlider(
            values: RangeValues(budgetMin, budgetMax),
            min: GiftConstants.minBudget.toDouble(),
            max: GiftConstants.maxBudget.toDouble(),
            divisions:
                (GiftConstants.maxBudget - GiftConstants.minBudget) ~/
                GiftConstants.budgetStep,
            labels: RangeLabels(
              _formatPrice(budgetMin.toInt()),
              _formatPrice(budgetMax.toInt()),
            ),
            activeColor: isDark ? AppColors.darkPrimary : AppColors.primary,
            inactiveColor:
                (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                    .withValues(alpha: 0.3),
            onChanged: (values) {
              onBudgetChanged(values.start, values.end);
            },
          ),

          // 최소/최대 라벨
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatPrice(GiftConstants.minBudget),
                  style: AppTypography.bodySmall(
                    color:
                        (isDark
                                ? AppColors.darkOnSurface
                                : AppColors.lightOnSurface)
                            .withValues(alpha: 0.7),
                  ),
                ),
                Text(
                  '${_formatPrice(GiftConstants.maxBudget)}+',
                  style: AppTypography.bodySmall(
                    color:
                        (isDark
                                ? AppColors.darkOnSurface
                                : AppColors.lightOnSurface)
                            .withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 가격 포맷팅 (천 단위 구분 기호)
  String _formatPrice(int price) {
    final formatter = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final priceStr = price.toString();
    return '₩${priceStr.replaceAllMapped(formatter, (Match m) => '${m[1]},')}';
  }

  /// 예산 범위 표시 문자열
  String _formatBudgetRange(AppLocalizations l10n, double min, double max) {
    final minStr = _formatPrice(min.toInt());
    final maxStr = _formatPrice(max.toInt());

    if (max >= GiftConstants.maxBudget) {
      return '$minStr ~ $maxStr+';
    }

    return '$minStr ~ $maxStr';
  }
}
