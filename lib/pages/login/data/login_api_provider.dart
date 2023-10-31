import 'package:dio/dio.dart' as DIO;
import 'package:dio/src/response.dart' as RESPONE;

import '../../../base/api_end_points.dart';
import '../../../base/base_auth_provider.dart';

abstract class ILoginProvider {
  Future<DIO.Response> login(String email, String password);
}

class LoginProvider extends BaseAuthProvider implements ILoginProvider {
  /// todo issue
  /// when send data with formData received error in crads
  /// when impl with get data received error crads
  @override
  Future<DIO.Response> login(String email, String password) async {
    DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
      baseUrl: "",
    ));

    dio.options.headers = {
      'Content-Type': 'application/json',
      "accept": "application/json"
    };
    DIO.FormData formData = DIO.FormData.fromMap({
      "email": email,
      "password": password,
    });
    try {
      RESPONE.Response resp = await dio.post(
        EndPoints.baseURl + EndPoints.login,
        data: formData,
      );
      print("resp ${resp.data}");
      return resp;
    } catch (e) {
      throw (e.toString());
    }
  }
}
