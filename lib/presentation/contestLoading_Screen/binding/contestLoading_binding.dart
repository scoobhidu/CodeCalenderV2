import '../controller/contestLoading_controller.dart';
import 'package:get/get.dart';

class ContestLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContestLoadingController());
  }
}
