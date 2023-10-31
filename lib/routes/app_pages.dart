import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:start_task/pages/register/presentation/views/register_view.dart';

import '../pages/home/bindings/home_binding.dart';
import '../pages/home/persentation/views/home_view.dart';
import '../pages/login/bindings/login_binding.dart';
import '../pages/login/presentation/views/login_view.dart';
import '../pages/register/bindings/register_binding.dart';
import '../pages/update_infomation/bindings/update_info_binding.dart';
import '../pages/update_infomation/presentation/views/update_info.dart';
import '../pages/welcome/bindings/welcome_binding.dart';
import '../pages/welcome/presentation/views/welcome_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
        name: Routes.WELCOME,
        page: () => const WelcomeView(),
        binding: WelcomeBinding()),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.UPDATEINFO,
      page: () => UpdateInfoView(),
      binding: UpdateInfoBinding(),
    ),
  ];
}
