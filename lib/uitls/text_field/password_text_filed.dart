import 'package:flutter/material.dart';

import '../../consts/colors.dart';
import 'defult_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {Key? key,
      this.lable,
      required this.hint,
      required this.passwordController,
      this.onVisibleButtonClick,
      this.isHidePassword = true,
      this.enableWarning = false,
      this.isActiveTextField = false,
      this.borderColor,
      this.onChanged,
      this.prefixIconData,
      this.padding,
      this.focusNode,
      this.widgetWarning,
      this.isValidatorCustom,
      this.onSubmitted})
      : super(key: key);
  final TextEditingController passwordController;

  final VoidCallback? onVisibleButtonClick;
  bool isHidePassword;
  bool enableWarning;
  bool isActiveTextField;
  final Widget? widgetWarning;
  final String? lable;
  final String hint;
  final Color? borderColor;
  bool Function(String)? isValidatorCustom;
  Function(String)? onChanged;
  ValueChanged<String>? onSubmitted;
  EdgeInsets? padding;
  final IconData? prefixIconData;
  final FocusNode? focusNode;

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidePassword = true;
  @override
  void initState() {
    isHidePassword = widget.isHidePassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        DefaultTextFormField(
          label: widget.lable,
          hint: widget.hint,
          focusNode: widget.focusNode,
          enableWarning: widget.enableWarning,
          widgetWarning: widget.widgetWarning,
          controller: widget.passwordController,
          obscureText: isHidePassword,
          borderColor: widget.borderColor,
          padding: widget.padding,
          isActiveTextField: widget.isActiveTextField,
          onChanged: widget.onChanged,
          isValidatorCustom: widget.isValidatorCustom,
          onSubmitted: widget.onSubmitted,
          keyboardType: TextInputType.visiblePassword,
        ),
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 20),
          onPressed: () {
            setState(() {
              isHidePassword = !isHidePassword;
            });
          },
          icon: isHidePassword
              ? Icon(
                  Icons.visibility_off,
                  color: Color(ColorCode.gray2),
                )
              : Icon(
                  Icons.remove_red_eye,
                  size: 18,
                  color: Color(ColorCode.gray2),
                ),
        )
      ],
    );
  }
}
