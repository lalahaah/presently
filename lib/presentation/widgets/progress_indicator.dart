import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_duration.dart';
import '../../core/constants/app_component_values.dart';

/// Progress Indicator 위젯
/// Design System Spec:
/// - Style: 상단 슬림한 라인 형태
/// - Motion: 부드러운 필링(Filling) 효과
/// - AI 분석 단계에서는 '펄스(Pulse)' 애니메이션 추가
class AppProgressIndicator extends StatelessWidget {
  final double progress; // 0.0 ~ 1.0
  final Color? color;
  final Color? backgroundColor;
  final double height;

  const AppProgressIndicator({
    super.key,
    required this.progress,
    this.color,
    this.backgroundColor,
    this.height = AppComponentValues.progressBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final progressColor =
        color ?? (isDark ? AppColors.darkPrimary : AppColors.primary);
    final bgColor =
        backgroundColor ??
        (isDark ? AppColors.darkSurface : AppColors.lightBorder);

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height / 2),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: bgColor,
          valueColor: AlwaysStoppedAnimation<Color>(progressColor),
        ),
      ),
    );
  }
}

/// Animated Progress Indicator with smooth filling effect
class AnimatedProgressIndicator extends StatefulWidget {
  final double targetProgress; // 0.0 ~ 1.0
  final Color? color;
  final Color? backgroundColor;
  final double height;
  final Duration duration;

  const AnimatedProgressIndicator({
    super.key,
    required this.targetProgress,
    this.color,
    this.backgroundColor,
    this.height = AppComponentValues.progressBarHeight,
    this.duration = AppDuration.progressFill,
  });

  @override
  State<AnimatedProgressIndicator> createState() =>
      _AnimatedProgressIndicatorState();
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(
      begin: 0.0,
      end: widget.targetProgress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(AnimatedProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetProgress != widget.targetProgress) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.targetProgress,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return AppProgressIndicator(
          progress: _animation.value,
          color: widget.color,
          backgroundColor: widget.backgroundColor,
          height: widget.height,
        );
      },
    );
  }
}

/// Pulsing Progress Indicator for AI analysis
/// Design System: AI 분석 단계에서 Pulse 애니메이션
class PulsingProgressIndicator extends StatefulWidget {
  final Color? color;
  final Color? backgroundColor;
  final double height;

  const PulsingProgressIndicator({
    super.key,
    this.color,
    this.backgroundColor,
    this.height = AppComponentValues.progressBarThick,
  });

  @override
  State<PulsingProgressIndicator> createState() =>
      _PulsingProgressIndicatorState();
}

class _PulsingProgressIndicatorState extends State<PulsingProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: AppDuration.pulse, vsync: this)
      ..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor =
        widget.color ?? (isDark ? AppColors.darkPrimary : AppColors.primary);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: widget.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.height / 2),
            child: LinearProgressIndicator(
              backgroundColor:
                  widget.backgroundColor ??
                  (isDark ? AppColors.darkSurface : AppColors.lightBorder),
              valueColor: AlwaysStoppedAnimation<Color>(
                baseColor.withValues(alpha: _animation.value),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Step Progress Indicator for multi-step flows
class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color? activeColor;
  final Color? inactiveColor;

  const StepProgressIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.activeColor,
    this.inactiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final active =
        activeColor ?? (isDark ? AppColors.darkPrimary : AppColors.primary);
    final inactive =
        inactiveColor ??
        (isDark ? AppColors.darkBorder : AppColors.lightBorder);

    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            height: AppComponentValues.progressBarHeight,
            margin: EdgeInsets.only(right: index < totalSteps - 1 ? 4 : 0),
            decoration: BoxDecoration(
              color: isActive ? active : inactive,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
