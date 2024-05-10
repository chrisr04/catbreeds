part of 'inputs.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onSubmit,
    this.hintText,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final String? hintText;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController _controller;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: _controller,
      focusNode: _focusNode,
      borderRadius: BorderRadius.zero,
      filled: true,
      fillColor: Theme.of(context).colorScheme.background,
      textAlignVertical: TextAlignVertical.center,
      hintText: widget.hintText,
      textInputAction: TextInputAction.search,
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide.none,
      ),
      suffixIcon: InkWell(
        onTap: () => _onSubmit(_controller.text),
        child: AppIcon(
          Icons.search,
          size: 24.0,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: _onSubmit,
    );
  }

  void _onSubmit(String value) {
    if (widget.onSubmit == null) return;
    _focusNode.unfocus();
    widget.onSubmit!(value);
  }
}
