import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../data/models/GoogleSigninObjectModel/googleSignInObjectModel.dart';
import '../../../data/models/platformUserNameModels/platformUsernameModel.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';

class OnboardingFormController extends GetxController {
  TextEditingController onboardingCodeChefController = TextEditingController();
  TextEditingController onboardingCodeForcesController = TextEditingController();
  TextEditingController onboardingLeetCodeController = TextEditingController();
  TextEditingController onboardingAtCoderController = TextEditingController();
  TextEditingController onboardingSPOJController = TextEditingController();
  TextEditingController onboardingInterviewBitController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    onboardingCodeChefController.text = '';
    onboardingCodeForcesController.text = '';
    onboardingLeetCodeController.text = '';
    onboardingAtCoderController.text = '';
    onboardingInterviewBitController.text = '';
    onboardingSPOJController.text = '';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  onTapBtnLoginGoogle() async {
    GoogleSignInObjectModel signInObject = Get.find(tag: 'googleSignInObject');
    try{
      GoogleSignInAccount? userDetails = await signInObject.object.signIn();
      if(userDetails != null){
        PrefUtils().setUserGoogleDisplayName(userDetails.displayName!);
        PrefUtils().setUserGoogleEmail(userDetails.email);
        PrefUtils().setUserGoogleUniqueID(userDetails.id);
        if(userDetails.photoUrl != null) {
          PrefUtils().setUserGooglePhotoURL(userDetails.photoUrl!);
        }
      }
    } catch (err){
      print(err);
    }
    addPlatformUsernameToFirestore();
  }

  addPlatformUsernameToFirestore() async {
    final user = PlatformUsernameModel(
        codechef: onboardingCodeChefController.text.removeAllWhitespace,
        codeforces: onboardingCodeForcesController.text.removeAllWhitespace,
        leetcode: onboardingLeetCodeController.text.removeAllWhitespace,
        atCoder: onboardingAtCoderController.text.removeAllWhitespace,
        interviewBit: onboardingInterviewBitController.text.removeAllWhitespace,
        spoj: onboardingSPOJController.text.removeAllWhitespace
    );

    FirebaseFirestore.instance.collection('user')
        .doc(PrefUtils().getUserGoogleDisplayName())
        .set(user.toJson())
        .then((value) {
            print('${user.toJson()} added');
            onTapBtnProceed();
          }
        ).catchError((err) => print(err));
  }

  onTapBtnProceed(){
    Get.toNamed(AppRoutes.contestLoadingScreen);
  }

  @override
  void onClose() {
    super.onClose();
    onboardingCodeChefController.dispose();
    onboardingCodeForcesController.dispose();
    onboardingLeetCodeController.dispose();
    onboardingAtCoderController.dispose();
    onboardingInterviewBitController.dispose();
    onboardingSPOJController.dispose();
  }
}
