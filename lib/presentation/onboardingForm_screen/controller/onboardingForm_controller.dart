import '/core/app_export.dart';
import 'package:flutter/material.dart';

class OnboardingFormController extends GetxController {
  TextEditingController onboardingFormController = TextEditingController();

  TextEditingController onboardingCodeChefController = TextEditingController();
  TextEditingController onboardingCodeForcesController = TextEditingController();
  TextEditingController onboardingLeetCodeController = TextEditingController();
  TextEditingController onboardingAtCoderController = TextEditingController();
  TextEditingController onboardingSPOJController = TextEditingController();
  TextEditingController onboardingInterviewBitController = TextEditingController();


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    onboardingFormController.dispose();
  }
}
