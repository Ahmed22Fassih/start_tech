import 'package:get/get.dart';

import '../data/register_api_provider.dart';
import '../data/register_repository.dart';
import '../presentation/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IRegisterProvider>(RegisterProvider());
    Get.put<IRegisterRepository>(RegisterRepository(provider: Get.find()));
    Get.put(RegisterController(registerRepository: Get.find()));
  }
}
