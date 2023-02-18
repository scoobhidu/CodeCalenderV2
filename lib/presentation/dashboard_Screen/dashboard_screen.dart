import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/CodeChef.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/CodeForces.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/InterviewBit.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/LeetCode.dart';
import 'package:codecalenderv2/presentation/dashboard_Screen/widgets/SPOJ.dart';
import 'package:fl_chart/fl_chart.dart';
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
                          radius: size.height * 0.07,
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

                  if(controller.CFratingData.length == 0 && controller.CCratingData.length == 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Try giving some contests on either codechef or codeforces to see how well you perform on charts!",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16
                      ),
                    ),
                  ),

                  if(controller.CFratingData.length != 0 && controller.CCratingData.length != 0)
                    Container(
                      height: size.height * 0.2,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(() => LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                                isCurved: true,
                                barWidth: 1,
                                color: controller.tabIndex.value == 1 ? ColorConstant.CodeChef : ColorConstant.CodeForces,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: true),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      controller.tabIndex.value == 1 ? ColorConstant.CodeChef : ColorConstant.CodeForces,
                                      Color(0xff28313B),
                                    ]
                                  )
                                ),
                                spots: controller.tabIndex.value == 1 ? controller.CFrankData : controller.CCrankData
                            ),
                            LineChartBarData(
                                isCurved: true,
                                curveSmoothness: 0,
                                color: controller.tabIndex.value == 1 ? Color(0xffA5C7B7) : Color(0xff5D4257),
                                barWidth: 2,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: true),
                                belowBarData: BarAreaData(
                                    show: true,
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          controller.tabIndex.value == 1 ? Color(0xffA5C7B7) : Color(0xff5D4257),
                                          Color(0xff28313B),
                                        ]
                                    )
                                ),
                                spots: controller.tabIndex.value == 1 ? controller.CFratingData : controller.CCratingData
                            ),
                          ],
                          lineTouchData: LineTouchData(
                            handleBuiltInTouches: true,
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ),

                  if((controller.CFratingData.length == 0 && controller.CCratingData.length != 0 ) || controller.CFratingData.length != 0 && controller.CCratingData.length != 0 )
                    Container(
                    height: size.height * 0.2,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                              isCurved: true,
                              barWidth: 1,
                              color: controller.CFratingData.length == 0 ? ColorConstant.CodeChef : ColorConstant.CodeForces,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      controller.CFratingData.length == 0 ? ColorConstant.CodeChef : ColorConstant.CodeForces,
                                      Color(0xff28313B),
                                    ]
                                ),
                              ),
                              spots: controller.CFrankData.length == 0 ? controller.CCrankData : controller.CFrankData
                          ),
                          LineChartBarData(
                              isCurved: true,
                              curveSmoothness: 0,
                              color: controller.CFratingData.length == 0 ? Color(0xffA5C7B7) : Color(0xff5D4257),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                  show: true,
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        controller.CFratingData.length == 0 ? Color(0xffA5C7B7) : Color(0xff5D4257),
                                        Color(0xff28313B),
                                      ]
                                  )
                              ),
                              spots: controller.CFratingData.length == 0 ? controller.CCratingData : controller.CFratingData
                          ),
                        ],
                        lineTouchData: LineTouchData(
                          handleBuiltInTouches: true,
                          touchTooltipData: LineTouchTooltipData(
                            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ),
                    ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: size.width * 1.5,
                      child: Container(
                        height: size.height * 0.08,
                        child: Obx(() => TabBar(
                            controller: controller.tabController,
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
                      ),
                        ),
                    ),
                  ),
                ),

                  Container(
                    width: size.width,
                    height: (controller.CFratingData.length == 0 && controller.CCratingData.length == 0) ? size.height * 0.7 : size.height * 0.469,
                    child: TabBarView(
                      controller: controller.tabController,
                      children: controller.availableSites.map<Widget>((item) {
                        if(item == "Codechef"){
                          return CodechefStats(data: controller.ccData);
                        } else if(item == "Codeforces"){
                          return CodeforcesStats(data: controller.cfData);
                        } else if(item == "Leetcode"){
                          return LeetcodeStats(
                            data: controller.lcData,
                            controller: controller.LeetCodeselectedPieGraph,
                          );
                        }
                        // else if(item == "Atcoder"){
                        //   return AtcoderStats(data: controller.acData);
                        // }
                        else if(item == "SPOJ"){
                          return SpojStats(data: controller.spojData);
                        } else if(item == "InterviewBit"){
                          return InterviewBitStats(
                            data: controller.ibData,
                          );
                        }
                        return SizedBox();
                      }).toList(),
                    ),
                  ),
                ],
              )
            )))));
  }
}
