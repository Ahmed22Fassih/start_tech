import 'dart:developer';

import '../../../base/base_repository.dart';
import '../../../services/auth_services.dart';
import '../../login/model/login_respone_model.dart';
import 'update_info_provider.dart';

abstract class IUpdateInfoRepository {
  Future<LoginResponseModel> updateInfo(String name, String email, String code);
}

class UpdateInfoRepository extends BaseRepository
    implements IUpdateInfoRepository {
  UpdateInfoRepository({required this.provider});
  final IUpdateInfoProvider provider;

  @override
  Future<LoginResponseModel> updateInfo(
      String name, String email, String code) async {
    final loginResponseModel = await provider.updateInfo(name, email, code);

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
