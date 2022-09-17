import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:codecalenderv2/data/models/GoogleSigninObjectModel/googleSignInObjectModel.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/widgets/carousel_item_widget.dart';
import 'package:codecalenderv2/widgets/custom_text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'controller/mainContestView_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class MainContestViewScreen extends GetWidget<MainContestViewController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray103,
        body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror,
                  stops: [0, 0.7],
                  colors: [
                    ColorConstant.bluegray801,
                    ColorConstant.black500
              ],
            )
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 15, sigmaY: 15
            ),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: ColorConstant.whiteA700.withOpacity(0.08),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     ]),
                   ),
    ))))));
  }
}
