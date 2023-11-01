import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../consts/storage.dart';
import '../../../login/model/login_respone_model.dart';
import '../../data/home_repository.dart';

class HomeController extends SuperController<dynamic> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  GetStorage box = GetStorage(StorageKeys.userDataBox);
  LoginResponseModel? userInfo;

  @override
  void onInit() {
    super.onInit();
    if (box.hasData(StorageKeys.userDataKey)) {
      userInfo = LoginResponseModel.fromJson(box.read(StorageKeys.userDataKey));
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
}
