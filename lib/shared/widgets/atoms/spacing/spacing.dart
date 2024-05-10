import 'package:flutter/material.dart';

class SpacingXXS extends StatelessWidget {
  const SpacingXXS({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.xxs,
    );
  }
}

class SpacingXS extends StatelessWidget {
  const SpacingXS({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.xs,
    );
  }
}

class SpacingS extends StatelessWidget {
  const SpacingS({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.sm,
    );
  }
}

class SpacingM extends StatelessWidget {
  const SpacingM({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.md,
    );
  }
}

class SpacingL extends StatelessWidget {
  const SpacingL({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.lg,
    );
  }
}

class SpacingXL extends StatelessWidget {
  const SpacingXL({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.xl,
    );
  }
}

class SpacingXXL extends StatelessWidget {
  const SpacingXXL({super.key, this.axis});

  final SpacingAxis? axis;

  @override
  Widget build(BuildContext context) {
    return _Spacing(
      axis: axis,
      value: AppSpacing.xxl,
    );
  }
}

class _Spacing extends StatelessWidget {
  const _Spacing({
    this.axis = SpacingAxis.y,
    required this.value,
  });

  final SpacingAxis? axis;
  final double value;

  @override
  Widget build(BuildContext context) {
    return switch (axis) {
      SpacingAxis.x => SizedBox(width: value),
      _ => SizedBox(height: value),
    };
  }
}

enum SpacingAxis { x, y }

class AppSpacing {
  ///zero = 0.0
  static const double zero = 0.0;

  ///xxs = 2.0
  static const double xxs = 2.0;

  ///xs = 4.0
  static const double xs = 4.0;

  ///sm = 8.0
  static const double sm = 8.0;

  ///sL = 12.0
  static const double sl = 12.0;

  ///md = 16.0
  static const double md = 16.0;

  ///lg = 24.0
  static const double lg = 24.0;

  ///xl = 32.0
  static const double xl = 32.0;

  ///xxl = 48.0
  static const double xxl = 48.0;
}
