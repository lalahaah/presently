import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/core/providers/firebase_providers.dart';
import 'package:presently/core/providers/locale_provider.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Settings Screen (Profile & Pro)
/// IA: Settings Module
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _darkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _darkMode = Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final userAsync = ref.watch(authStateChangesProvider);
    final user = userAsync.value;
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle, style: AppTypography.heading1()),
      ),
      body: ListView(
        children: [
          // Account Section
          _buildSectionHeader(l10n.account, isDark),
          if (user == null)
            _buildListTile(
              context,
              Icons.login,
              l10n.signInAnonymously,
              l10n.tapToSignIn,
              isDark,
              onTap: () async {
                try {
                  await ref.read(firebaseAuthProvider).signInAnonymously();
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          l10n.errorPrefix(e.toString()),
                        ),
                      ),
                    );
                  }
                }
              },
            )
          else ...{
            _buildListTile(
              context,
              Icons.account_circle,
              l10n.userId,
              user.uid,
              isDark,
              onTap: () {}, // Copy to clipboard?
            ),
            _buildListTile(
              context,
              Icons.logout,
              l10n.signOut,
              null,
              isDark,
              onTap: () async {
                await ref.read(firebaseAuthProvider).signOut();
              },
            ),
          },

          const Divider(),

          // Subscription Section
          _buildSectionHeader(l10n.subscription, isDark),
          _buildListTile(
            context,
            Icons.workspace_premium,
            l10n.goPro,
            l10n.unlockAllFeatures,
            isDark,
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.goProComingSoon)));
            },
          ),
          _buildListTile(
            context,
            Icons.restore,
            l10n.restorePurchase,
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),

          const Divider(),

          // Preferences Section
          _buildSectionHeader(l10n.preferences, isDark),

          // Language Setting
          _buildListTile(
            context,
            Icons.language,
            l10n.language,
            currentLocale.languageCode == 'ko' ? l10n.korean : l10n.english,
            isDark,
            onTap: () => _showLanguageDialog(context, l10n),
          ),

          _buildSwitchTile(
            l10n.darkMode,
            l10n.toggleDarkTheme,
            _darkMode,
            isDark,
            (value) {
              setState(() {
                _darkMode = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.themeChangeComingSoon)),
              );
            },
          ),
          _buildListTile(
            context,
            Icons.notifications_outlined,
            l10n.notifications,
            l10n.manageReminders,
            isDark,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.notificationsComingSoon)),
              );
            },
          ),

          const Divider(),

          // Legal & Support Section
          _buildSectionHeader(l10n.legalAndSupport, isDark),
          _buildListTile(
            context,
            Icons.privacy_tip_outlined,
            l10n.privacyPolicy,
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),
          _buildListTile(
            context,
            Icons.description_outlined,
            l10n.termsOfService,
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),
          _buildListTile(
            context,
            Icons.help_outline,
            l10n.contactSupport,
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),

          const SizedBox(height: AppSpacing.l),

          // App Version
          Center(
            child: Text(
              l10n.version('0.1.0'),
              style: AppTypography.caption(
                color:
                    (isDark
                            ? AppColors.darkOnSurface
                            : AppColors.lightOnSurface)
                        .withValues(alpha: 0.5),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.l),
        ],
      ),
    );
  }

  /// 언어 선택 다이얼로그 표시
  void _showLanguageDialog(BuildContext context, AppLocalizations l10n) {
    final currentLocale = ref.read(localeProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(l10n.chooseLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text(l10n.korean),
                value: 'ko',
                groupValue: currentLocale.languageCode,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(localeProvider.notifier).setKorean();
                    Navigator.of(context).pop();
                  }
                },
              ),
              RadioListTile<String>(
                title: Text(l10n.english),
                value: 'en',
                groupValue: currentLocale.languageCode,
                onChanged: (value) {
                  if (value != null) {
                    ref.read(localeProvider.notifier).setEnglish();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.l,
        AppSpacing.l,
        AppSpacing.l,
        AppSpacing.s,
      ),
      child: Text(
        title,
        style: AppTypography.bodyMedium(
          color: isDark ? AppColors.darkPrimary : AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    String? subtitle,
    bool isDark, {
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: enabled
            ? (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
            : AppColors.disabled,
      ),
      title: Text(
        title,
        style: AppTypography.body(
          color: enabled
              ? (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
              : AppColors.disabled,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: AppTypography.bodySmall(
                color:
                    (isDark
                            ? AppColors.darkOnSurface
                            : AppColors.lightOnSurface)
                        .withValues(alpha: 0.7),
              ),
            )
          : null,
      trailing: enabled ? const Icon(Icons.chevron_right) : null,
      onTap: enabled ? onTap : null,
      enabled: enabled,
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    bool isDark,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      secondary: Icon(
        value ? Icons.dark_mode : Icons.light_mode,
        color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
      ),
      title: Text(
        title,
        style: AppTypography.body(
          color: isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.bodySmall(
          color: (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
              .withValues(alpha: 0.7),
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
