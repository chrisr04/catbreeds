import 'package:flutter/material.dart';

class PaginatedSliverListView extends StatefulWidget {
  const PaginatedSliverListView({
    super.key,
    required this.children,
    required this.controller,
    required this.onLoadNextPage,
    required this.isLastPage,
  });

  final ScrollController controller;
  final List<Widget> children;
  final VoidCallback onLoadNextPage;
  final bool isLastPage;

  @override
  State<PaginatedSliverListView> createState() =>
      _PaginatedSliverListViewState();
}

class _PaginatedSliverListViewState extends State<PaginatedSliverListView> {
  bool _isLoading = false;
  int _totalItems = 0;

  @override
  void initState() {
    _totalItems = widget.children.length;
    widget.controller.addListener(_onScrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _validateItems();
    return SliverList.builder(
      itemCount: widget.children.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (_isLoading && index >= widget.children.length) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return widget.children[index];
      },
    );
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScrollListener);
    super.dispose();
  }

  void _onScrollListener() {
    final position = widget.controller.position.pixels;
    final maxScroll = widget.controller.position.maxScrollExtent;
    if (!_isLoading && !widget.isLastPage && position >= maxScroll * 0.8) {
      _isLoading = true;
      widget.onLoadNextPage();
    }
  }

  void _validateItems() {
    if (_totalItems != widget.children.length || widget.isLastPage) {
      _isLoading = false;
      _totalItems = widget.children.length;
    }
  }
}
