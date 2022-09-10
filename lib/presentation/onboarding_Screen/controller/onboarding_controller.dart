import '../widgets/carousel_item_widget.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  TextEditingController onboardingController = TextEditingController();

  Rx<int> currentCarouselIndex = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    onboardingController.dispose();
  }
}
