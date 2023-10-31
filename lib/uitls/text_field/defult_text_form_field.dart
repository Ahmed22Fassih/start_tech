import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_task/consts/colors.dart';

import '../../consts/text_style.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    Key? key,
    this.label,
    this.titleStyle,
    this.hint,
    this.minLines = 1,
    this.keyboardType,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
    required this.controller,
    this.padding,
    this.prefixIconData,
    this.prefixIconSize,
    this.suffixIcon,
    this.contentPadding,
    this.enableCountryCode = false,
    this.actions = const SizedBox(),
    this.obscureText = false,
    this.labelPadding,
    this.widgetWarning,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.enableWarning = false,
    this.borderColor,
    this.fillColor,
    this.prefixActiveIconColor,
    this.isActiveTextField = false,
    this.isDynamicActiveTextField = false,
    this.onTap,
    this.onSubmitted,
    this.border,
    this.isValidatorCustom,
  }) : super(key: key);

  final String? label;
  final int minLines;
  final int? maxLength;
  final EdgeInsets? padding;
  final EdgeInsets? labelPadding;
  final String? hint;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;

  // show message warning when user focus
  final bool enableWarning;

  // widgets appear in bottom of text filed
  // after widgets is focus

  final Widget? widgetWarning;

  final bool enableCountryCode;
  bool isActiveTextField;
  bool isDynamicActiveTextField;
  final bool obscureText;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool Function(String)? isValidatorCustom;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? titleStyle;
  final BoxBorder? border;
  final Widget actions;
  final IconData? prefixIconData;
  final double? prefixIconSize;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Color? prefixActiveIconColor;
  final Color? fillColor;

  @override
  _DefaultTextFormFieldState createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  /// this value desc if the current widgets is Focus and text not empty

  bool isFocus = false;

  ///check if valid depend on method widgets.isValidatorCustom
  bool isValid = false;
  bool isActiveTextField = false;

  @override
  void initState() {
    isActiveTextField = widget.isActiveTextField;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        setState(() {
          isActiveTextField = focus || (widget.controller.text.isNotEmpty);
          isFocus = focus;
        });
      },
      focusNode: widget.focusNode,
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
                controller: widget.controller,
                inputFormatters: widget.inputFormatters,
                minLines: widget.minLines,
                maxLines: widget.obscureText ? 1 : null,
                enabled: widget.enabled,
                maxLength: widget.maxLength,
                readOnly: widget.readOnly,
                textAlignVertical: TextAlignVertical.center,
                obscureText: widget.obscureText,
                onTap: widget.onTap,
                keyboardType: widget.keyboardType ?? TextInputType.text,
                autovalidateMode: AutovalidateMode.always,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: "",
                  suffixIcon: isValid
                      ? widget.suffixIcon
                      : (widget.isValidatorCustom == null
                          ? widget.suffixIcon
                          : null),
                  hintText: widget.hint,
                  hintStyle: TextStyles.textSemiBold
                      .copyWith(color: Color(ColorCode.gray2), fontSize: 20.sp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isActiveTextField ||
                              widget.isDynamicActiveTextField
                          ? widget.borderColor ?? const Color(ColorCode.gray)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(horizontal: 2),
                  filled: true,
                  fillColor: const Color(ColorCode.white),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isActiveTextField ||
                              widget.isDynamicActiveTextField
                          ? widget.borderColor ?? const Color(ColorCode.gray)
                          : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: isActiveTextField ||
                              widget.isDynamicActiveTextField
                          ? widget.borderColor ?? const Color(ColorCode.gray)
                          : Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: widget.borderColor ?? const Color(ColorCode.gray2),
                      width: 1.5,
                    ),
                  ),
                ),
                onFieldSubmitted: widget.onSubmitted,
                onChanged: (text) {
                  if (widget.isValidatorCustom != null) {
                    setState(() {
                      isValid = widget.isValidatorCustom!(text);
                    });
                  }
                  widget.onChanged?.call(text);
                }),
          ],
        ),
      ),
    );
  }
}
