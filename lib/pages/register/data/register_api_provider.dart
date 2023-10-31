import 'package:get/get.dart';
import 'package:start_task/base/api_end_points.dart';
import 'package:dio/dio.dart' as DIO;

import '../../../base/base_auth_provider.dart';
import '../../login/model/login_respone_model.dart';
import '../model/sign_up_model.dart';

abstract class IRegisterProvider {
  Future<LoginResponseModel> register(SignUpModel signUpModel);
}

class RegisterProvider extends BaseAuthProvider implements IRegisterProvider {
  @override
  Future<LoginResponseModel> register(SignUpModel signUpModel) async {
    DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
      baseUrl: "",
    ));

    DIO.FormData formData = DIO.FormData.fromMap({
      "name": signUpModel.name.toString(),
      "email": signUpModel.email.toString(),
      "phone": "0123456789",
      "country_code": signUpModel.countryCode.toString(),
      "password": signUpModel.password.toString(),
      "password_confirm": signUpModel.confirmPassword.toString(),
    });
    try {
      DIO.Response resp = await dio.post(
        EndPoints.baseURl + EndPoints.register,
        data: formData,
      );
      print("resp ${resp.data}");
      return LoginResponseModel.fromJson(resp.data);
    } catch (e) {
      print("Error ${e}");
      throw (e.toString());
    }
  }
  // return post<LoginResponseModel>(
  //   EndPoints.register,
  //   signUpModel,
  //   decoder: LoginResponseModel.fromJson,
  // );
  // }
}
