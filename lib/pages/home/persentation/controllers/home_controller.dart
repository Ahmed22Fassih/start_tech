import 'package:get/get.dart';

import '../../data/home_repository.dart';

class HomeController extends SuperController<dynamic> {
  HomeController({required this.homeRepository});

  final IHomeRepository homeRepository;

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}
