import 'dart:convert';
import 'dart:io';

import 'package:codecalenderv2/core/utils/progress_dialog_utils.dart';
import 'package:codecalenderv2/data/models/AllContestsModel/AllContestsModel.dart';
import 'package:codecalenderv2/data/models/InterviewbitDetailsModel/InterviewbitDetailsModel.dart';
import 'package:codecalenderv2/data/models/atcoderDetailsModel/atcoderDetailsModel.dart';
import 'package:codecalenderv2/data/models/codeforcesDetailsModel/codeforcesDetailsModel.dart';
import 'package:codecalenderv2/data/models/leetcodeDetailsModel/LeetcodeDetailsModel.dart';
import 'package:codecalenderv2/data/models/platformUserNameModels/platformUsernameModel.dart';
import 'package:codecalenderv2/data/models/spojDetailsModel/spojDetailsModel.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/contestButtons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/ContestsModel/ContestsModel.dart';
import '/core/app_export.dart';

class DashboardController extends GetxController with GetSingleTickerProviderStateMixin {
  @override

  void onInit() async {
    print("myData is $myData");
    if(myData[0]["available"] != "No") {
      ccData = myData[0];
      availableSites.add('Codechef');
    }
    if(myData[1]["available"] != "No") {
      cfData = myData[1];
      availableSites.add('Codeforces');
    }
    if(myData[2]["available"] != "No") {
      lcData = myData[2];
      availableSites.add('Leetcode');
    }
    if(myData[3]["available"] != "No") {
      acData = myData[3];
      availableSites.add('Atcoder');
    }
    if(myData[4]["available"] != "No") {
      spojData = myData[4];
      availableSites.add('SPOJ');
    }
    if(myData[5]["available"] != "No") {
      ibData = myData[5];
      availableSites.add('InterviewBit');
    }

    tabController = TabController(
        length: availableSites.length,
        vsync: this
    ).obs;
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
  late final acData;
  // myData[4] -> SPOJ
  late final spojData;
  // myData[5] -> InterviewBit
  late final ibData;

  late List<String> availableSites = [];
  late Rx<Color> tabColor = ColorConstant.red700.obs;
  late Rx<TabController> tabController = TabController(length: 0, vsync: this).obs;
  Rx<int> LeetCodeselectedPieGraph = (1).obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
