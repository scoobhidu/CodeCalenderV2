import '../controller/onboarding_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarouselWidget extends StatelessWidget {

  late final String assetImage;
  late final String headingText;
  late final String carouselDescription;

  CarouselWidget({required this.assetImage, required this.headingText, required this.carouselDescription});

  var controller = Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2.5,
          color: ColorConstant.bluegray900,
          style: BorderStyle.none
        ),
        borderRadius: BorderRadius.circular(40)
      ),
      shadowColor: ColorConstant.black500,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.mirror,
            stops: [0, 0.7],
            colors: [
              ColorConstant.bluegray600,
              ColorConstant.black500
            ],
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 4, child: Image(image: AssetImage(assetImage))),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        headingText,
                        textAlign: TextAlign.start,
                        style: AppStyle.txtSoraBoldW1341.copyWith(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        carouselDescription,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: AppStyle.txtSoraMediumGray14.copyWith(
                          fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Widget> carouselItems = <Widget>[
  CarouselWidget(
    assetImage: ImageConstant.dashboardIllustration,
    headingText: "Track your CP stats",
    carouselDescription: "Fast and easy track-on-the-go style of your progress on various coding platforms with our insightful dashboard screens",
  ),
  CarouselWidget(
      assetImage: ImageConstant.secureLoginImage,
      headingText: "Secure Login and Data",
      carouselDescription: "No data leaks as long as you use our app. Your Coding platform / Personal data won't be leaked anywhere"
  ),
  CarouselWidget(
      assetImage: ImageConstant.friendsIllustrationImage,
      headingText: "Healthy Competition with your friends?",
      carouselDescription: "Now track and compare progress your friends at one platform just by adding their gmail id with which they registered"
  ),
  CarouselWidget(
      assetImage: ImageConstant.confusedPersonImage,
      headingText: "No more Forgetting Contest",
      carouselDescription: "The moment you register to any contest an In-App reminder will be created that will remind you prior the contest and an event will also be added to your google calender for your convenience"
  ),
];