import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../consts/colors.dart';
import '../../../../routes/app_routes.dart';
import '../../../widgets/custom_snackBar.dart';
import '../../data/login_repository.dart';

class LoginController extends SuperController<dynamic> {
  LoginController({required this.loginRepository});

  final ILoginRepository loginRepository;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isValidator = false.obs;

  RxBool isLoginLoading = false.obs;

  validator() {
    if (passwordController.text.length > 2 &&
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

  onLoginClicked() {
    isLoginLoading = true.obs;
    change(false, status: RxStatus.loading());
    var apiResp = loginRepository
        .login(emailController.text, passwordController.text)
        .then((value) {
      log("value.success${value.success}");
      if (value.success ?? false) {
        Get.toNamed(Routes.HOME);
        customSnackBar(value.message ?? "", const Color(ColorCode.green));
        isLoginLoading = false.obs;
        change(true, status: RxStatus.success());
      } else {
        customSnackBar(value.message ?? "", Colors.red);
      }
    }, onError: (err) {
      isLoginLoading = false.obs;
      log("errLogin ${err}");
      customSnackBar("something wrong", Colors.red);
      change(false, status: RxStatus.success());
    });
  }
}
