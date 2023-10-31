import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/colors.dart';
import '../../consts/text_style.dart';

class FillCustomButton extends StatelessWidget {
  const FillCustomButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.shadowColor,
    this.elevation = 4,
    this.textColor,
    this.child,
    this.style,
    this.width = double.infinity,
    this.padding,
    this.margin,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? title;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? textColor;
  final double? elevation;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? style;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding:
              MaterialStateProperty.all(padding ?? const EdgeInsets.all(12)),
          backgroundColor: MaterialStateProperty.all(
              backgroundColor ?? const Color(ColorCode.primary)),
          elevation: MaterialStateProperty.all(elevation ?? 0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: child ??
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: style ??
                  TextStyles.textSemiBold
                      .copyWith(color: const Color(ColorCode.white)),
            ),
      ),
    );
  }
}
