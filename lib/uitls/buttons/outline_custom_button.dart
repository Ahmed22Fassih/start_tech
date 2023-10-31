import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/colors.dart';
import '../../consts/text_style.dart';

class OutlineCustomButton extends StatelessWidget {
  const OutlineCustomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.style,
    this.padding,
    this.margin,
    this.borderColor,
    this.borderSize = 1,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double borderSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: margin ?? EdgeInsets.zero,
        child: OutlinedButton(
            onPressed: onPressed,
            child: Text(title,
                textAlign: TextAlign.center,
                style: style ??
                    TextStyles.textSemiBold
                        .copyWith(color: const Color(ColorCode.primary))),
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                  color: borderColor ?? Color(ColorCode.primary),
                  width: borderSize),
              padding: padding ?? EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
            )));
  }
}
