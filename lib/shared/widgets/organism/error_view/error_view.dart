import 'package:flutter/material.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIcon(
          Icons.error_outline_rounded,
          size: 55.0,
        ),
        const SpacingS(),
        TextHeading5(message),
      ],
    );
  }
}
