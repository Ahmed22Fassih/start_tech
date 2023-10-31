import 'package:flutter/material.dart';
import 'package:start_task/consts/colors.dart';

import '../../enums/buttons_states.dart';
import 'fill_custom_button.dart';

class LoadingFillCustomButton extends StatelessWidget {
  LoadingFillCustomButton({
    Key? key,
    required this.lable,
    this.onPressed,
    this.enableBackgroundColor,
    this.disableBackgroundColor,
    this.enableTextColor,
    this.disableTextColor,
    this.style,
    this.padding,
    this.width = double.infinity,
    required this.buttonState,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String lable;
  final ButtonState buttonState;
  final Color? enableBackgroundColor;
  final double? width;
  final Color? disableBackgroundColor;
  final Color? enableTextColor;
  final Color? disableTextColor;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return FillCustomButton(
      onPressed: onPressed,
      width: width,
      style: style,
      padding: padding,
      backgroundColor: getBestBackgroundColor(buttonState),
      textColor: getBestTextButtonColor(buttonState),
      elevation: getBestElevation(buttonState),
      child: buttonState == ButtonState.Loading
          ? CircularProgressIndicator(
              color: Color(ColorCode.white),
            )
          : null,
      shadowColor: (buttonState == ButtonState.Disable ||
              buttonState == ButtonState.Loading)
          ? Colors.white
          : null,
      title: lable,
    );
  }

  /// determine background color depend on current state.
  Color getBestBackgroundColor(ButtonState buttonState) {
    switch (buttonState) {
      case ButtonState.Enable:
        return enableBackgroundColor ?? Color(ColorCode.primary);
      default:
        return disableBackgroundColor ?? Color(ColorCode.gray2).withOpacity(.4);
    }
  }

  /// determine text button color depend on current state.
  Color getBestTextButtonColor(ButtonState buttonState) {
    switch (buttonState) {
      case ButtonState.Enable:
        return enableTextColor ?? Color(ColorCode.white);
      default:
        return disableTextColor ?? Color(ColorCode.white);
    }
  }

  /// determine text button color depend on current state.
  double getBestElevation(ButtonState buttonState) {
    switch (buttonState) {
      case ButtonState.Enable:
        return 4;
      default:
        return 0;
    }
  }
}
