import 'package:codecalenderv2/data/models/leetcodeDetailsModel/LeetcodeDetailsModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../core/utils/color_constant.dart';
import '../../../core/utils/math_utils.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/StatsBasicBox.dart';
import '../../../widgets/legends_widget.dart';


class LeetcodeStats extends StatelessWidget {
  LeetcodeStats({required this.data, required this.controller});

  Rx<int> controller;
  dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Expanded(
        flex: 6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatsBasicBox(
                    height: size.height * 0.15,
                    width: size.width * 0.32,
                    heading: "Ranking",
                    description: data['ranking'],
                    headingColor: ColorConstant.LeetCode,
                    descriptionColor: ColorConstant.LeetCode.withOpacity(0.6),
                  ),
                  StatsBasicBox(
                    height: size.height * 0.15,
                    width: size.width * 0.32,
                    heading: "Reputation",
                    description: data['reputation'],
                    headingColor: ColorConstant.LeetCode,
                    descriptionColor: ColorConstant.LeetCode.withOpacity(0.6),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Tooltip(
                        message:"Total problems Solved : ${int.parse(data['total_problems_solved'])}\nTotal Questions : ${int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions'])}",
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                        width: size.width * 0.43,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorConstant.whiteA700B2.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, bottom: 5),
                            child: Text(
                              "Solved",
                              style: AppStyle.txtSoraRegular11Gray,
                            ),
                          )
                        ),
                      ),
                    ),
                      Tooltip(
                        message:"Total problems Solved : ${int.parse(data['total_problems_solved'])}\nTotal Questions : ${int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions'])}",
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                        width: size.width * 0.43 * (int.parse(data['total_problems_solved']) / (int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions']))),
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorConstant.LeetCode,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                  Container(
                    width: 2,
                    height: 50,
                    color: ColorConstant.black900,
                  ),
                  Stack(
                    children: [
                      Tooltip(
                        message:"Total problems Submitted : ${int.parse(data['total_problems_submitted'])}\nTotal Questions : ${int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions'])}",
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                          width: size.width * 0.43,
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorConstant.whiteA700B2.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5, bottom: 5),
                              child: Text(
                                "Submitted",
                                style: AppStyle.txtSoraRegular11Gray,
                              ),
                            )
                          ),
                        ),
                      ),
                      Tooltip(
                        message:"Total problems Submitted : ${int.parse(data['total_problems_submitted'])}\nTotal Questions : ${int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions'])}",
                        triggerMode: TooltipTriggerMode.tap,
                        child: Container(
                          width: size.width * 0.43 * (int.parse(data['total_problems_submitted']) / (int.parse(data['total_easy_questions']) + int.parse(data['total_medium_questions']) + int.parse(data['total_hard_questions']))),
                          height: 50,
                          decoration: BoxDecoration(
                            color: ColorConstant.LeetCode,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              ),
              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Tooltip(
                          message:"Acceptance Rate: ${data['easy_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              centerSpaceRadius: 30,
                              sections: [
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.LeetCode,
                                  value: double.parse(data['easy_acceptance_rate'].toString().substring(0, data['easy_acceptance_rate'].toString().length - 1))
                                ),
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.whiteA700.withOpacity(0.1),
                                  value: 100 - double.parse(data['easy_acceptance_rate'].toString().substring(0, data['easy_acceptance_rate'].toString().length - 1))
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tooltip(
                          message:"Acceptance Rate: ${data['easy_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: Obx(
                            () => TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Text(
                                controller.value == 0 ? data['easy_acceptance_rate'] : "Easy",
                                style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode),
                              ),
                              onPressed: (){
                                if(controller.value == 0){
                                  controller.value = -1;
                                } else {
                                  controller.value = 0;
                                }
                              },
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                  Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Tooltip(
                          message:"Acceptance Rate: ${data['medium_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              centerSpaceRadius: 30,
                              sections: [
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.LeetCode,
                                  value: double.parse(data['medium_acceptance_rate'].toString().substring(0, data['medium_acceptance_rate'].toString().length - 1))
                                ),
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.whiteA700.withOpacity(0.1),
                                  value: 100 - double.parse(data['medium_acceptance_rate'].toString().substring(0, data['medium_acceptance_rate'].toString().length - 1))
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tooltip(
                          message:"Acceptance Rate: ${data['medium_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: Obx(
                            () => TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Text(
                                controller.value == 1 ? data['medium_acceptance_rate'] : "Medium",
                                style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode),
                              ),
                              onPressed: (){
                                if(controller.value == 1){
                                  controller.value = -1;
                                } else {
                                  controller.value = 1;
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Tooltip(
                          message:"Acceptance Rate: ${data['hard_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: PieChart(
                            PieChartData(
                              startDegreeOffset: -90,
                              centerSpaceRadius: 30,
                              sections: [
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.LeetCode,
                                  value: double.parse(data['hard_acceptance_rate'].toString().substring(0, data['hard_acceptance_rate'].toString().length - 1))
                                ),
                                PieChartSectionData(
                                  radius: size.width * 0.05,
                                  showTitle: false,
                                  color: ColorConstant.whiteA700.withOpacity(0.1),
                                  value: 100 - double.parse(data['hard_acceptance_rate'].toString().substring(0, data['hard_acceptance_rate'].toString().length - 1))
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tooltip(
                          message:"Acceptance Rate: ${data['hard_acceptance_rate']}",
                          triggerMode: TooltipTriggerMode.tap,
                          child: Obx(
                                () => TextButton(
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              child: Text(
                                controller.value == 2 ? data['hard_acceptance_rate'] : "Hard",
                                style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode),
                              ),
                              onPressed: (){
                                if(controller.value == 2){
                                  controller.value = -1;
                                } else {
                                  controller.value = 2;
                                }
                              },
                            ),
                          ),
                        ),
                      ]
                    )
                  ),
                ],
              ),

              SizedBox(height: 40,),

              Obx(() => controller.value != -1? Column(
                children: [
                  LegendsListWidget(
                    legends: [
                      Legend('Questions Left to Do', Color(0xffffb3ba)),
                      Legend('Submitted', Color(0xffa39af2)),
                      Legend('Solved', Color(0xff578eff)),
                    ],
                  ),
                  Container(
                      height: size.height * 0.3,
                      width: size.width * 0.8,
                      margin: EdgeInsets.only(bottom: 40, top: 40),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                getTitlesWidget: (d, meta){
                                  if(d == 0){
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Text("Easy", style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode)),
                                    );
                                  } else if(d == 1){
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Text("Medium", style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode)),
                                    );
                                  } else{
                                    return SideTitleWidget(
                                      axisSide: meta.axisSide,
                                      child: Text("Hard", style: AppStyle.getTxtSoraRegular14(ColorConstant.LeetCode)),
                                    );
                                  }
                                },
                                showTitles: true,
                                reservedSize: 24,
                              )
                            ),
                          ),
                          barTouchData: BarTouchData(
                            enabled: true,

                          ),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          barGroups: [
                          BarChartGroupData(
                          x: 0,
                          groupVertically: false,
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['easy_questions_solved']),
                              color: Color(0xff578eff),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['easy_problems_submitted']),
                              color: Color(0xffa39af2),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['total_easy_questions']) - double.parse(data['easy_questions_solved']) - double.parse(data['easy_problems_submitted']),
                              color: Color(0xffffb3ba),
                              width: 7,
                            ),
                          ],
                        ),
                          BarChartGroupData(
                          x: 1,
                          groupVertically: false,
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['medium_questions_solved']),
                              color: Color(0xff578eff),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['medium_problems_submitted']),
                              color: Color(0xffa39af2),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['total_medium_questions']) - double.parse(data['medium_questions_solved']) - double.parse(data['medium_problems_submitted']),
                              color: Color(0xffffb3ba),
                              width: 7,
                            ),
                          ],
                        ),
                          BarChartGroupData(
                          x: 2,
                          groupVertically: false,
                          barRods: [
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['hard_questions_solved']),
                              color: Color(0xff578eff),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['hard_problems_submitted']),
                              color: Color(0xffa39af2),
                              width: 7,
                            ),
                            BarChartRodData(
                              fromY: 0,
                              toY: double.parse(data['total_hard_questions']) - double.parse(data['hard_questions_solved']) - double.parse(data['hard_problems_submitted']),
                              color: Color(0xffffb3ba),
                              width: 7,
                            ),
                          ],
                        )
                          ]
                        )
                      ),
                    ),
                ],
              ) : SizedBox(height: 0, width: 0,),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatsBasicBox(
                    height: size.height * 0.125,
                    width: size.width * 0.29,
                    heading: "Contribution Problems",
                    description: data['contribution_problems'],
                    headingColor: ColorConstant.LeetCode,
                    descriptionColor: ColorConstant.LeetCode.withOpacity(0.6),
                  ),
                  StatsBasicBox(
                    height: size.height * 0.125,
                    width: size.width * 0.29,
                    heading: "Contribution Points",
                    description: data['contribution_points'],
                    headingColor: ColorConstant.LeetCode,
                    descriptionColor: ColorConstant.LeetCode.withOpacity(0.6),
                  ),
                  StatsBasicBox(
                    height: size.height * 0.125,
                    width: size.width * 0.29,
                    heading: "Contribution Testcases",
                    description: data['contribution_testcases'],
                    headingColor: ColorConstant.LeetCode,
                    descriptionColor: ColorConstant.LeetCode.withOpacity(0.6),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
