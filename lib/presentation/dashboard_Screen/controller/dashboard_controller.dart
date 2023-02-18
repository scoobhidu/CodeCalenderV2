import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  @override

  void onInit() async {
    print("myData is $myData");

    if(myData[0]["available"] != "No") {
      ccData = myData[0];
      availableSites.add('Codechef');

      ccData["avg_rating"] = 0;
      ccData["avg_rank"] = 0;

      for(int i = 0; i < ccData["contest_ratings"].length; i++){
        CCratingData.add(FlSpot(double.parse(i.toString()), double.parse(ccData["contest_ratings"][i]["rating"])));
        CCrankData.add(FlSpot(double.parse(i.toString()), double.parse(ccData["contest_ratings"][i]["rank"])));

        ccData["avg_rating"] += double.parse(ccData["contest_ratings"][i]["rating"]);
        ccData["avg_rank"] += double.parse(ccData["contest_ratings"][i]["rank"]);
      }

      ccData["avg_rating"] /= ccData["contest_ratings"].length;
      ccData["avg_rank"] /= ccData["contest_ratings"].length;

      ccData["avg_rating"] /= ccData["contest_ratings"].length;
      ccData["avg_rank"] /= ccData["contest_ratings"].length;
    }
    if(myData[1]["available"] != "No") {
      cfData = myData[1];
      availableSites.add('Codeforces');

      cfData["avg_rating_change"] = 0;
      cfData["avg_solved_in_contest"] = 0;

      for(int i = 0; i < cfData["contests"].length; i++){
        CFratingData.add(FlSpot(double.parse(i.toString()), double.parse(cfData["contests"][i]["New Rating"])));
        CFrankData.add(FlSpot(double.parse(i.toString()), double.parse(cfData["contests"][i]["Rank"])));

        cfData["avg_rating_change"] += double.parse(cfData["contests"][i]["Rating Change"]);
        cfData["avg_solved_in_contest"] += double.parse(cfData["contests"][i]["Rank"]);
      }

      CFrankData = new List.from(CFrankData.reversed);
      CFratingData = new List.from(CFratingData.reversed);

      cfData["avg_rating_change"] /= cfData["contests"].length;
      cfData["avg_solved_in_contest"] /= cfData["contests"].length;

      cfData["avg_rating_change"] = cfData["avg_rating_change"];
      cfData["avg_solved_in_contest"] = cfData["avg_solved_in_contest"];
    }
    if(myData[2]["available"] != "No") {
      lcData = myData[2];
      availableSites.add('Leetcode');
    }
    // if(myData[3]["available"] != "No") {
    //   acData = myData[3];
    //   availableSites.add('Atcoder');
    // }
    if(myData[3]["available"] != "No") {
      spojData = myData[3];
      availableSites.add('SPOJ');
    }
    if(myData[4]["available"] != "No") {
      ibData = myData[4];
      availableSites.add('InterviewBit');
    }

    tabController = TabController(
        length: availableSites.length,
        vsync: this
    )..addListener(() {
      tabIndex.value = tabController.index;
      ContestColor();
    });
    super.onInit();
  }

  final myData = Get.arguments;
  // myData[0] -> Codechef
  late final ccData;
  // myData[1] -> Codeforces
  late final cfData;
  // myData[2] -> Leetcode
  late final lcData;
  // myData[3] -> Atcoder
  // late final acData;

  // myData[4] -> SPOJ
  late final spojData;
  // myData[5] -> InterviewBit
  late final ibData;

  List<FlSpot> CCratingData = [];
  List<FlSpot> CCrankData = [];

  List<FlSpot> CFratingData = [];
  List<FlSpot> CFrankData = [];

  late List<String> availableSites = [];
  late Rx<Color> tabColor = ColorConstant.CodeChef.obs;
  late TabController tabController = TabController(length: 0, vsync: this);
  Rx<int> tabIndex = 0.obs;
  Rx<int> LeetCodeselectedPieGraph = (1).obs;

  ContestColor(){
    if(availableSites[tabIndex.value] == 'Codechef'){
      tabColor.value = ColorConstant.CodeChef;
    } else if (availableSites[tabIndex.value] == 'Codeforces'){
      tabColor.value = ColorConstant.CodeForces;
    } else if (availableSites[tabIndex.value] == 'Leetcode'){
      tabColor.value = ColorConstant.LeetCode;
    } else if (availableSites[tabIndex.value] == 'Atcoder'){
      tabColor.value = ColorConstant.AtCoder;
    } else if (availableSites[tabIndex.value] == 'SPOJ'){
      tabColor.value = ColorConstant.SPOJ;
    } else if (availableSites[tabIndex.value] == 'InterviewBit'){
      tabColor.value = ColorConstant.InterviewBit;
    } else {
      tabColor.value = ColorConstant.CodeChef;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
