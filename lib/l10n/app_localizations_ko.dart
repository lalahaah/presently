// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => 'Presently';

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
}
