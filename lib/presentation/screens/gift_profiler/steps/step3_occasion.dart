import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/gift_constants.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Step 3: 이벤트 및 컨텍스트 입력
class Step3Occasion extends StatefulWidget {
  final String? selectedOccasion;
  final String? contextNote;
  final Function(String) onOccasionSelected;
  final Function(String?) onContextChanged;

  const Step3Occasion({
    super.key,
    required this.selectedOccasion,
    required this.contextNote,
    required this.onOccasionSelected,
    required this.onContextChanged,
  });

  @override
  State<Step3Occasion> createState() => _Step3OccasionState();
}

class _Step3OccasionState extends State<Step3Occasion> {
  late final TextEditingController _contextController;

  @override
  void initState() {
    super.initState();
    _contextController = TextEditingController(text: widget.contextNote);
  }

  @override
  void dispose() {
    _contextController.dispose();
    super.dispose();
  }

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
            l10n.step3Title,
            style: AppTypography.display(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.s),

          // 부제목
          Text(
            l10n.step3Subtitle,
            style: AppTypography.body(
              color:
                  (isDark
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground)
                      .withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // 이벤트 종류 선택 그리드
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.m,
              crossAxisSpacing: AppSpacing.m,
              childAspectRatio: 2.5,
            ),
            itemCount: GiftConstants.occasions.length,
            itemBuilder: (context, index) {
              final occasion = GiftConstants.occasions[index];
              final isSelected = widget.selectedOccasion == occasion;

              return _buildOccasionCard(
                context,
                isDark,
                l10n,
                occasion,
                isSelected,
              );
            },
          ),

          const SizedBox(height: AppSpacing.xl),

          // 추가 컨텍스트 입력
          Text(
            l10n.contextLabel,
            style: AppTypography.heading2(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            l10n.contextHint,
            style: AppTypography.bodySmall(
              color:
                  (isDark
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground)
                      .withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.m),

          TextField(
            controller: _contextController,
            maxLines: 4,
            maxLength: 200,
            onChanged: widget.onContextChanged,
            decoration: InputDecoration(
              hintText: l10n.contextPlaceholder,
              filled: true,
              fillColor: isDark
                  ? AppColors.darkSurface
                  : AppColors.lightSurface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: isDark ? AppColors.darkPrimary : AppColors.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 이벤트 선택 카드 위젯
  Widget _buildOccasionCard(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
    String occasion,
    bool isSelected,
  ) {
    // 이벤트별 라벨 가져오기
    String label;
    switch (occasion) {
      case 'birthday':
        label = l10n.occasionBirthday;
        break;
      case 'anniversary':
        label = l10n.occasionAnniversary;
        break;
      case 'wedding':
        label = l10n.occasionWedding;
        break;
      case 'graduation':
        label = l10n.occasionGraduation;
        break;
      case 'promotion':
        label = l10n.occasionPromotion;
        break;
      case 'housewarming':
        label = l10n.occasionHousewarming;
        break;
      case 'apology':
        label = l10n.occasionApology;
        break;
      case 'thank_you':
        label = l10n.occasionThankYou;
        break;
      case 'just_because':
        label = l10n.occasionJustBecause;
        break;
      case 'other':
        label = l10n.occasionOther;
        break;
      default:
        label = occasion;
    }

    return InkWell(
      onTap: () => widget.onOccasionSelected(occasion),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? AppColors.darkPrimary : AppColors.primary)
              : (isDark ? AppColors.darkSurface : AppColors.lightSurface),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? (isDark ? AppColors.darkPrimary : AppColors.primary)
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            width: isSelected ? 2 : 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTypography.bodyMedium(
            color: isSelected
                ? Colors.white
                : (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
