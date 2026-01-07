import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/gift_constants.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Step 1: 관계 선택
class Step1Relationship extends StatelessWidget {
  final String? selectedRelationship;
  final Function(String) onRelationshipSelected;

  const Step1Relationship({
    super.key,
    required this.selectedRelationship,
    required this.onRelationshipSelected,
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
            l10n.step1Title,
            style: AppTypography.display(
              color: isDark
                  ? AppColors.darkOnBackground
                  : AppColors.lightOnBackground,
            ),
          ),
          const SizedBox(height: AppSpacing.s),

          // 부제목
          Text(
            l10n.step1Subtitle,
            style: AppTypography.body(
              color:
                  (isDark
                          ? AppColors.darkOnBackground
                          : AppColors.lightOnBackground)
                      .withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // 관계 선택 그리드
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: AppSpacing.m,
              crossAxisSpacing: AppSpacing.m,
              childAspectRatio: 2.5,
            ),
            itemCount: GiftConstants.relationships.length,
            itemBuilder: (context, index) {
              final relationship = GiftConstants.relationships[index];
              final isSelected = selectedRelationship == relationship;

              return _buildRelationshipCard(
                context,
                isDark,
                l10n,
                relationship,
                isSelected,
              );
            },
          ),
        ],
      ),
    );
  }

  /// 관계 선택 카드 위젯
  Widget _buildRelationshipCard(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
    String relationship,
    bool isSelected,
  ) {
    // 관계별 라벨 가져오기
    String label;
    switch (relationship) {
      case 'spouse':
        label = l10n.relationshipSpouse;
        break;
      case 'partner':
        label = l10n.relationshipPartner;
        break;
      case 'friend':
        label = l10n.relationshipFriend;
        break;
      case 'parent':
        label = l10n.relationshipParent;
        break;
      case 'sibling':
        label = l10n.relationshipSibling;
        break;
      case 'child':
        label = l10n.relationshipChild;
        break;
      case 'colleague':
        label = l10n.relationshipColleague;
        break;
      case 'boss':
        label = l10n.relationshipBoss;
        break;
      case 'teacher':
        label = l10n.relationshipTeacher;
        break;
      case 'other':
        label = l10n.relationshipOther;
        break;
      default:
        label = relationship;
    }

    return InkWell(
      onTap: () => onRelationshipSelected(relationship),
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
