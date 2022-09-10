import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:codecalenderv2/presentation/onboarding_Screen/widgets/carousel_item_widget.dart';

import '../../widgets/custom_button.dart';
import 'controller/onboarding_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends GetWidget<OnboardingController> {
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
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      width: size.width,
                      margin: getMargin(left: 20, right: 20),
                      child: Swiper(
                        layout: SwiperLayout.TINDER,
                        itemHeight: size.height,
                        itemWidth: size.width,
                        controller: SwiperController(),
                        itemBuilder: (context, int index){
                          return carouselItems[index];
                        },
                        itemCount: 4,
                      )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: size.width,
                          child: ElevatedButton(
                            focusNode: FocusNode(),
                            onPressed: onTapBtnProceed,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                              textStyle: MaterialStateProperty.all(TextStyle(fontFamily: 'Sora', fontSize: 15, fontWeight: FontWeight.w700)),
                              backgroundColor: MaterialStateProperty.all(ColorConstant.black500),
                              shadowColor: MaterialStateProperty.all(ColorConstant.black100),
                              elevation: MaterialStateProperty.all(25),
                            ),
                              child: Text('Proceed'),
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        )
      )
    );
  }
  onTapBtnProceed(){
    Get.toNamed(AppRoutes.onboardingFormScreen);
  }
}
