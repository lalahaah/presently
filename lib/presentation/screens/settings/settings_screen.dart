import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';

/// Settings Screen (Profile & Pro)
/// IA: Settings Module
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _darkMode = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _darkMode = Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text('Settings', style: AppTypography.heading1())),
      body: ListView(
        children: [
          // Account Section
          _buildSectionHeader('Account', isDark),
          _buildListTile(
            context,
            Icons.email_outlined,
            'Email',
            'Not signed in',
            isDark,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sign in coming soon!')),
              );
            },
          ),
          _buildListTile(
            context,
            Icons.logout,
            'Sign Out',
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),

          const Divider(),

          // Subscription Section
          _buildSectionHeader('Subscription', isDark),
          _buildListTile(
            context,
            Icons.workspace_premium,
            'Go Pro',
            'Unlock all features',
            isDark,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Go Pro coming soon!')),
              );
            },
          ),
          _buildListTile(
            context,
            Icons.restore,
            'Restore Purchase',
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),

          const Divider(),

          // Preferences Section
          _buildSectionHeader('Preferences', isDark),
          _buildSwitchTile(
            'Dark Mode',
            'Toggle dark theme',
            _darkMode,
            isDark,
            (value) {
              setState(() {
                _darkMode = value;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Theme change will be supported in future update',
                  ),
                ),
              );
            },
          ),
          _buildListTile(
            context,
            Icons.notifications_outlined,
            'Notifications',
            'Manage reminders',
            isDark,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications coming soon!')),
              );
            },
          ),

          const Divider(),

          // Legal & Support Section
          _buildSectionHeader('Legal & Support', isDark),
          _buildListTile(
            context,
            Icons.privacy_tip_outlined,
            'Privacy Policy',
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),
          _buildListTile(
            context,
            Icons.description_outlined,
            'Terms of Service',
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),
          _buildListTile(
            context,
            Icons.help_outline,
            'Contact Support',
            null,
            isDark,
            onTap: () {},
            enabled: false,
          ),

          const SizedBox(height: AppSpacing.l),

          // App Version
          Center(
            child: Text(
              'Version 0.1.0',
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
    VoidCallback? onTap,
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
