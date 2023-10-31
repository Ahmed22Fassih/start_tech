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
    final apiResponse = await provider.login(email, password);
    LoginResponseModel loginResponseModel =
        LoginResponseModel.fromJson(apiResponse.data);

    if (apiResponse.statusCode == 200 && apiResponse.data) {
      if (loginResponseModel.success == true) {
        AuthService.to.login(loginResponseModel);
      }
      return loginResponseModel;
    } else {
      log(loginResponseModel.message ?? "");
      throw (getErrorMessage(loginResponseModel.message ?? ""));
    }
  }
}
