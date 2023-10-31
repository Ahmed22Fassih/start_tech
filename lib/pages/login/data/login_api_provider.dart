import 'package:dio/dio.dart' as DIO;
// import 'package:dio/src/response.dart' as RESPONE;

import '../../../base/api_end_points.dart';
import '../../../base/base_auth_provider.dart';
import '../model/login_respone_model.dart';

abstract class ILoginProvider {
  Future<LoginResponseModel> login(String email, String password);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {
  @override
  Future<LoginResponseModel> login(String email, String password) async {
    DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
      baseUrl: "",
    ));

    DIO.FormData formData = DIO.FormData.fromMap({
      "email": email,
      "password": password,
    });
    try {
      DIO.Response resp = await dio.post(
        EndPoints.baseURl + EndPoints.login,
        data: formData,
      );
      print("resp ${resp.data}");
      return LoginResponseModel.fromJson(resp.data);
    } catch (e) {
      print("Error ${e}");
      throw (e.toString());
    }
  }
}
