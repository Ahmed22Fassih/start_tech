import 'package:get/get.dart';

import '../data/welcome_api_provider.dart';
import '../data/welcome_repository.dart';
import '../presentation/controllers/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<IWelcomeProvider>(WelcomeProvider());
    Get.put<IWelcomeRepository>(WelcomeRepository(provider: Get.find()));
    Get.put(WelcomeController(WelcomeRepository: Get.find()));
  }
}
