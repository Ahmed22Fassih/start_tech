import 'dart:developer';

import '../../../base/api_end_points.dart';
import '../../../base/base_auth_provider.dart';
import 'package:dio/dio.dart' as DIO;

import '../../../uitls/globalVar.dart';
import '../../login/model/login_respone_model.dart';

abstract class IUpdateInfoProvider {
  Future<LoginResponseModel> updateInfo(String name, String email, String code);
}

class UpdateInfoProvider extends BaseAuthProvider
    implements IUpdateInfoProvider {
  @override
  Future<LoginResponseModel> updateInfo(
      String name, String email, String code) async {
    log("GlobalVar.userData?.token${GlobalVar.userData?.token}");
    DIO.Dio dio = DIO.Dio(DIO.BaseOptions(
      baseUrl: EndPoints.baseURl,
      headers: {
        'Authorization': 'Bearer ${GlobalVar.userData?.token}',
      },
    ));

    DIO.FormData formData = DIO.FormData.fromMap({
      "email": email,
      "name": name,
      "phone": "140141012",
      "country_code": code
    });
    try {
      DIO.Response resp = await dio.post(
        EndPoints.update,
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
