import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'Presently'**
  String get appTitle;

  /// Bottom navigation label for Home tab
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// Bottom navigation label for Recipients tab
  ///
  /// In en, this message translates to:
  /// **'Recipients'**
  String get navRecipients;

  /// Bottom navigation label for Settings tab
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// Button text for finding a gift
  ///
  /// In en, this message translates to:
  /// **'Find a Gift'**
  String get findGift;

  /// Greeting message on home screen
  ///
  /// In en, this message translates to:
  /// **'Hello, there! 👋'**
  String get homeGreeting;

  /// Subtitle on home screen
  ///
  /// In en, this message translates to:
  /// **'What gift are you looking for today?'**
  String get homeSubtitle;

  /// Section title for upcoming events
  ///
  /// In en, this message translates to:
  /// **'Upcoming Events'**
  String get upcomingEvents;

  /// Button text to see all items
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// Empty state title for upcoming events
  ///
  /// In en, this message translates to:
  /// **'No upcoming events'**
  String get noUpcomingEvents;

  /// Empty state description for upcoming events
  ///
  /// In en, this message translates to:
  /// **'Add recipients to see their birthdays and anniversaries here'**
  String get noUpcomingEventsDesc;

  /// Section title for recent recommendations
  ///
  /// In en, this message translates to:
  /// **'Recent Recommendations'**
  String get recentRecommendations;

  /// Empty state title for recommendations
  ///
  /// In en, this message translates to:
  /// **'No recommendations yet'**
  String get noRecommendations;

  /// Empty state description for recommendations
  ///
  /// In en, this message translates to:
  /// **'Find a gift to see AI-curated recommendations here'**
  String get noRecommendationsDesc;

  /// Placeholder text for ad placement
  ///
  /// In en, this message translates to:
  /// **'Ad Placement'**
  String get adPlacement;

  /// Free tier badge label
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// Recipients screen title
  ///
  /// In en, this message translates to:
  /// **'Recipients'**
  String get recipientsTitle;

  /// Empty state title for recipients
  ///
  /// In en, this message translates to:
  /// **'No Recipients Yet'**
  String get noRecipientsYet;

  /// Empty state description for recipients
  ///
  /// In en, this message translates to:
  /// **'Add people you buy gifts for to keep track of their preferences, upcoming events, and gift history'**
  String get noRecipientsDesc;

  /// Button text to add a recipient
  ///
  /// In en, this message translates to:
  /// **'Add Recipient'**
  String get addRecipient;

  /// Button text to add first recipient
  ///
  /// In en, this message translates to:
  /// **'Add Your First Recipient'**
  String get addFirstRecipient;

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Account section header
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Sign in anonymously button text
  ///
  /// In en, this message translates to:
  /// **'Sign In Anonymously'**
  String get signInAnonymously;

  /// Sign in subtitle
  ///
  /// In en, this message translates to:
  /// **'Tap to sign in for testing'**
  String get tapToSignIn;

  /// User ID label
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// Sign out button text
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Subscription section header
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// Go Pro button text
  ///
  /// In en, this message translates to:
  /// **'Go Pro'**
  String get goPro;

  /// Go Pro subtitle
  ///
  /// In en, this message translates to:
  /// **'Unlock all features'**
  String get unlockAllFeatures;

  /// Restore purchase button text
  ///
  /// In en, this message translates to:
  /// **'Restore Purchase'**
  String get restorePurchase;

  /// Preferences section header
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// Language setting label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Language setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// Dark mode switch label
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Dark mode switch subtitle
  ///
  /// In en, this message translates to:
  /// **'Toggle dark theme'**
  String get toggleDarkTheme;

  /// Notifications setting label
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Notifications setting subtitle
  ///
  /// In en, this message translates to:
  /// **'Manage reminders'**
  String get manageReminders;

  /// Legal and support section header
  ///
  /// In en, this message translates to:
  /// **'Legal & Support'**
  String get legalAndSupport;

  /// Privacy policy label
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Terms of service label
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Contact support label
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// App version label
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(String version);

  /// Snackbar message for gift profiler
  ///
  /// In en, this message translates to:
  /// **'Gift Profiler coming soon!'**
  String get giftProfilerComingSoon;

  /// Snackbar message for go pro
  ///
  /// In en, this message translates to:
  /// **'Go Pro coming soon!'**
  String get goProComingSoon;

  /// Snackbar message for add recipient
  ///
  /// In en, this message translates to:
  /// **'Add Recipient coming soon!'**
  String get addRecipientComingSoon;

  /// Snackbar message for theme change
  ///
  /// In en, this message translates to:
  /// **'Theme change will be supported in future update'**
  String get themeChangeComingSoon;

  /// Snackbar message for notifications
  ///
  /// In en, this message translates to:
  /// **'Notifications coming soon!'**
  String get notificationsComingSoon;

  /// Error message prefix
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorPrefix(String error);

  /// Korean language name
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get korean;

  /// English language name
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Language selection dialog title
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @giftProfiler.
  ///
  /// In en, this message translates to:
  /// **'Gift Profiler'**
  String get giftProfiler;

  /// No description provided for @step.
  ///
  /// In en, this message translates to:
  /// **'Step'**
  String get step;

  /// No description provided for @stepOf.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String stepOf(Object current, Object total);

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @analyzeAndFind.
  ///
  /// In en, this message translates to:
  /// **'Find Gifts'**
  String get analyzeAndFind;

  /// No description provided for @step1Title.
  ///
  /// In en, this message translates to:
  /// **'Who is this gift for?'**
  String get step1Title;

  /// No description provided for @step1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select your relationship with the recipient'**
  String get step1Subtitle;

  /// No description provided for @relationshipSpouse.
  ///
  /// In en, this message translates to:
  /// **'Spouse'**
  String get relationshipSpouse;

  /// No description provided for @relationshipPartner.
  ///
  /// In en, this message translates to:
  /// **'Partner'**
  String get relationshipPartner;

  /// No description provided for @relationshipFriend.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get relationshipFriend;

  /// No description provided for @relationshipParent.
  ///
  /// In en, this message translates to:
  /// **'Parent'**
  String get relationshipParent;

  /// No description provided for @relationshipSibling.
  ///
  /// In en, this message translates to:
  /// **'Sibling'**
  String get relationshipSibling;

  /// No description provided for @relationshipChild.
  ///
  /// In en, this message translates to:
  /// **'Child'**
  String get relationshipChild;

  /// No description provided for @relationshipColleague.
  ///
  /// In en, this message translates to:
  /// **'Colleague'**
  String get relationshipColleague;

  /// No description provided for @relationshipBoss.
  ///
  /// In en, this message translates to:
  /// **'Boss'**
  String get relationshipBoss;

  /// No description provided for @relationshipTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get relationshipTeacher;

  /// No description provided for @relationshipOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get relationshipOther;

  /// No description provided for @step2Title.
  ///
  /// In en, this message translates to:
  /// **'What are they like?'**
  String get step2Title;

  /// No description provided for @step2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Select personality traits (up to 5)'**
  String get step2Subtitle;

  /// No description provided for @personalitySection.
  ///
  /// In en, this message translates to:
  /// **'Personality Traits'**
  String get personalitySection;

  /// No description provided for @mbtiSection.
  ///
  /// In en, this message translates to:
  /// **'MBTI (Optional)'**
  String get mbtiSection;

  /// No description provided for @selectMbti.
  ///
  /// In en, this message translates to:
  /// **'Select MBTI'**
  String get selectMbti;

  /// No description provided for @traitTechie.
  ///
  /// In en, this message translates to:
  /// **'Techie'**
  String get traitTechie;

  /// No description provided for @traitMinimalist.
  ///
  /// In en, this message translates to:
  /// **'Minimalist'**
  String get traitMinimalist;

  /// No description provided for @traitOutdoorsy.
  ///
  /// In en, this message translates to:
  /// **'Outdoorsy'**
  String get traitOutdoorsy;

  /// No description provided for @traitArtistic.
  ///
  /// In en, this message translates to:
  /// **'Artistic'**
  String get traitArtistic;

  /// No description provided for @traitFoodie.
  ///
  /// In en, this message translates to:
  /// **'Foodie'**
  String get traitFoodie;

  /// No description provided for @traitBookworm.
  ///
  /// In en, this message translates to:
  /// **'Bookworm'**
  String get traitBookworm;

  /// No description provided for @traitFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness Enthusiast'**
  String get traitFitness;

  /// No description provided for @traitFashionable.
  ///
  /// In en, this message translates to:
  /// **'Fashionable'**
  String get traitFashionable;

  /// No description provided for @traitHomebody.
  ///
  /// In en, this message translates to:
  /// **'Homebody'**
  String get traitHomebody;

  /// No description provided for @traitAdventurous.
  ///
  /// In en, this message translates to:
  /// **'Adventurous'**
  String get traitAdventurous;

  /// No description provided for @traitEcoFriendly.
  ///
  /// In en, this message translates to:
  /// **'Eco-Friendly'**
  String get traitEcoFriendly;

  /// No description provided for @traitPractical.
  ///
  /// In en, this message translates to:
  /// **'Practical'**
  String get traitPractical;

  /// No description provided for @step3Title.
  ///
  /// In en, this message translates to:
  /// **'What\'s the occasion?'**
  String get step3Title;

  /// No description provided for @step3Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us why you\'re giving this gift'**
  String get step3Subtitle;

  /// No description provided for @occasionBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get occasionBirthday;

  /// No description provided for @occasionAnniversary.
  ///
  /// In en, this message translates to:
  /// **'Anniversary'**
  String get occasionAnniversary;

  /// No description provided for @occasionWedding.
  ///
  /// In en, this message translates to:
  /// **'Wedding'**
  String get occasionWedding;

  /// No description provided for @occasionGraduation.
  ///
  /// In en, this message translates to:
  /// **'Graduation'**
  String get occasionGraduation;

  /// No description provided for @occasionPromotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get occasionPromotion;

  /// No description provided for @occasionHousewarming.
  ///
  /// In en, this message translates to:
  /// **'Housewarming'**
  String get occasionHousewarming;

  /// No description provided for @occasionApology.
  ///
  /// In en, this message translates to:
  /// **'Apology'**
  String get occasionApology;

  /// No description provided for @occasionThankYou.
  ///
  /// In en, this message translates to:
  /// **'Thank You'**
  String get occasionThankYou;

  /// No description provided for @occasionJustBecause.
  ///
  /// In en, this message translates to:
  /// **'Just Because'**
  String get occasionJustBecause;

  /// No description provided for @occasionOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get occasionOther;

  /// No description provided for @contextPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'e.g., Recently started yoga'**
  String get contextPlaceholder;

  /// No description provided for @contextLabel.
  ///
  /// In en, this message translates to:
  /// **'Additional Context (Optional)'**
  String get contextLabel;

  /// No description provided for @contextHint.
  ///
  /// In en, this message translates to:
  /// **'Anything special you\'d like us to know?'**
  String get contextHint;

  /// No description provided for @step4Title.
  ///
  /// In en, this message translates to:
  /// **'Set your budget'**
  String get step4Title;

  /// No description provided for @step4Subtitle.
  ///
  /// In en, this message translates to:
  /// **'How much are you looking to spend?'**
  String get step4Subtitle;

  /// No description provided for @budgetRange.
  ///
  /// In en, this message translates to:
  /// **'₩{min} ~ ₩{max}'**
  String budgetRange(Object max, Object min);

  /// No description provided for @budgetPlus.
  ///
  /// In en, this message translates to:
  /// **'₩{amount}+'**
  String budgetPlus(Object amount);

  /// No description provided for @aiAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'AI is finding gifts...'**
  String get aiAnalyzing;

  /// No description provided for @aiSearching.
  ///
  /// In en, this message translates to:
  /// **'Searching 1,000+ items on Coupang...'**
  String get aiSearching;

  /// No description provided for @aiAnalyzingTaste.
  ///
  /// In en, this message translates to:
  /// **'Analyzing recipient\'s taste...'**
  String get aiAnalyzingTaste;

  /// No description provided for @aiFindingPerfect.
  ///
  /// In en, this message translates to:
  /// **'Finding the perfect gift...'**
  String get aiFindingPerfect;

  /// No description provided for @recommendationsTitle.
  ///
  /// In en, this message translates to:
  /// **'AI-Curated Recommendations'**
  String get recommendationsTitle;

  /// No description provided for @recommendationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a gift you like'**
  String get recommendationsSubtitle;

  /// No description provided for @viewOnCoupang.
  ///
  /// In en, this message translates to:
  /// **'View on Coupang'**
  String get viewOnCoupang;

  /// No description provided for @copyMessage.
  ///
  /// In en, this message translates to:
  /// **'Copy Message'**
  String get copyMessage;

  /// No description provided for @messageCopied.
  ///
  /// In en, this message translates to:
  /// **'Message copied!'**
  String get messageCopied;

  /// No description provided for @giftMessage.
  ///
  /// In en, this message translates to:
  /// **'Gift Message'**
  String get giftMessage;

  /// No description provided for @aiReasoning.
  ///
  /// In en, this message translates to:
  /// **'Why this gift'**
  String get aiReasoning;

  /// No description provided for @estimatedPrice.
  ///
  /// In en, this message translates to:
  /// **'Estimated Price'**
  String get estimatedPrice;

  /// No description provided for @saveRecommendation.
  ///
  /// In en, this message translates to:
  /// **'Save Recommendation'**
  String get saveRecommendation;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
