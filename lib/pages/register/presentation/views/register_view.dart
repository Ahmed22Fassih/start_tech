import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:start_task/pages/login/presentation/views/login_view.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/text_style.dart';
import '../../../../enums/buttons_states.dart';
import '../../../../routes/app_routes.dart';
import '../../../../uitls/buttons/loading_fill_custom_button.dart';
import '../../../../uitls/text_field/email_text_field.dart';
import '../../../../uitls/text_field/full_name_text_filed.dart';
import '../../../../uitls/text_field/password_text_filed.dart';
import '../../../widgets/staticUI.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  String countryCode = "+2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ColorCode.white),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        controller.emailController.text =
                            "ahmed.fassih22@gmail.com";
                        controller.nameController.text = "ahmed samir";
                        controller.passwordController.text = "123456789";
                        controller.confirmPasswordController.text = "123456789";
                      },
                      child: StaticUI.logoWidget("Register")),
                  SizedBox(
                    height: 16.h,
                  ),
                  registerInput(),
                  SizedBox(
                    height: 32.h,
                  ),
                  goToLogin(),
                  SizedBox(
                    height: 8.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Padding registerInput() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      child: Column(
        children: [
          FullNameTextField(
            controller: controller.nameController,
            hint: "Full Name",
            onChanged: (text) {
              controller.validator();
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          CountryListPick(
            pickerBuilder: (context, CountryCode? countryCode) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        width: 1.5, color: const Color(ColorCode.gray2))),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 36.w,
                      width: 36.w,
                      child: Image.asset(
                        countryCode?.flagUri ?? "",
                        package: 'country_list_pick',
                      ),
                    ),
                    Text(countryCode?.dialCode ?? "$countryCode"),
                    Container()
                  ],
                ),
              );
            },
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: false,
              isShowCode: true,
              isDownIcon: false,
              showEnglishName: false,
              labelColor: Colors.black,
            ),
            initialSelection: '${countryCode}',
            onChanged: (country) {
              countryCode = country?.code.toString() ?? "";
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          EmailTextField(
            controller: controller.emailController,
            hint: "Email Address",
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
            height: 24.h,
          ),
          PasswordTextField(
            hint: 'Confirm password',
            passwordController: controller.confirmPasswordController,
            onChanged: (text) {
              controller.validator();
            },
          ),
          SizedBox(
            height: 48.h,
          ),
          registerButton()
        ],
      ),
    );
  }

  Widget registerButton() {
    return GetBuilder<RegisterController>(builder: (context) {
      return ObxValue<RxBool>((state) {
        return LoadingFillCustomButton(
          onPressed: () {
            controller.onRegisterClicked();
          },
          buttonState: !controller.isValidator.value
              ? ButtonState.Disable
              : controller.isRegisterLoading.value
                  ? ButtonState.Loading
                  : ButtonState.Enable,
          lable: 'Register',
        );
      }, controller.isValidator);
    });
  }

  RichText goToLogin() {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "Already have an account ? ",
              style: TextStyles.textMedium.copyWith(
                  color: const Color(ColorCode.black), fontSize: 14.sp)),
          TextSpan(
            text: 'Login',
            style: TextStyles.textMediumItalic.copyWith(fontSize: 18.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.offAndToNamed(Routes.LOGIN);
              },
          )
        ],
      ),
    );
  }
}
