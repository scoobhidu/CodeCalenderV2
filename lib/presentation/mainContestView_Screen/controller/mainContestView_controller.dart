import 'dart:io';

import 'package:codecalenderv2/data/models/codeforcesDetailsModel/codeforcesDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../data/models/AllContestsModel/AllContestsModel.dart';
import '../widgets/contestButtons.dart';
import '/core/app_export.dart';

class MainContestViewController extends GetxController {
  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    allContests.value = contestWidgetLists.allContestsData;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  TextEditingController searchByNameText = TextEditingController();

  Rx<bool> searchByName = false.obs;
  Rx<bool> searchByPlatform = false.obs;
  Rx<bool> displayByTimeline = true.obs;

  Rx<bool> ccSelected = false.obs;
  Rx<bool> cfSelected = false.obs;
  Rx<bool> lcSelected = false.obs;
  Rx<bool> acSelected = false.obs;
  Rx<bool> heSelected = false.obs;
  Rx<bool> hrSelected = false.obs;
  Rx<bool> kcSelected = false.obs;

  Rx<bool> notEmptyText = false.obs;

  AllContests contestWidgetLists = Get.arguments;

  late RxList<ContestButton> allContestsButtons = <ContestButton>[].obs;

  late RxList allContests = [].obs;

  searchContestByName(String str){
    allContests.value = contestWidgetLists.allContestsData.where((element) {
      var title = element.name.toString()?.length == 0? '' : element.name?.toLowerCase();
      var query = str.toLowerCase();

      return title!.contains(query);
    }).toList();

    allContestsButtons.clear();

    for(var d in allContests.value){
      allContestsButtons.value.add(ContestButton(contest: d));
    }

    print(allContestsButtons.value);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
