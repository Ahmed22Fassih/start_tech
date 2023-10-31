// part of 'app_pages.dart';

abstract class Routes {
  static const String WELCOME = '/welcome';
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String HOME = '/home';
  static const String UPDATEINFO = '/updateInfo';

  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
