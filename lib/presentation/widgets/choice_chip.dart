import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_radius.dart';
import '../../core/constants/app_elevation.dart';
import '../../core/constants/app_duration.dart';
import '../../core/constants/app_component_values.dart';

/// Choice Chip 위젯
/// Design System Spec:
/// - Default: White background, 1px Border (#E0E0E0), Round 20px
/// - Selected: Primary (#D4AF37) background, White text, Elevation shadow
/// - Interaction: 클릭 시 미세한 햅틱 반응 및 크기 변화(Scale down 0.95)
class AppChoiceChip extends StatefulWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;
  final Widget? avatar;
  final bool enabled;

  const AppChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.avatar,
    this.enabled = true,
  });

  @override
  State<AppChoiceChip> createState() => _AppChoiceChipState();
}

class _AppChoiceChipState extends State<AppChoiceChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppDuration.choiceChipPress,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: AppComponentValues.choiceChipPressScale,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.enabled) return;
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.enabled) return;
    _controller.reverse();
  }

  void _handleTapCancel() {
    if (!widget.enabled) return;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.enabled
          ? () => widget.onSelected?.call(!widget.selected)
          : null,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: AppDuration.short,
          curve: Curves.easeInOut,
          height: AppComponentValues.choiceChipHeight,
          constraints: BoxConstraints(
            minWidth: AppComponentValues.choiceChipMinWidth,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.selected
                ? (isDark ? AppColors.darkPrimary : AppColors.primary)
                : (isDark ? AppColors.darkSurface : Colors.white),
            borderRadius: AppRadius.choiceChipRadius,
            border: Border.all(
              color: widget.selected
                  ? Colors.transparent
                  : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
              width: AppComponentValues.choiceChipBorderWidth,
            ),
            boxShadow: widget.selected
                ? [
                    BoxShadow(
                      color:
                          (isDark ? AppColors.darkPrimary : AppColors.primary)
                              .withValues(alpha: 0.3),
                      blurRadius: AppElevation.choiceChipSelected,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.avatar != null) ...[
                widget.avatar!,
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: AppTypography.bodySmall(
                  color: widget.selected
                      ? (isDark
                            ? AppColors.darkOnPrimary
                            : AppColors.lightOnPrimary)
                      : (isDark
                            ? AppColors.darkOnSurface
                            : AppColors.lightOnSurface),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Choice Chip 리스트 래퍼
class AppChoiceChipList extends StatelessWidget {
  final List<String> options;
  final List<String> selectedOptions;
  final ValueChanged<List<String>>? onSelectionChanged;
  final bool multiSelect;
  final EdgeInsets? padding;
  final double spacing;
  final double runSpacing;

  const AppChoiceChipList({
    super.key,
    required this.options,
    required this.selectedOptions,
    this.onSelectionChanged,
    this.multiSelect = true,
    this.padding,
    this.spacing = 8.0,
    this.runSpacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: options.map((option) {
          final isSelected = selectedOptions.contains(option);
          return AppChoiceChip(
            label: option,
            selected: isSelected,
            onSelected: (selected) {
              if (multiSelect) {
                final newSelection = List<String>.from(selectedOptions);
                if (selected) {
                  newSelection.add(option);
                } else {
                  newSelection.remove(option);
                }
                onSelectionChanged?.call(newSelection);
              } else {
                onSelectionChanged?.call(selected ? [option] : []);
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
