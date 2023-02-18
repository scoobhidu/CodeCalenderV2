import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/ButtonDetailWidgets.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/buttonGridView.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/noContestsWidget.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/textWidgets.dart';

import '../../data/models/platformUserNameModels/platformUsernameModel.dart';
import 'controller/mainContestView_controller.dart';
import 'package:codecalenderv2/core/app_export.dart';
import 'package:flutter/material.dart';

class MainContestViewScreen extends GetWidget<MainContestViewController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black500,
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
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Container(
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.all(2),
                                  child: IconButton(onPressed: onTapGoToDashboard, icon: Icon(Icons.person, color: ColorConstant.whiteA700,)),
                                ),
                              ),
                            ),
                            Container(
                              height: size.height * 0.08,
                              width: size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: TextFormField(
                                textInputAction: TextInputAction.done,
                                controller: controller.searchByNameText,
                                style: AppStyle.txtSoraMediumGray16,
                                focusNode: FocusNode(),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: ColorConstant.whiteA700.withOpacity(0.08),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Obx(() => controller.notEmptyText.value ?
                                          IconButton(
                                              onPressed: (){
                                                controller.searchByNameText.text = '';

                                                controller.notEmptyText.value = false;

                                                controller.searchByName.value = false;
                                                controller.searchByPlatform.value = false;
                                                controller.displayByTimeline.value = true;
                                              },
                                              icon: Icon(Icons.clear, color: ColorConstant.whiteA700, size: 18,)
                                          ) : SizedBox(height: 0, width: 0,),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 15, top: 0, bottom: 0, right: 0),
                                    hintText: 'Search by Contest Name',
                                    hintStyle: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 16
                                    ),
                                ),
                                onChanged: (val){
                                  if(controller.searchByNameText.text == '') {
                                    controller.notEmptyText.value = false;

                                    controller.searchByName.value = false;
                                    controller.searchByPlatform.value = false;
                                    controller.displayByTimeline.value = true;
                                  } else {
                                    controller.searchContestByName(controller.searchByNameText.text);
                                    controller.notEmptyText.value = true;

                                    controller.searchByName.value = true;
                                    controller.searchByPlatform.value = false;
                                    controller.displayByTimeline.value = false;
                                  }
                                },
                              ),
                            ),

                            Container(
                              child: Center(
                                child: Obx(() => Container(
                                    decoration: BoxDecoration(
                                      color: controller.showPlatforms.value?
                                            ColorConstant.whiteA700 :
                                            ColorConstant.whiteA700.withOpacity(0.08),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: EdgeInsets.all(2),
                                    child: IconButton(
                                      icon: Icon(Icons.filter_alt_outlined,
                                          color: controller.showPlatforms.value?
                                                  ColorConstant.black500 :
                                                  ColorConstant.whiteA700,
                                      ),
                                      onPressed: (){
                                        controller.showPlatforms.value = !controller.showPlatforms.value;

                                        controller.ccSelected.value = false;
                                        controller.cfSelected.value = false;
                                        controller.acSelected.value = false;
                                        controller.lcSelected.value = false;
                                        controller.heSelected.value = false;
                                        controller.hrSelected.value = false;
                                        controller.kcSelected.value = false;

                                        controller.displayByTimeline.value = true;
                                        print('ez');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Obx(
                        () => controller.showPlatforms.value?
                        Container(
                            height: size.height * 0.165,
                            width: size.width,
                            margin: EdgeInsets.symmetric(vertical: 15),
                          child: GridView.count(
                            crossAxisCount: 5,
                            children: [
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = !controller.ccSelected.value;
                                  controller.cfSelected.value = false;
                                  controller.acSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.ccSelected.value;
                                  print("Tapped");
                                },
                                child: Container(
                                    height: size.height * 0.075,
                                    width: size.width * 0.15,
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: controller.ccSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: ContestImage(platform: 'CodeChef', size: 25,),
                                    )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = !controller.cfSelected.value;
                                  controller.acSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.cfSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.cfSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ContestImage(platform: 'CodeForces', size: 25,),
                                      )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = false;
                                  controller.lcSelected.value = !controller.lcSelected.value;
                                  controller.acSelected.value = false;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.lcSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.lcSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ContestImage(platform: 'LeetCode', size: 25,),
                                      )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.acSelected.value = !controller.acSelected.value;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.acSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.acSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ContestImage(platform: 'AtCoder', size: 25,),
                                      )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.acSelected.value = false;
                                  controller.heSelected.value = !controller.heSelected.value;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.heSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.heSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child:  Container(
                                          child: Image.asset(
                                            controller.heSelected.value?
                                            'assets/images/logos/light/HackerEarthLight.png'
                                            : 'assets/images/logos/dark/HackerEarth.png', width: 25, height: 25,),
                                        ),
                                      )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.acSelected.value = false;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = !controller.hrSelected.value;
                                  controller.kcSelected.value = false;

                                  controller.displayByTimeline.value = !controller.hrSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.hrSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ContestImage(platform: 'HackerRank', size: 25,),
                                      )
                                  ),
                                )
                              ),
                          Center(
                              child: GestureDetector(
                                onTap: (){
                                  controller.ccSelected.value = false;
                                  controller.cfSelected.value = false;
                                  controller.lcSelected.value = false;
                                  controller.acSelected.value = false;
                                  controller.heSelected.value = false;
                                  controller.hrSelected.value = false;
                                  controller.kcSelected.value = !controller.kcSelected.value;
                                  controller.displayByTimeline.value = !controller.kcSelected.value;
                                  print("Tapped");
                                  },
                                  child: Container(
                                      height: size.height * 0.075,
                                      width: size.width * 0.15,
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: controller.kcSelected.value? ColorConstant.whiteA700 : ColorConstant.whiteA700.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ContestImage(platform: 'Kick Start', size: 25,),
                                      )
                                  ),
                                )
                              ),
                            ],
                          ),
                        ) : SizedBox(height: 0, width: 0,)
                      ),
                      Obx(() {
                        if (controller.displayByTimeline.value) {
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LabelHeading(h1: "Contests | ",
                                  h2: "In 24 Hrs",
                                  color: Colors.yellowAccent,),
                                controller.contestWidgetLists.contestsIn24Hrs?.length == 0?
                                no_contests_widget() :
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsIn24Hrs!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Week",
                                  color: Colors.yellowAccent,),
                                controller.contestWidgetLists.contestsThisWeek?.length == 0?
                                no_contests_widget() :
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisWeek!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Month",
                                  color: Colors.yellowAccent,),
                                controller.contestWidgetLists.contestsThisMonth?.length == 0?
                                no_contests_widget() :
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisMonth!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Year",
                                  color: Colors.yellowAccent,),
                                controller.contestWidgetLists.contestsThisYear?.length == 0?
                                no_contests_widget() :
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisYear!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "Live",
                                  color: Colors.greenAccent,),
                                controller.contestWidgetLists.liveContests?.length == 0?
                                no_contests_widget() :
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .liveContests!),
                              ],
                            ),
                          );
                        } else if(controller.searchByName.value){
                          return Obx(
                            () {
                              if(controller.allContests.value.length == 0){
                                return no_contests_widget();
                              } else {
                                return Obx(() =>
                                    ButtonGridView(
                                        contestButtons: controller.allContestsButtons.value
                                    )
                                );
                              }
                            }
                          );
                        } else {
                          return Obx((){
                              if(controller.ccSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.ccContests!
                                );
                              } else if(controller.cfSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.cfContests!
                                );
                              } else if(controller.lcSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.lcContests!
                                );
                              } else if(controller.hrSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.hrContests!
                                );
                              } else if(controller.heSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.heContests!
                                );
                              } else if(controller.acSelected.value){
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.acContests!
                                );
                              } else {
                                return ButtonGridView(
                                    contestButtons: controller.contestWidgetLists.kcContests!
                                );
                              }
                            }
                          );
                        }
                      }
                      ),
                     ]),
                   ),
    ))))));
  }
  Future<void> onTapGoToDashboard() async {
    var platformUsernames = FirebaseFirestore.instance.collection('user').doc(PrefUtils().getUserGoogleDisplayName());

    // Get docs from DocumentReference and then send that map to statsLoading screen
    try{
      platformUsernames.get().then((doc) async {
        Get.toNamed(AppRoutes.statsLoadingScreen, arguments: await doc.data()!);
      }, onError: (e) {
        throw (e);
      });
    } catch(e) {
      print(e);
    }

  }
}