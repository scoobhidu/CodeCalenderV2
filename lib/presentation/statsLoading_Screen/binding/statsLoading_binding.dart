import '../controller/statsLoading_controller.dart';
import 'package:get/get.dart';

class StatsLoadingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatsLoadingController());
  }
}
