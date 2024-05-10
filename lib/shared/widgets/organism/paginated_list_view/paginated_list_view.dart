import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({
    super.key,
    required this.children,
    required this.onLoadNextPage,
    required this.isLastPage,
    this.padding,
  });

  final List<Widget> children;
  final VoidCallback onLoadNextPage;
  final bool isLastPage;
  final EdgeInsets? padding;

  @override
  State<PaginatedListView> createState() => _PaginatedListState();
}

class _PaginatedListState extends State<PaginatedListView> {
  final _scrollController = ScrollController();
  bool _isLoading = false;
  int _totalItems = 0;

  @override
  void initState() {
    _totalItems = widget.children.length;
    _scrollController.addListener(_onScrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _validateItems();
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.children.length + (_isLoading ? 1 : 0),
      padding: widget.padding,
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
    _scrollController.removeListener(_onScrollListener);
    super.dispose();
  }

  void _onScrollListener() {
    final position = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;
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
