import '../controller/onboardingForm_controller.dart';
import 'package:get/get.dart';

class OnboardingFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingFormController());
  }
}
