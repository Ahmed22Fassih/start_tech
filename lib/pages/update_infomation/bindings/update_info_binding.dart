import 'package:get/get.dart';

import '../data/update_info_provider.dart';
import '../data/update_info_repository.dart';
import '../presentation/controllers/update_info_controller.dart';

class UpdateInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IUpdateInfoProvider>(UpdateInfoProvider());
    Get.put<IUpdateInfoRepository>(UpdateInfoRepository(provider: Get.find()));
    Get.put(UpdateInfoController(updateInfoRepository: Get.find()));
  }
}
