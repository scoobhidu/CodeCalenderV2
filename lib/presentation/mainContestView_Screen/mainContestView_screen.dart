import 'dart:ui';

import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/buttonGridView.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/textWidgets.dart';

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
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Container(
                              height: size.height * 0.08,
                              width: size.width * 0.7,
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
                              height: size.height * 0.06,
                              width: size.height * 0.06,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ColorConstant.whiteA700.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.all(2),
                                  child: IconButton(
                                    icon: Icon(Icons.filter_alt_outlined, color: ColorConstant.whiteA700,),
                                    onPressed: (){
                                      print('ez');
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsIn24Hrs!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Week",
                                  color: Colors.yellowAccent,),
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisWeek!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Month",
                                  color: Colors.yellowAccent,),
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisMonth!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "This Year",
                                  color: Colors.yellowAccent,),
                                ButtonGridView(
                                    contestButtons: controller
                                        .contestWidgetLists
                                        .contestsThisYear!),
                                LabelHeading(h1: "Contests | ",
                                  h2: "Live",
                                  color: Colors.greenAccent,),
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
                                return Container(
                                  child: Center(
                                    child: Text('No contests to show!', style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 16
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Obx(() => ButtonGridView(
                                  contestButtons: controller.allContestsButtons.value
                                )
                              );
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
}
