import 'package:flutter/material.dart';
import 'package:presently/core/theme/app_colors.dart';
import 'package:presently/core/theme/app_typography.dart';
import 'package:presently/core/constants/app_spacing.dart';
import 'package:presently/l10n/app_localizations.dart';

/// Recipients Screen (Gift CRM)
/// IA: Recipients Module
class RecipientsScreen extends StatelessWidget {
  const RecipientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.recipientsTitle, style: AppTypography.heading1()),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: _buildEmptyState(context, isDark),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to Add Recipient
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.addRecipientComingSoon)));
        },
        icon: const Icon(Icons.person_add),
        label: Text(l10n.addRecipient),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 120,
              color:
                  (isDark ? AppColors.darkOnSurface : AppColors.lightOnSurface)
                      .withValues(alpha: 0.2),
            ),
            const SizedBox(height: AppSpacing.l),
            Text(
              l10n.noRecipientsYet,
              style: AppTypography.heading2(
                color: isDark
                    ? AppColors.darkOnSurface
                    : AppColors.lightOnSurface,
              ),
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              l10n.noRecipientsDesc,
              style: AppTypography.body(
                color:
                    (isDark
                            ? AppColors.darkOnSurface
                            : AppColors.lightOnSurface)
                        .withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.addRecipientComingSoon)),
                );
              },
              icon: const Icon(Icons.person_add),
              label: Text(l10n.addFirstRecipient),
            ),
          ],
        ),
      ),
    );
  }
}
