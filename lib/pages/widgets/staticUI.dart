import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../consts/image_path.dart';
import '../../consts/text_style.dart';

class StaticUI {
  static Column logoWidget(String title) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        Image.asset(
          ImagePath.logo,
          width: 112.w,
          height: 112.w,
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          title,
          style: TextStyles.textSemiBold,
        ),
      ],
    );
  }
}
