import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/domain/models/gift_profile.dart';
import 'package:presently/domain/models/gift_recommendation.dart';
import 'package:presently/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

/// 추천 결과 화면
/// AI가 생성한 선물 추천을 카드 형식으로 표시
class RecommendationResultsScreen extends StatefulWidget {
  final GiftProfile profile;
  final List<GiftRecommendation> recommendations;

  const RecommendationResultsScreen({
    super.key,
    required this.profile,
    required this.recommendations,
  });

  @override
  State<RecommendationResultsScreen> createState() =>
      _RecommendationResultsScreenState();
}

class _RecommendationResultsScreenState
    extends State<RecommendationResultsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// 쿠팡 URL 열기
  Future<void> _openCoupangUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  /// 메시지 클립보드에 복사
  void _copyMessage(String message, AppLocalizations l10n) {
    Clipboard.setData(ClipboardData(text: message));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.messageCopied)));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recommendationsTitle, style: AppTypography.heading1()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 부제목
          Padding(
            padding: const EdgeInsets.all(AppSpacing.l),
            child: Text(
              l10n.recommendationsSubtitle,
              style: AppTypography.body(
                color:
                    (isDark
                            ? AppColors.darkOnBackground
                            : AppColors.lightOnBackground)
                        .withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // 카드 페이지 인디케이터
          _buildPageIndicator(isDark),

          const SizedBox(height: AppSpacing.m),

          // 추천 카드 PageView
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: widget.recommendations.length,
              itemBuilder: (context, index) {
                final recommendation = widget.recommendations[index];
                return _buildRecommendationCard(
                  context,
                  isDark,
                  l10n,
                  recommendation,
                );
              },
            ),
          ),

          // 하단 액션 버튼
          _buildActionButtons(isDark, l10n),
        ],
      ),
    );
  }

  /// 페이지 인디케이터 위젯
  Widget _buildPageIndicator(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.recommendations.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? (isDark ? AppColors.darkPrimary : AppColors.primary)
                : (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                      .withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  /// 추천 카드 위젯
  Widget _buildRecommendationCard(
    BuildContext context,
    bool isDark,
    AppLocalizations l10n,
    GiftRecommendation recommendation,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.l),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상품 이미지 플레이스홀더
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color:
                      (isDark ? AppColors.darkSurface : AppColors.lightSurface)
                          .withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.card_giftcard,
                  size: 80,
                  color:
                      (isDark
                              ? AppColors.darkOnSurface
                              : AppColors.lightOnSurface)
                          .withValues(alpha: 0.3),
                ),
              ),

              const SizedBox(height: AppSpacing.l),

              // 상품명
              Text(
                recommendation.itemName,
                style: AppTypography.heading1(
                  color: isDark
                      ? AppColors.darkOnBackground
                      : AppColors.lightOnBackground,
                ),
              ),

              const SizedBox(height: AppSpacing.s),

              // 예상 가격
              if (recommendation.estimatedPrice != null)
                Text(
                  recommendation.getFormattedPrice(),
                  style: AppTypography.heading2(
                    color: isDark ? AppColors.darkPrimary : AppColors.primary,
                  ),
                ),

              const SizedBox(height: AppSpacing.l),

              // AI 추천 사유
              Text(
                l10n.aiReasoning,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.darkOnBackground
                      : AppColors.lightOnBackground,
                ),
              ),
              const SizedBox(height: AppSpacing.s),
              Text(
                recommendation.reasoning,
                style: AppTypography.body(
                  color:
                      (isDark
                              ? AppColors.darkOnBackground
                              : AppColors.lightOnBackground)
                          .withValues(alpha: 0.8),
                ),
              ),

              const SizedBox(height: AppSpacing.l),

              // 감정적 호소
              Container(
                padding: const EdgeInsets.all(AppSpacing.m),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkPrimary : AppColors.primary)
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  recommendation.emotionalPitch,
                  style: AppTypography.bodyMedium(
                    color: isDark ? AppColors.darkPrimary : AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: AppSpacing.l),

              // 선물 메시지
              Text(
                l10n.giftMessage,
                style: AppTypography.bodyMedium(
                  color: isDark
                      ? AppColors.darkOnBackground
                      : AppColors.lightOnBackground,
                ),
              ),
              const SizedBox(height: AppSpacing.s),
              Container(
                padding: const EdgeInsets.all(AppSpacing.m),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface
                      : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        recommendation.suggestedGreeting,
                        style: AppTypography.body(
                          color: isDark
                              ? AppColors.darkOnSurface
                              : AppColors.lightOnSurface,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () =>
                          _copyMessage(recommendation.suggestedGreeting, l10n),
                      tooltip: l10n.copyMessage,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // 쿠팡에서 보기 버튼
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _openCoupangUrl(recommendation.getCoupangUrl()),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
                    backgroundColor: isDark
                        ? AppColors.darkPrimary
                        : AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.shopping_cart),
                  label: Text(
                    l10n.viewOnCoupang,
                    style: AppTypography.bodyMedium(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 하단 액션 버튼
  Widget _buildActionButtons(bool isDark, AppLocalizations l10n) {
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
            // 다시 찾기 버튼
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
                  side: BorderSide(
                    color: isDark
                        ? AppColors.darkBorder
                        : AppColors.lightBorder,
                  ),
                ),
                child: Text(l10n.tryAgain),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
