import 'package:get/get.dart';
import 'package:start_task/base/api_end_points.dart';

import '../../../base/base_auth_provider.dart';
import '../../login/model/login_respone_model.dart';
import '../model/sign_up_model.dart';

abstract class IRegisterProvider {
  Future<Response<LoginResponseModel>> register(SignUpModel signUpModel);
}

class RegisterProvider extends BaseAuthProvider implements IRegisterProvider {
  @override
  Future<Response<LoginResponseModel>> register(SignUpModel signUpModel) {
    return post<LoginResponseModel>(
      EndPoints.register,
      signUpModel,
      decoder: LoginResponseModel.fromJson,
    );
  }
}
