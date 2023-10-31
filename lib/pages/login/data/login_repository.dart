import 'dart:developer';

import '../../../base/base_repository.dart';
import '../../../services/auth_services.dart';
import '../model/login_respone_model.dart';
import 'login_api_provider.dart';

abstract class ILoginRepository {
  Future<LoginResponseModel> login(String email, String password);
}

class LoginRepository extends BaseRepository implements ILoginRepository {
  LoginRepository({required this.provider});
  final ILoginProvider provider;

  @override
  Future<LoginResponseModel> login(String email, String password) async {
    final loginResponseModel = await provider.login(email, password);

    log("loginResponseModel.success${loginResponseModel.success}");
    if (loginResponseModel.success ?? false) {
      AuthService.to.login(loginResponseModel);
      return loginResponseModel;
    } else {
      log(loginResponseModel.message ?? "");
      throw (getErrorMessage(loginResponseModel.message ?? ""));
    }
  }
}
