import 'package:catbreeds/shared/widgets/atoms/icons/icons.dart';
import 'package:catbreeds/shared/widgets/atoms/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'search_input.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.counterStyle,
    this.title,
    this.hintText,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputFormatters,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
    this.onChanged,
    this.maxLines = 1,
    this.hintMaxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.inputTextStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.borderRadius,
    this.maxLength,
    this.minLines = 1,
    this.textAlign,
    this.showCounter = false,
    this.counterText,
    this.fillColor,
    this.filled,
    this.enabled = true,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.disabledBorder,
    this.errorBorder,
    this.errorStyle,
    this.isRequired,
    this.toolTipRequiredOptionalText,
    this.enabledBorder,
    this.focusedBorder,
    this.alignLabelWithHint = false,
    this.focusedErrorBorder,
    this.titleStyle,
    this.obscureText = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.errorText,
    this.cursorColor,
    this.border,
    this.textInputAction,
    this.onEditingComplete,
    this.onSave,
  });

  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final int? maxLength;
  final int? hintMaxLines;
  final TextAlign? textAlign;
  final bool? showCounter;
  final String? counterText;
  final Color? fillColor;
  final bool? filled;
  final bool enabled;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final TextAlignVertical? textAlignVertical;
  final InputBorder? disabledBorder;
  final TextStyle? errorStyle;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? cursorColor;
  final bool? isRequired;
  final String? toolTipRequiredOptionalText;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final bool? alignLabelWithHint;
  final TextStyle? titleStyle;
  final TextStyle? counterStyle;
  final bool obscureText;
  final EdgeInsets scrollPadding;
  final String? errorText;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String?>? onSave;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      enableSuggestions: false,
      autocorrect: false,
      obscureText: obscureText,
      initialValue: initialValue,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      enabled: enabled,
      textAlignVertical: textAlignVertical,
      inputFormatters: textInputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      autovalidateMode: autovalidateMode,
      style: inputTextStyle,
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly,
      scrollPadding: scrollPadding,
      onEditingComplete: onEditingComplete,
      onSaved: onSave,
      decoration: InputDecoration(
        errorText: errorText,
        errorMaxLines: 2,
        alignLabelWithHint: alignLabelWithHint,
        isDense: true,
        counterStyle: counterStyle,
        prefixIcon: prefixIcon,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        suffixIconConstraints: suffixIconConstraints,
        contentPadding: contentPadding,
        counterText: (showCounter ?? false) ? counterText : '',
        filled: filled ?? true,
        fillColor: fillColor,
        hintText: hintText,
        hintMaxLines: hintMaxLines,
        hintStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
        ).merge(hintTextStyle),
        border: border ??
            OutlineInputBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
              borderSide: BorderSide.none,
            ),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
              borderSide: BorderSide.none,
            ),
        errorBorder: errorBorder ??
            OutlineInputBorder(
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
            ),
        focusedErrorBorder: focusedErrorBorder,
        labelStyle: labelTextStyle ??
            TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: AppSpacing.md,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
        errorStyle: errorStyle,
      ),
    );
  }
}
