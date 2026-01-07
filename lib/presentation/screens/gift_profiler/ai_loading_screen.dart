import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/constants/ad_constants.dart';
import 'package:presently/domain/models/gift_profile.dart';
import 'package:presently/domain/models/gift_recommendation.dart';
import 'package:presently/l10n/app_localizations.dart';
import 'package:presently/presentation/screens/gift_profiler/recommendation_results_screen.dart';

/// AI 분석 로딩 화면
/// 선물을 찾는 중 애니메이션 및 단계별 텍스트 표시
/// 애드몹 전면 광고 표시
class AiLoadingScreen extends StatefulWidget {
  final GiftProfile profile;

  const AiLoadingScreen({super.key, required this.profile});

  @override
  State<AiLoadingScreen> createState() => _AiLoadingScreenState();
}

class _AiLoadingScreenState extends State<AiLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  int _currentMessageIndex = 0;
  Timer? _messageTimer;

  // 애드몹 전면 광고
  InterstitialAd? _interstitialAd;
  bool _isAdLoaded = false;
  bool _isAdShown = false;

  @override
  void initState() {
    super.initState();

    // 펄스 애니메이션 설정
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // 메시지 순환 타이머
    _messageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _currentMessageIndex = (_currentMessageIndex + 1) % 3;
        });
      }
    });

    // 광고 로드 시작
    _loadInterstitialAd();

    // 3초 후 광고 표시 또는 결과 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _showAdOrNavigate();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _messageTimer?.cancel();
    _interstitialAd?.dispose();
    super.dispose();
  }

  /// 전면 광고 로드
  /// TODO: 실제 배포 시 AdConstants.useTestAds를 false로 설정
  void _loadInterstitialAd() {
    final adUnitId = Platform.isAndroid
        ? AdConstants.interstitialAdIdAndroid
        : AdConstants.interstitialAdIdIOS;

    InterstitialAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('전면 광고 로드 성공');
          _interstitialAd = ad;
          _isAdLoaded = true;

          // 광고 이벤트 리스너 설정
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {
                  debugPrint('전면 광고 표시됨');
                  _isAdShown = true;
                },
                onAdDismissedFullScreenContent: (ad) {
                  debugPrint('전면 광고 닫힘');
                  ad.dispose();
                  _navigateToResults();
                },
                onAdFailedToShowFullScreenContent: (ad, error) {
                  debugPrint('전면 광고 표시 실패: $error');
                  ad.dispose();
                  _navigateToResults();
                },
              );
        },
        onAdFailedToLoad: (error) {
          debugPrint('전면 광고 로드 실패: $error');
          _isAdLoaded = false;
        },
      ),
    );
  }

  /// 광고 표시 또는 바로 결과 화면으로 이동
  void _showAdOrNavigate() {
    if (_isAdLoaded && !_isAdShown && _interstitialAd != null) {
      // 광고 로드 성공 -> 광고 표시
      _interstitialAd!.show();
    } else {
      // 광고 로드 실패 또는 이미 표시됨 -> 바로 결과 화면으로
      _navigateToResults();
    }
  }

  /// 추천 결과 화면으로 이동
  void _navigateToResults() {
    // 더미 추천 데이터 생성
    final dummyRecommendations = _generateDummyRecommendations();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => RecommendationResultsScreen(
          profile: widget.profile,
          recommendations: dummyRecommendations,
        ),
      ),
    );
  }

  /// 더미 추천 데이터 생성 (향후 실제 AI 연동 시 대체)
  List<GiftRecommendation> _generateDummyRecommendations() {
    return [
      const GiftRecommendation(
        itemName: '스마트 인도어 허브 가든',
        reasoning:
            '기술을 좋아하시고 집에서 시간을 보내는 것을 즐기는 분께 딱 맞는 선물입니다. 자동 물 공급과 LED 조명으로 손쉽게 신선한 허브를 키울 수 있어요.',
        emotionalPitch: '새 집에 첨단 자연을 선물하세요.',
        searchKeyword: '스마트 실내 허브 가든',
        suggestedGreeting: '새 집 축하해! 집에서 함께 추억을 키워가자 🌱',
        estimatedPrice: 89000,
      ),
      const GiftRecommendation(
        itemName: '무선 노이즈 캔슬링 헤드폰',
        reasoning:
            '집에서 편안하게 음악이나 팟캐스트를 즐기기에 완벽한 선택입니다. 프리미엄 사운드 품질과 장시간 배터리로 최고의 청취 경험을 선사합니다.',
        emotionalPitch: '당신만의 평화로운 순간을 선물하세요.',
        searchKeyword: '무선 노이즈캔슬링 헤드폰',
        suggestedGreeting: '자신만의 시간을 즐기길 바라며 💙',
        estimatedPrice: 250000,
      ),
      const GiftRecommendation(
        itemName: '프리미엄 캔들 세트',
        reasoning:
            '미니멀한 취향을 가진 분께 어울리는 세련된 향초 세트입니다. 집들이 선물로 분위기를 더해줄 완벽한 아이템이에요.',
        emotionalPitch: '따뜻한 향기로 새로운 시작을 축하하세요.',
        searchKeyword: '프리미엄 향초 선물세트',
        suggestedGreeting: '새로운 보금자리에 따뜻함을 더하길 바라 🕯️',
        estimatedPrice: 45000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    final messages = [
      l10n.aiSearching,
      l10n.aiAnalyzingTaste,
      l10n.aiFindingPerfect,
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 펄스 애니메이션 아이콘
              ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (isDark ? AppColors.darkPrimary : AppColors.primary)
                        .withValues(alpha: 0.2),
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    size: 60,
                    color: isDark ? AppColors.darkPrimary : AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.xl),

              // AI 분석 중 텍스트
              Text(
                l10n.aiAnalyzing,
                style: AppTypography.heading1(
                  color: isDark
                      ? AppColors.darkOnBackground
                      : AppColors.lightOnBackground,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppSpacing.l),

              // 순환되는 메시지
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  messages[_currentMessageIndex],
                  key: ValueKey<int>(_currentMessageIndex),
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

              const SizedBox(height: AppSpacing.xl),

              // 로딩 인디케이터
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDark ? AppColors.darkPrimary : AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
