import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_task/uitls/globalVar.dart';

import '../../../../consts/colors.dart';
import '../../../../consts/storage.dart';
import '../../../../routes/app_routes.dart';
import '../../../login/model/login_respone_model.dart';
import '../../../widgets/custom_snackBar.dart';
import '../../data/update_info_repository.dart';

class UpdateInfoController extends SuperController<dynamic> {
  UpdateInfoController({required this.updateInfoRepository});

  final IUpdateInfoRepository updateInfoRepository;

  String countryCode = "+2";
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  RxBool isUpdateLoading = false.obs;

  void isValidator() {}

  GetStorage box = GetStorage(StorageKeys.userDataBox);
  LoginResponseModel? userInfo;

  String? token;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData(StorageKeys.userDataKey)) {
      userInfo = LoginResponseModel.fromJson(box.read(StorageKeys.userDataKey));
      emailController.text = userInfo?.userData?.email ?? "";
      nameController.text = userInfo?.userData?.name ?? "";
      countryCode = userInfo?.userData?.countryCode ?? "+2";
      log("emailController.text${emailController.text}");
      update();
    }
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

  void onUpdateClicked() {
    isUpdateLoading = true.obs;
    change(false, status: RxStatus.loading());
    updateInfoRepository
        .updateInfo(
            nameController.text, emailController.text.trim(), countryCode)
        .then((value) {
      log("value.success${value.success}");
      if (value.success ?? false) {
        Get.toNamed(Routes.HOME);
        customSnackBar(value.message ?? "", const Color(ColorCode.green));
        isUpdateLoading = false.obs;
        change(true, status: RxStatus.success());
      } else {
        customSnackBar(value.message ?? "", Colors.red);
      }
    }, onError: (err) {
      isUpdateLoading = false.obs;
      log("errLogin ${err}");
      customSnackBar("something wrong", Colors.red);
      change(false, status: RxStatus.success());
    });
  }
}
