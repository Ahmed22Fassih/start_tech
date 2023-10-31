import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/auth_services.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.addRequestModifier<dynamic>((request) {
      final userInfo = AuthService.to.userInfo;
      final languageApp = AuthService.to.language;
      if (userInfo != null && userInfo.userData!.token!.isNotEmpty) {
        request.headers.putIfAbsent(
            "Authorization",
            () => (''
                ' ${userInfo.userData!.token ?? ""}'));
      }

      request.headers.putIfAbsent(
        "Accept-Language",
        () => AuthService.to.language ?? 'en',
      );

      return request;
    });

    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      printInfo(info: response.bodyString!);
      if (response.unauthorized || response.status.code == 401) {
        AuthService.to.logout();
        Get.rootDelegate.offNamed(Routes.LOGIN);
      }
      return response;
    });
  }
}
