/// 애드몹 광고 관련 상수
class AdConstants {
  AdConstants._();

  /// 테스트 전면 광고 ID (Android)
  /// TODO: 실제 배포 시 AdMob에서 발급받은 ID로 교체
  static const String testInterstitialAdIdAndroid =
      'ca-app-pub-3940256099942544/1033173712';

  /// 테스트 전면 광고 ID (iOS)
  /// TODO: 실제 배포 시 AdMob에서 발급받은 ID로 교체
  static const String testInterstitialAdIdIOS =
      'ca-app-pub-3940256099942544/4411468910';

  /// 실제 전면 광고 ID (Android)
  /// TODO: AdMob 대시보드에서 발급받은 실제 광고 ID로 교체
  static const String productionInterstitialAdIdAndroid = 'YOUR_ANDROID_AD_ID';

  /// 실제 전면 광고 ID (iOS)
  /// TODO: AdMob 대시보드에서 발급받은 실제 광고 ID로 교체
  static const String productionInterstitialAdIdIOS = 'YOUR_IOS_AD_ID';

  /// 현재 사용 중인 광고 ID (플랫폼별)
  /// 테스트 모드: true -> 테스트 ID 사용
  /// 프로덕션 모드: false -> 실제 ID 사용
  static const bool useTestAds = true;

  /// Android 전면 광고 ID 가져오기
  static String get interstitialAdIdAndroid => useTestAds
      ? testInterstitialAdIdAndroid
      : productionInterstitialAdIdAndroid;

  /// iOS 전면 광고 ID 가져오기
  static String get interstitialAdIdIOS =>
      useTestAds ? testInterstitialAdIdIOS : productionInterstitialAdIdIOS;
}
