// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Presently';

  @override
  String get navHome => 'Home';

  @override
  String get navRecipients => 'Recipients';

  @override
  String get navSettings => 'Settings';

  @override
  String get findGift => 'Find a Gift';

  @override
  String get homeGreeting => 'Hello, there! 👋';

  @override
  String get homeSubtitle => 'What gift are you looking for today?';

  @override
  String get upcomingEvents => 'Upcoming Events';

  @override
  String get seeAll => 'See All';

  @override
  String get noUpcomingEvents => 'No upcoming events';

  @override
  String get noUpcomingEventsDesc =>
      'Add recipients to see their birthdays and anniversaries here';

  @override
  String get recentRecommendations => 'Recent Recommendations';

  @override
  String get noRecommendations => 'No recommendations yet';

  @override
  String get noRecommendationsDesc =>
      'Find a gift to see AI-curated recommendations here';

  @override
  String get adPlacement => 'Ad Placement';

  @override
  String get free => 'Free';

  @override
  String get recipientsTitle => 'Recipients';

  @override
  String get noRecipientsYet => 'No Recipients Yet';

  @override
  String get noRecipientsDesc =>
      'Add people you buy gifts for to keep track of their preferences, upcoming events, and gift history';

  @override
  String get addRecipient => 'Add Recipient';

  @override
  String get addFirstRecipient => 'Add Your First Recipient';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get account => 'Account';

  @override
  String get signInAnonymously => 'Sign In Anonymously';

  @override
  String get tapToSignIn => 'Tap to sign in for testing';

  @override
  String get userId => 'User ID';

  @override
  String get signOut => 'Sign Out';

  @override
  String get subscription => 'Subscription';

  @override
  String get goPro => 'Go Pro';

  @override
  String get unlockAllFeatures => 'Unlock all features';

  @override
  String get restorePurchase => 'Restore Purchase';

  @override
  String get preferences => 'Preferences';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get toggleDarkTheme => 'Toggle dark theme';

  @override
  String get notifications => 'Notifications';

  @override
  String get manageReminders => 'Manage reminders';

  @override
  String get legalAndSupport => 'Legal & Support';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get giftProfilerComingSoon => 'Gift Profiler coming soon!';

  @override
  String get goProComingSoon => 'Go Pro coming soon!';

  @override
  String get addRecipientComingSoon => 'Add Recipient coming soon!';

  @override
  String get themeChangeComingSoon =>
      'Theme change will be supported in future update';

  @override
  String get notificationsComingSoon => 'Notifications coming soon!';

  @override
  String errorPrefix(String error) {
    return 'Error: $error';
  }

  @override
  String get korean => '한국어';

  @override
  String get english => 'English';

  @override
  String get chooseLanguage => 'Choose Language';
}
