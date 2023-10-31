import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_task/uitls/buttons/fill_custom_button.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_style.dart';
import '../../../../enums/buttons_states.dart';
import '../../../../routes/app_routes.dart';
import '../../../../uitls/buttons/loading_fill_custom_button.dart';
import '../../../../uitls/text_field/email_text_field.dart';
import '../../../../uitls/text_field/password_text_filed.dart';
import '../../../register/presentation/views/register_view.dart';
import '../../../widgets/staticUI.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(ColorCode.white),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StaticUI.logoWidget("Login"),
                  SizedBox(
                    height: 100.h,
                  ),
                  loginInput(),
                  SizedBox(
                    height: 100.h,
                  ),
                  goToRegister(),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding loginInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        children: [
          EmailTextField(
            controller: controller.emailController,
            hint: "Email Address",
            onChanged: (text) {
              controller.validator();
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          PasswordTextField(
            hint: 'password',
            passwordController: controller.passwordController,
            onChanged: (text) {
              controller.validator();
            },
          ),
          SizedBox(
            height: 48.h,
          ),
          loginButton()
        ],
      ),
    );
  }

  Widget loginButton() {
    return GetBuilder<LoginController>(builder: (context) {
      return ObxValue<RxBool>((state) {
        return LoadingFillCustomButton(
          onPressed: () {
            controller.onLoginClicked();
          },
          buttonState: !controller.isValidator.value
              ? ButtonState.Disable
              : controller.isLoginLoading.value
                  ? ButtonState.Loading
                  : ButtonState.Enable,
          lable: 'Login',
        );
      }, controller.isValidator);
    });
    // return FillCustomButton(
    //       onPressed: () {
    //         Get.toNamed(Routes.HOME);
    //       },
    //       title: "Login",
    //     );
  }

  RichText goToRegister() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "Don't have an account ? ",
              style: TextStyles.textMedium.copyWith(
                  color: const Color(ColorCode.black), fontSize: 14.sp)),
          TextSpan(
            text: 'Register',
            style: TextStyles.textMediumItalic.copyWith(fontSize: 18.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.offAndToNamed(Routes.REGISTER);
              },
          )
        ],
      ),
    );
  }
}
