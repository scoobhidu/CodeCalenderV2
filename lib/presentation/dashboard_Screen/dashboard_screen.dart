import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/LeetCode.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'controller/dashboard_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends GetWidget<DashboardController> {
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: CircleAvatar(
                          radius: size.height * 0.08,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              height: size.height * 0.2,
                              imageUrl: PrefUtils().getUserGooglePhotoURL(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          backgroundColor: ColorConstant.HackerEarth,
                        ),
                      ),
                      Text(
                        PrefUtils().getUserGoogleDisplayName(),
                        style: AppStyle.txtSoraMediumGray20,
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: size.width * 1.5,
                      child: Container(
                        height: size.height * 0.08,
                        child: Obx(
                          () => TabBar(
                              controller: controller.tabController.value,
                              indicator: DotIndicator(
                                color: controller.tabColor.value,
                                distanceFromCenter: 20,
                                radius: 3,
                                paintingStyle: PaintingStyle.fill,
                              ),
                              tabs: controller.availableSites.map((item) {
                                return Tab(
                                  text: item,
                                );
                              }).toList(),
                            onTap: (i) => ContestColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.649,
                    child: TabBarView(
                      controller: controller.tabController.value,
                      children: controller.availableSites.map((item) {
                        if(item == "Codechef"){
                          return SizedBox();
                        } else if(item == "Codeforces"){
                          return SizedBox();
                        } else if(item == "Leetcode"){
                          return LeetcodeStats(
                            data: controller.lcData,
                            controller: controller.LeetCodeselectedPieGraph,
                          );
                        } else if(item == "Atcoder"){
                          return SizedBox();
                        } else if(item == "SPOJ"){
                          return SizedBox();
                        } else if(item == "InterviewBit"){
                          return SizedBox();
                        }
                        return SizedBox();
                      }).toList(),
                    ),
                  ),
                ],
              )
            )))));
  }

  ContestColor(){
    print(controller.tabColor.value);
    print(controller.tabController.value.index);
    if(controller.availableSites[controller.tabController.value.index] == 'Codechef'){
      controller.tabColor.value = ColorConstant.CodeChef;
    } else if (controller.availableSites[controller.tabController.value.index] == 'Codeforces'){
      controller.tabColor.value = ColorConstant.CodeForces;
    } else if (controller.availableSites[controller.tabController.value.index] == 'Leetcode'){
      controller.tabColor.value = ColorConstant.LeetCode;
    } else if (controller.availableSites[controller.tabController.value.index] == 'Atcoder'){
      controller.tabColor.value = ColorConstant.AtCoder;
    } else if (controller.availableSites[controller.tabController.value.index] == 'SPOJ'){
      controller.tabColor.value = ColorConstant.InterviewBit;
    } else if (controller.availableSites[controller.tabController.value.index] == 'InterviewBit'){
      controller.tabColor.value = ColorConstant.SPOJ;
    } else {
      controller.tabColor.value = ColorConstant.CodeChef;
    }
  }
}
