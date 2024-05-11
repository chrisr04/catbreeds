import 'package:flutter/material.dart';
import 'package:catbreeds/core/core.dart';
import 'package:catbreeds/domain/domain.dart';
import 'package:catbreeds/shared/values/assets.dart';
import 'package:catbreeds/shared/values/strings.dart';
import 'package:catbreeds/shared/widgets/widgets.dart';
import 'package:catbreeds/ui/home/bloc/home_bloc.dart';

part 'widgets/search_bar.dart';
part 'widgets/cat_breed_list.dart';
part 'widgets/no_result.dart';
part 'widgets/header.dart';
part 'widgets/header_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _homeBloc = HomeBlocDependency.of(context);
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeBloc.events.add(
        const LoadCatBreedsEvent(
          page: 0,
          limit: 10,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const HomeHeader(),
          HomeCatBreedList(
            scrollController: scrollController,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _homeBloc.dispose();
    super.dispose();
  }
}
