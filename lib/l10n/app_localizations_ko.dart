// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '프레젠틀리';

  @override
  String get navHome => '홈';

  @override
  String get navRecipients => '수령인';

  @override
  String get navSettings => '설정';

  @override
  String get findGift => '선물 찾기';

  @override
  String get homeGreeting => '안녕하세요! 👋';

  @override
  String get homeSubtitle => '오늘은 어떤 선물을 찾고 계신가요?';

  @override
  String get upcomingEvents => '다가오는 이벤트';

  @override
  String get seeAll => '모두 보기';

  @override
  String get noUpcomingEvents => '다가오는 이벤트가 없습니다';

  @override
  String get noUpcomingEventsDesc => '수령인을 추가하면 생일과 기념일을 여기서 확인할 수 있습니다';

  @override
  String get recentRecommendations => '최근 추천';

  @override
  String get noRecommendations => '아직 추천이 없습니다';

  @override
  String get noRecommendationsDesc => '선물을 찾아보시면 AI가 선별한 추천을 여기서 확인할 수 있습니다';

  @override
  String get adPlacement => '광고 영역';

  @override
  String get free => '무료';

  @override
  String get recipientsTitle => '수령인';

  @override
  String get noRecipientsYet => '아직 수령인이 없습니다';

  @override
  String get noRecipientsDesc =>
      '선물을 주고받는 사람들을 추가하여 취향, 다가오는 이벤트, 선물 기록을 관리하세요';

  @override
  String get addRecipient => '수령인 추가';

  @override
  String get addFirstRecipient => '첫 수령인 추가하기';

  @override
  String get settingsTitle => '설정';

  @override
  String get account => '계정';

  @override
  String get signInAnonymously => '익명으로 로그인';

  @override
  String get tapToSignIn => '테스트를 위해 로그인하기';

  @override
  String get userId => '사용자 ID';

  @override
  String get signOut => '로그아웃';

  @override
  String get subscription => '구독';

  @override
  String get goPro => 'Pro로 업그레이드';

  @override
  String get unlockAllFeatures => '모든 기능 잠금 해제';

  @override
  String get restorePurchase => '구매 복원';

  @override
  String get preferences => '환경설정';

  @override
  String get language => '언어';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get darkMode => '다크 모드';

  @override
  String get toggleDarkTheme => '다크 테마 전환';

  @override
  String get notifications => '알림';

  @override
  String get manageReminders => '리마인더 관리';

  @override
  String get legalAndSupport => '법적 고지 및 지원';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '서비스 약관';

  @override
  String get contactSupport => '고객 지원';

  @override
  String version(String version) {
    return '버전 $version';
  }

  @override
  String get giftProfilerComingSoon => '선물 추천 기능이 곧 제공됩니다!';

  @override
  String get goProComingSoon => 'Pro 업그레이드가 곧 제공됩니다!';

  @override
  String get addRecipientComingSoon => '수령인 추가 기능이 곧 제공됩니다!';

  @override
  String get themeChangeComingSoon => '테마 변경 기능은 향후 업데이트에서 지원될 예정입니다';

  @override
  String get notificationsComingSoon => '알림 기능이 곧 제공됩니다!';

  @override
  String errorPrefix(String error) {
    return '오류: $error';
  }

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get chooseLanguage => '언어 선택';

  @override
  String get giftProfiler => '선물 찾기';

  @override
  String get step => '단계';

  @override
  String stepOf(Object current, Object total) {
    return '$current / $total';
  }

  @override
  String get next => '다음';

  @override
  String get previous => '이전';

  @override
  String get analyzeAndFind => '선물 찾기 시작';

  @override
  String get step1Title => '누구를 위한 선물인가요?';

  @override
  String get step1Subtitle => '선물을 받을 분과의 관계를 선택해주세요';

  @override
  String get relationshipSpouse => '배우자';

  @override
  String get relationshipPartner => '연인';

  @override
  String get relationshipFriend => '친구';

  @override
  String get relationshipParent => '부모님';

  @override
  String get relationshipSibling => '형제/자매';

  @override
  String get relationshipChild => '자녀';

  @override
  String get relationshipColleague => '동료';

  @override
  String get relationshipBoss => '상사';

  @override
  String get relationshipTeacher => '선생님';

  @override
  String get relationshipOther => '기타';

  @override
  String get step2Title => '어떤 분이신가요?';

  @override
  String get step2Subtitle => '성격이나 취향을 선택해주세요 (최대 5개)';

  @override
  String get personalitySection => '성격 특성';

  @override
  String get mbtiSection => 'MBTI (선택사항)';

  @override
  String get selectMbti => 'MBTI 선택하기';

  @override
  String get traitTechie => '기술 애호가';

  @override
  String get traitMinimalist => '미니멀리스트';

  @override
  String get traitOutdoorsy => '아웃도어 매니아';

  @override
  String get traitArtistic => '예술적 감각';

  @override
  String get traitFoodie => '미식가';

  @override
  String get traitBookworm => '독서광';

  @override
  String get traitFitness => '운동 애호가';

  @override
  String get traitFashionable => '패셔니스타';

  @override
  String get traitHomebody => '집순이/집돌이';

  @override
  String get traitAdventurous => '모험을 즐김';

  @override
  String get traitEcoFriendly => '친환경주의자';

  @override
  String get traitPractical => '실용적';

  @override
  String get step3Title => '어떤 이벤트인가요?';

  @override
  String get step3Subtitle => '선물을 주는 이유를 알려주세요';

  @override
  String get occasionBirthday => '생일';

  @override
  String get occasionAnniversary => '기념일';

  @override
  String get occasionWedding => '결혼';

  @override
  String get occasionGraduation => '졸업';

  @override
  String get occasionPromotion => '승진';

  @override
  String get occasionHousewarming => '집들이';

  @override
  String get occasionApology => '사과';

  @override
  String get occasionThankYou => '감사';

  @override
  String get occasionJustBecause => '그냥';

  @override
  String get occasionOther => '기타';

  @override
  String get contextPlaceholder => '예: 최근 요가를 시작했어요';

  @override
  String get contextLabel => '추가 정보 (선택사항)';

  @override
  String get contextHint => '특별히 알려주고 싶은 사항이 있나요?';

  @override
  String get step4Title => '예산을 설정해주세요';

  @override
  String get step4Subtitle => '얼마 정도의 선물을 찾고 계신가요?';

  @override
  String budgetRange(Object max, Object min) {
    return '₩$min ~ ₩$max';
  }

  @override
  String budgetPlus(Object amount) {
    return '₩$amount+';
  }

  @override
  String get aiAnalyzing => 'AI가 선물을 찾는 중...';

  @override
  String get aiSearching => '쿠팡에서 1,000개 이상의 상품을 검색 중...';

  @override
  String get aiAnalyzingTaste => '수신자의 취향을 분석 중...';

  @override
  String get aiFindingPerfect => '완벽한 선물을 찾는 중...';

  @override
  String get recommendationsTitle => 'AI가 선별한 추천';

  @override
  String get recommendationsSubtitle => '마음에 드는 선물을 선택해보세요';

  @override
  String get viewOnCoupang => '쿠팡에서 보기';

  @override
  String get copyMessage => '메시지 복사';

  @override
  String get messageCopied => '메시지가 복사되었습니다!';

  @override
  String get giftMessage => '선물 메시지';

  @override
  String get aiReasoning => '추천 이유';

  @override
  String get estimatedPrice => '예상 가격';

  @override
  String get saveRecommendation => '추천 저장';

  @override
  String get tryAgain => '다시 찾기';
}
