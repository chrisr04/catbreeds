part of '../page.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverPersistentHeader(
      pinned: true,
      delegate: HomeHeaderDelegate(),
    );
  }
}

class HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  const HomeHeaderDelegate();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = 1 - (shrinkOffset / maxExtent);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20.0),
        ),
      ),
      child: Stack(
        children: [
          AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: progress,
            child: const HomeHeaderLogo(),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: HomeSearchBar(),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 110.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
