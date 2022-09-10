import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/widgets/carousel_item_widget.dart';
import 'package:codecalenderv2/widgets/custom_text_form_field.dart';

import 'controller/onboardingForm_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class OnboardingFormScreen extends GetWidget<OnboardingFormController> {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Text(
                          'Sign up',
                          style: AppStyle.txtSoraRegularWhite16.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "If you haven't registered on that platform, please leave it blank",
                          style: AppStyle.txtSoraMediumGray14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'CodeChef',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.CodeChef,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingCodeChefController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'CodeChef Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'CodeForces',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.CodeForces,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingCodeForcesController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'CodeForces Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'LeetCode',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.LeetCode,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingLeetCodeController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'LeetCode Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'AtCoder',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.AtCoder,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingAtCoderController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'AtCoder Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'InterviewBit',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.InterviewBit,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)
                        ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingInterviewBitController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'InterviewBit Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                          child: Text(
                            'SPOJ',
                            style: AppStyle.txtSoraMediumWhite14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: ColorConstant.SPOJ,
                              fontSize: 14
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 25),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textInputAction: TextInputAction.done,
                            controller: controller.onboardingSPOJController,
                            style: AppStyle.txtSoraMediumGray13,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                contentPadding: EdgeInsets.only(left: 15),
                                hintText: 'SPOJ Username',
                                hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 11
                                )
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Center(
                          child: Container(
                              height: 45,
                              width: size.width,
                              child: ElevatedButton(
                                focusNode: FocusNode(),
                                onPressed: onTapBtnLoginGoogle,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )
                                  ),
                                  textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Sora', fontSize: 12, fontWeight: FontWeight.w600)),
                                  backgroundColor: MaterialStateProperty.all(ColorConstant.black500),
                                  shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                                  elevation: MaterialStateProperty.all(25),
                                ),
                                child: Text('Login with Google'),
                              )
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                          child: Container(
                            width: size.width,
                            child: Text(
                              'OR',
                              textAlign: TextAlign.center,
                              style: AppStyle.txtSoraRegular11Gray.copyWith(
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Center(
                          child: Container(
                              height: 45,
                              width: size.width,
                              child: ElevatedButton(
                                focusNode: FocusNode(),
                                onPressed: onTapBtnLoginMail,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                                  textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Sora', fontSize: 12, fontWeight: FontWeight.w600)),
                                  backgroundColor: MaterialStateProperty.all(ColorConstant.black500),
                                  shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                                  elevation: MaterialStateProperty.all(15),
                                ),
                                child: Text('Login with Email'),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          )
        )
      )
    );
  }
  onTapBtnLoginGoogle(){

  }
  onTapBtnLoginMail(){

  }
}
