import 'dart:convert';
import 'dart:io';

import 'package:codecalenderv2/core/utils/progress_dialog_utils.dart';
import 'package:codecalenderv2/data/models/AllContestsModel/AllContestsModel.dart';
import 'package:codecalenderv2/data/models/platformUserNameModels/platformUsernameModel.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/contestButtons.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/ContestsModel/ContestsModel.dart';
import '/core/app_export.dart';

class StatsLoadingController extends GetxController {
  @override

  void onInit() async {
    super.onInit();

    print(myData.codechef);
    print(myData.codeforces);
    // print(myData.atCoder);
    print(myData.leetcode);
    print(myData.spoj);
    print(myData.interviewBit);

    List<Map> userAvailableSites = [];

    if(myData.codechef != ''){
      userAvailableSites.add(await fetchCodechefProgress());
    } else {
      userAvailableSites.add({"available": 'No'});
    }

    if(myData.codeforces != '') {
      userAvailableSites.add(await fetchCodeforcesProgress());
    } else {
      userAvailableSites.add({"available": 'No'});
    }

    if(myData.leetcode != '') {
      userAvailableSites.add(await fetchLeetcodeProgress());
    } else {
      userAvailableSites.add({"available": 'No'});
    }

    // if(myData.atCoder != '') {
    //   userAvailableSites.add(await fetchAtcoderProgress());
    // } else {
    //   userAvailableSites.add({"available": 'No'});
    // }

    if(myData.spoj != '') {
      userAvailableSites.add(await fetchSPOJProgress());
    } else {
      userAvailableSites.add({"available": 'No'});
    }

    if(myData.interviewBit != '') {
      userAvailableSites.add(await fetchInterviewBitProgress());
    } else {
      userAvailableSites.add({"available": 'No'});
    }

    print(userAvailableSites);
    Get.toNamed(AppRoutes.dashboardScreen, arguments: userAvailableSites);
  }

  final myData = PlatformUsernameModel.fromJson(Get.arguments);

  @override
  void onReady() {
    super.onReady();
  }


  Future fetchCodechefProgress() async {
    try {
      var list = await Get.find<ApiClient>().fetchCodechefProgress(myData.codechef);
      return list;
    } catch (e) {
      print(e);
    }
  }

  Future fetchCodeforcesProgress() async {
    try {
      var list = await Get.find<ApiClient>().fetchCodeforcesProgress(myData.codeforces);
      return list;
    } catch (e) {
      print(e);
    }
  }

  Future fetchLeetcodeProgress() async {
    try {
      var list = await Get.find<ApiClient>().fetchLeetcodeProgress(myData.leetcode);
      return list;
    } catch (e) {
      print(e);
    }
  }

  // Future fetchAtcoderProgress() async {
  //   try {
  //     var list = await Get.find<ApiClient>().fetchAtcoderProgress(myData.atCoder);
  //     return list;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future fetchSPOJProgress() async {
    try {
      var list = await Get.find<ApiClient>().fetchSPOJProgress(myData.spoj);
      return list;
    } catch (e) {
      print(e);
    }
  }

  Future fetchInterviewBitProgress() async {
    try {
      var list = await Get.find<ApiClient>().fetchInterviewBitProgress(myData.interviewBit);
      return list;
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
