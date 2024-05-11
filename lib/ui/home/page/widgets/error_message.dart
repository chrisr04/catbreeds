part of '../page.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});

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
