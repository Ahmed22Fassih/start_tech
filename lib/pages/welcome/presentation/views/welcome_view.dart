import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_task/consts/colors.dart';
import 'package:start_task/consts/image_path.dart';
import 'package:start_task/pages/widgets/staticUI.dart';

import '../../../../consts/text_style.dart';
import '../../../../routes/app_routes.dart';
import '../../../../uitls/buttons/fill_custom_button.dart';
import '../../../../uitls/buttons/outline_custom_button.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorCode.white),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              StaticUI.logoWidget("Welcome to the app"),
              const Spacer(),
              buttons(),
              const Spacer(),
              developedBy(),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ));
  }

  RichText developedBy() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: 'Design & Developed by ',
              style: TextStyles.textRegular.copyWith(
                  color: const Color(ColorCode.black), fontSize: 14.sp)),
          TextSpan(
              text: 'Ahmed Samir',
              style: TextStyles.textMediumItalic.copyWith(
                  decoration: TextDecoration.underline, fontSize: 18.sp))
        ],
      ),
    );
  }

  Column buttons() {
    return Column(
      children: [
        FillCustomButton(
          onPressed: () {
            Get.toNamed(Routes.LOGIN);
          },
          margin: EdgeInsets.symmetric(horizontal: 72.w),
          title: "Login",
        ),
        SizedBox(
          height: 16.h,
        ),
        OutlineCustomButton(
          onPressed: () {
            Get.toNamed(Routes.REGISTER);
          },
          margin: EdgeInsets.symmetric(horizontal: 72.w),
          title: "Register",
        )
      ],
    );
  }
}
