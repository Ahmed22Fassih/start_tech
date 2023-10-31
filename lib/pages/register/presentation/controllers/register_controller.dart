import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/custom_snackBar.dart';
import '../../data/register_repository.dart';
import '../../model/sign_up_model.dart';

class RegisterController extends SuperController<dynamic> {
  RegisterController({required this.registerRepository});

  final IRegisterRepository registerRepository;

  SignUpModel signUpModel = SignUpModel();

  TextEditingController nameController = TextEditingController();
  RxString countryCode = "+2".obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxBool isRegisterLoading = false.obs;
  onRegisterClicked() {
    isRegisterLoading = true.obs;
    update();
    signUpModel.name = nameController.text;
    signUpModel.email = emailController.text;
    signUpModel.countryCode = countryCode.string;
    signUpModel.password = passwordController.text;
    signUpModel.confirmPassword = confirmPasswordController.text;
    signUpModel.mobile = "1234";

    log(signUpModel.toJson().toString());

    var apiResp = registerRepository.register(signUpModel).then((value) {
      Get.toNamed(
        Routes.HOME,
      );
      customSnackBar(value.message ?? "", const Color(ColorCode.green));
      isRegisterLoading = false.obs;
      update();
    }, onError: (err) {
      isRegisterLoading = false.obs;
      log("error ${err}");
      update();
    });
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }

  RxBool isValidator = false.obs;

  validator() {
    if ((nameController.text.isNotEmpty &&
            passwordController.text.length > 6 &&
            passwordController.text == confirmPasswordController.text) &&
        isValidEmail(emailController.text)) {
      isValidator.value = true;
    } else {
      isValidator.value = false;
    }
    log("isValidator.value${isValidator.value}");
    update();
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
