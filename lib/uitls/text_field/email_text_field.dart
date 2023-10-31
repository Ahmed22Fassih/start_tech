import 'package:flutter/material.dart';

import 'defult_text_form_field.dart';

class EmailTextField extends DefaultTextFormField {
  EmailTextField({
    Key? key,
    String? title,
    String? hint,
    TextInputType? keyboardType,
    Function(String)? onChanged,
    Icon? suffixIcon,
    EdgeInsets? padding,
    IconData? prefixIcon,
    Color? borderColor,
    Color? fillColor,
    Color? prefixActiveIconColor,
    bool Function(String)? isValidatorCustom,
    bool isActiveTextField = false,
    bool enabled = true,
    required TextEditingController controller,
  }) : super(
            key: key,
            controller: controller,
            label: title,
            keyboardType: keyboardType,
            hint: hint,
            minLines: 1,
            isActiveTextField: isActiveTextField,
            enabled: enabled,
            fillColor: fillColor,
            prefixActiveIconColor: prefixActiveIconColor,
            padding: padding,
            borderColor: borderColor,
            suffixIcon: suffixIcon,
            prefixIconData: prefixIcon,
            onChanged: onChanged,
            isValidatorCustom: isValidatorCustom);
}
