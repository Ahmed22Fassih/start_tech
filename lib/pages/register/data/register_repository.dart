import 'dart:developer';

import 'package:get/get.dart';

import '../../../base/base_repository.dart';
import '../../../services/auth_services.dart';
import '../../login/model/login_respone_model.dart';
import '../model/sign_up_model.dart';
import 'register_api_provider.dart';

abstract class IRegisterRepository {
  Future<LoginResponseModel> register(SignUpModel signUpModel);
}

class RegisterRepository extends BaseRepository implements IRegisterRepository {
  RegisterRepository({required this.provider});
  final IRegisterProvider provider;

  @override
  Future<LoginResponseModel> register(SignUpModel signUpModel) async {
    final apiResponse = await provider.register(signUpModel);
    if (apiResponse.isOk && apiResponse.body != null) {
      AuthService.to.login(apiResponse.body!);
      return apiResponse.body!;
    } else {
      log(apiResponse.body!.message!);
      throw (getErrorMessage(apiResponse.body!.message!));
    }
  }
}
