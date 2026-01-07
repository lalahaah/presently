import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/gift_constants.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Step 2: 성격 특성 + MBTI 선택
class Step2Personality extends StatelessWidget {
  final List<String> selectedTraits;
  final String? selectedMbti;
  final Function(List<String>) onTraitsChanged;
  final Function(String?) onMbtiChanged;

  const Step2Personality({
    super.key,
    required this.selectedTraits,
    required this.selectedMbti,
    required this.onTraitsChanged,
    required this.onMbtiChanged,
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
            l10n.step2Title,
            style: AppTypography.display(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.s),

          // 부제목
          Text(
            l10n.step2Subtitle,
            style: AppTypography.body(
              color:
                  (isDark
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground)
                      .withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // 섹션 A: 성격 특성
          Text(
            l10n.personalitySection,
            style: AppTypography.heading2(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.m),

          // 성격 특성 선택 칩
          Wrap(
            spacing: AppSpacing.s,
            runSpacing: AppSpacing.s,
            children: GiftConstants.personalityTraits.map((trait) {
              final isSelected = selectedTraits.contains(trait);
              return _buildTraitChip(context, isDark, l10n, trait, isSelected);
            }).toList(),
          ),

          const SizedBox(height: AppSpacing.xl),

          // 섹션 B: MBTI (선택사항)
          Text(
            l10n.mbtiSection,
            style: AppTypography.heading2(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.m),

          // MBTI 선택 드롭다운
          _buildMbtiDropdown(context, isDark, l10n),
        ],
      ),
    );
  }

  /// 성격 특성 칩 위젯
  Widget _buildTraitChip(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
    String trait,
    bool isSelected,
  ) {
    // 특성별 라벨 가져오기
    String label;
    switch (trait) {
      case 'techie':
        label = l10n.traitTechie;
        break;
      case 'minimalist':
        label = l10n.traitMinimalist;
        break;
      case 'outdoorsy':
        label = l10n.traitOutdoorsy;
        break;
      case 'artistic':
        label = l10n.traitArtistic;
        break;
      case 'foodie':
        label = l10n.traitFoodie;
        break;
      case 'bookworm':
        label = l10n.traitBookworm;
        break;
      case 'fitness':
        label = l10n.traitFitness;
        break;
      case 'fashionable':
        label = l10n.traitFashionable;
        break;
      case 'homebody':
        label = l10n.traitHomebody;
        break;
      case 'adventurous':
        label = l10n.traitAdventurous;
        break;
      case 'eco_friendly':
        label = l10n.traitEcoFriendly;
        break;
      case 'practical':
        label = l10n.traitPractical;
        break;
      default:
        label = trait;
    }

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        List<String> newTraits = List.from(selectedTraits);
        if (selected) {
          if (newTraits.length < 5) {
            newTraits.add(trait);
          }
        } else {
          newTraits.remove(trait);
        }
        onTraitsChanged(newTraits);
      },
      selectedColor: isDark ? AppColors.darkPrimary : AppColors.primary,
      backgroundColor: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      labelStyle: AppTypography.bodySmall(
        color: isSelected
            ? Colors.white
            : (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface),
      ),
      side: BorderSide(
        color: isSelected
            ? (isDark ? AppColors.darkPrimary : AppColors.primary)
            : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
    );
  }

  /// MBTI 드롭다운 위젯
  Widget _buildMbtiDropdown(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
  ) {
    // 현재 언어에 따라 라벨 선택
    final locale = Localizations.localeOf(context);
    final isKorean = locale.languageCode == 'ko';
    final mbtiLabels = isKorean
        ? GiftConstants.mbtiLabelsKo
        : GiftConstants.mbtiLabelsEn;

    return InkWell(
      onTap: () => _showMbtiBottomSheet(context, isDark, l10n, mbtiLabels),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.m),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedMbti != null
                  ? mbtiLabels[selectedMbti!] ?? selectedMbti!
                  : l10n.selectMbti,
              style: AppTypography.body(
                color: selectedMbti != null
                    ? (isDark
                          ? AppColors.darkOnSurface
                          : AppColors.lightOnSurface)
                    : (isDark
                              ? AppColors.darkOnSurface
                              : AppColors.lightOnSurface)
                          .withValues(alpha: 0.5),
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: isDark
                  ? AppColors.darkOnSurface
                  : AppColors.lightOnSurface,
            ),
          ],
        ),
      ),
    );
  }

  /// MBTI 선택 바텀시트
  void _showMbtiBottomSheet(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
    Map<String, String> mbtiLabels,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.selectMbti,
                style: AppTypography.heading2(
                  color: isDark
                      ? AppColors.darkOnBackground
                      : AppColors.lightOnBackground,
                ),
              ),
              const SizedBox(height: AppSpacing.m),
              Expanded(
                child: ListView.builder(
                  itemCount: GiftConstants.mbtiTypes.length,
                  itemBuilder: (context, index) {
                    final mbti = GiftConstants.mbtiTypes[index];
                    final label = mbtiLabels[mbti] ?? mbti;
                    final isSelected = selectedMbti == mbti;

                    return ListTile(
                      title: Text(label),
                      trailing: isSelected
                          ? Icon(
                              Icons.check,
                              color: isDark
                                  ? AppColors.darkPrimary
                                  : AppColors.primary,
                            )
                          : null,
                      onTap: () {
                        onMbtiChanged(mbti == 'none' ? null : mbti);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
