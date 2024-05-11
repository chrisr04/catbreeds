part of '../page.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextHeading5(
        AppStrings.noResultFound,
      ),
    );
  }
}
