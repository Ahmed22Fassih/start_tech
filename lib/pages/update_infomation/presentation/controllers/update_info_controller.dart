import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/update_info_repository.dart';

class UpdateInfoController extends SuperController<dynamic> {
  UpdateInfoController({required this.updateInfoRepository});

  final IUpdateInfoRepository updateInfoRepository;

  RxString countryCode = "+2".obs;
  // TextEditingController emailController = TextEditingController();
  // TextEditingController nameController = TextEditingController();

  RxBool isUpdateLoading = false.obs;

  void isValidator() {}
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

  void onUpdateClicked() {}
}
