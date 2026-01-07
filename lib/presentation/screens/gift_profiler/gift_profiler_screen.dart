import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/gift_constants.dart';
import 'package:presently/domain/models/gift_profile.dart';
import 'package:presently/l10n/app_localizations.dart';
import 'package:presently/presentation/screens/gift_profiler/steps/step1_relationship.dart';
import 'package:presently/presentation/screens/gift_profiler/steps/step2_personality.dart';
import 'package:presently/presentation/screens/gift_profiler/steps/step3_occasion.dart';
import 'package:presently/presentation/screens/gift_profiler/steps/step4_budget.dart';
import 'package:presently/presentation/screens/gift_profiler/ai_loading_screen.dart';

/// 선물 찾기 Smart Profiler 메인 화면
/// 4단계 프로세스를 통해 선물 대상자 정보를 수집
class GiftProfilerScreen extends StatefulWidget {
  const GiftProfilerScreen({super.key});

  @override
  State<GiftProfilerScreen> createState() => _GiftProfilerScreenState();
}

class _GiftProfilerScreenState extends State<GiftProfilerScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 4;

  // Step 1: 관계
  String? _selectedRelationship;

  // Step 2: 성격 특성 + MBTI
  final List<String> _selectedTraits = [];
  String? _selectedMbti;

  // Step 3: 이벤트 + 컨텍스트
  String? _selectedOccasion;
  String? _contextNote;

  // Step 4: 예산
  double _budgetMin = GiftConstants.minBudget.toDouble();
  double _budgetMax = GiftConstants.maxBudget.toDouble();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// 다음 단계로 이동
  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      setState(() {
        _currentStep++;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // 마지막 단계 - 선물 찾기 시작
      _startGiftSearch();
    }
  }

  /// 이전 단계로 이동
  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
      _pageController.animateToPage(
        _currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// 현재 단계가 완료되었는지 확인
  bool _isCurrentStepComplete() {
    switch (_currentStep) {
      case 0:
        return _selectedRelationship != null;
      case 1:
        return _selectedTraits.isNotEmpty;
      case 2:
        return _selectedOccasion != null;
      case 3:
        return true; // 예산은 기본값이 있으므로 항상 완료
      default:
        return false;
    }
  }

  /// 선물 찾기 시작
  void _startGiftSearch() {
    // GiftProfile 생성
    final profile = GiftProfile(
      relationship: _selectedRelationship!,
      mbtiType: _selectedMbti,
      personalityTraits: _selectedTraits,
      occasion: _selectedOccasion!,
      contextNote: _contextNote,
      budgetMin: _budgetMin.toInt(),
      budgetMax: _budgetMax.toInt(),
    );

    // AI 로딩 화면으로 이동
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AiLoadingScreen(profile: profile),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.giftProfiler, style: AppTypography.heading1()),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 프로그레스 인디케이터
          _buildProgressIndicator(isDark, l10n),

          // 단계별 화면
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Step1Relationship(
                  selectedRelationship: _selectedRelationship,
                  onRelationshipSelected: (relationship) {
                    setState(() {
                      _selectedRelationship = relationship;
                    });
                  },
                ),
                Step2Personality(
                  selectedTraits: _selectedTraits,
                  selectedMbti: _selectedMbti,
                  onTraitsChanged: (traits) {
                    setState(() {
                      _selectedTraits
                        ..clear()
                        ..addAll(traits);
                    });
                  },
                  onMbtiChanged: (mbti) {
                    setState(() {
                      _selectedMbti = mbti;
                    });
                  },
                ),
                Step3Occasion(
                  selectedOccasion: _selectedOccasion,
                  contextNote: _contextNote,
                  onOccasionSelected: (occasion) {
                    setState(() {
                      _selectedOccasion = occasion;
                    });
                  },
                  onContextChanged: (context) {
                    setState(() {
                      _contextNote = context;
                    });
                  },
                ),
                Step4Budget(
                  budgetMin: _budgetMin,
                  budgetMax: _budgetMax,
                  onBudgetChanged: (min, max) {
                    setState(() {
                      _budgetMin = min;
                      _budgetMax = max;
                    });
                  },
                ),
              ],
            ),
          ),

          // 네비게이션 버튼
          _buildNavigationButtons(isDark, l10n),
        ],
      ),
    );
  }

  /// 프로그레스 인디케이터 위젯
  Widget _buildProgressIndicator(bool isDark, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: Column(
        children: [
          // 단계 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${l10n.step} ${_currentStep + 1} / $_totalSteps',
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.darkOnSurface
                      : AppColors.lightOnSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.m),

          // 프로그레스 바
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: (_currentStep + 1) / _totalSteps,
              backgroundColor:
                  (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                      .withValues(alpha: 0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                isDark ? AppColors.darkPrimary : AppColors.primary,
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  /// 네비게이션 버튼 위젯
  Widget _buildNavigationButtons(bool isDark, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.l),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            // 이전 버튼
            if (_currentStep > 0)
              Expanded(
                child: OutlinedButton(
                  onPressed: _previousStep,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkBorder
                          : AppColors.lightBorder,
                    ),
                  ),
                  child: Text(l10n.previous),
                ),
              ),

            if (_currentStep > 0) const SizedBox(width: AppSpacing.m),

            // 다음 / 선물 찾기 버튼
            Expanded(
              flex: _currentStep == 0 ? 1 : 1,
              child: ElevatedButton(
                onPressed: _isCurrentStepComplete() ? _nextStep : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
                  backgroundColor: isDark
                      ? AppColors.darkPrimary
                      : AppColors.primary,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor:
                      (isDark
                              ? AppColors.darkOnSurface
                              : AppColors.lightOnSurface)
                          .withValues(alpha: 0.3),
                ),
                child: Text(
                  _currentStep < _totalSteps - 1
                      ? l10n.next
                      : l10n.analyzeAndFind,
                  style: AppTypography.bodyMedium(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
