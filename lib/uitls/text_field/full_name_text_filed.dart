import 'package:flutter/material.dart';

import 'defult_text_form_field.dart';

class FullNameTextField extends DefaultTextFormField {
  FullNameTextField({
    Key? key,
    String? title,
    String? hint,
    TextInputType? keyboardType,
    Function(String)? onChanged,
    Icon? suffixIcon,
    EdgeInsets? padding,
    IconData? prefixIcon,
    bool isActiveTextField = false,
    Color? borderColor,
    bool Function(String)? isValidatorCustom,
    required TextEditingController controller,
  }) : super(
            key: key,
            controller: controller,
            label: title,
            keyboardType: keyboardType,
            hint: hint,
            inputFormatters: [],
            isActiveTextField: isActiveTextField,
            padding: padding,
            borderColor: borderColor,
            suffixIcon: suffixIcon,
            prefixIconData: prefixIcon,
            onChanged: onChanged,
            isValidatorCustom: isValidatorCustom);
}
