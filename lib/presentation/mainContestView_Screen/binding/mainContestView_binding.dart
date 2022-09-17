import '../controller/mainContestView_controller.dart';
import 'package:get/get.dart';

class MainContestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainContestViewController());
  }
}
