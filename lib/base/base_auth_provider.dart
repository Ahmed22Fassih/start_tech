import 'base_provider.dart';

class BaseAuthProvider extends BaseProvider {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "http://testapi.alifouad91.com/api/";
  }
}
