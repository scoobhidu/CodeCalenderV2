import 'dart:convert';

import 'package:codecalenderv2/data/models/AllContestsModel/AllContestsModel.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/atcoderContestsModel/atcoderContestsModel.dart';
import '../../../data/models/codechefContestsModel/codechefContestsModel.dart';
import '../../../data/models/codeforcesContestsModel/codeforcesContestsModel.dart';
import '../../../data/models/hackerearthContestsModel/hackerearthContestsModel.dart';
import '../../../data/models/hackerrankContestsModel/hackerrankContestModel.dart';
import '../../../data/models/kickstartContestsModel/kickstartContestsModel.dart';
import '../../../data/models/leetcodeContestsModel/leetcodeContestsModel.dart';
import '/core/app_export.dart';

class ContestLoadingController extends GetxController {
  @override

  List contestsIn24Hrs = [];
  List contestsThisWeek = [];
  List contestsThisMonth = [];
  List contestsThisYear = [];
  List liveContests = [];

  List allContests = [];



  void onInit() async {
    super.onInit();
    List<CodechefContests> cc = await fetchCodechefContests();
    List<CodeforcesContests> cf = await fetchCodeforcesContests();
    List<LeetCodeContests> lc = await fetchLeetcodeContests();
    List<AtcoderContests> ac = await fetchAtcoderContests();
    List<KickStartContests> kc = await fetchKickstartContests();
    List<HackerrankContests> hr = await fetchHackerrankContests();
    List<HackerearthContests> he = await fetchHackerearthContests();

    // ! Sorting the lists once they are ready according to increasing date order

    cc.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    cf.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    lc.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    ac.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    kc.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    hr.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    he.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    allContests.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    liveContests.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsIn24Hrs.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisWeek.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisMonth.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisYear.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));

    AllContests allContestLists = AllContests(
        ccContests: cc,
        cfContests: cf,
        lcContests: lc,
        acContests: ac,
        hrContests: hr,
        heContests: he,
        kcContests: kc,
        contestsIn24Hrs: contestsIn24Hrs,
        contestsThisWeek: contestsThisWeek,
        contestsThisMonth: contestsThisMonth,
        contestsThisYear: contestsThisYear,
        liveContests: liveContests,
        allContests: allContests
    );

    // for (var d in allContestLists.ccContests!){
    //   print(d.startTime);
    // }

    print("Navigating to contest view screen now");
    onTapBtnProceed(allContestLists);
  }

  Future fetchCodechefContests() async {
    try {
      var list = codechefContestsFromJson(await Get.find<ApiClient>().fetchCodechefContest());

      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
        // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
            // && DateTime.parse(d.startTime!).month != DateTime.now().month
            // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchCodeforcesContests() async {
    try {
      var list = codeforcesContestsFromJson(await Get.find<ApiClient>().fetchCodeforcesContest());
      // for loop for data cleaning
      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchAtcoderContests() async {
    try {
      var list = atcoderContestsFromJson(await Get.find<ApiClient>().fetchAtcoderContest());
      // for loop for data cleaning

      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchHackerrankContests() async {
    try {
      var list = hackerrankContestsFromJson(await Get.find<ApiClient>().fetchHackerRankContest());
      // for loop for data cleaning

      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchHackerearthContests() async {
    try {
      var list = hackerearthContestsFromJson(await Get.find<ApiClient>().fetchHackerearthContest());
      // for loop for data cleaning

      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchLeetcodeContests() async {
    try {
      var list = leetCodeContestsFromJson(await Get.find<ApiClient>().fetchLeetCodeContest());
      // for loop for data cleaning
      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  Future fetchKickstartContests() async {
    try {
      var list = kickStartContestsFromJson(await Get.find<ApiClient>().fetchKickstartContest());
      // for loop for data cleaning

      for(var d in list){
        if(d.startTime!.endsWith(" UTC") || d.startTime!.endsWith(".000Z")){
          d.startTime = d.startTime!.substring(0, 19) + "-0530";
        }
        if(d.endTime!.endsWith(" UTC") || d.endTime!.endsWith(".000Z")){
          d.endTime = d.endTime!.substring(0, 19) + "-0530";
        }

        if(d.status == "CODING"){
          liveContests.add(d);
        } else if(d.in24Hours == 'Yes'){
          contestsIn24Hrs.add(d);
        } else if((DateTime.parse(d.startTime!).difference(DateTime.now())).inDays >= 1
            && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays <= 7){
          contestsThisWeek.add(d);
        } else if(DateTime.parse(d.startTime!).month == DateTime.now().month){
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisMonth.add(d);
        } else if(DateTime.parse(d.startTime!).year == DateTime.now().year){
          // && DateTime.parse(d.startTime!).month != DateTime.now().month
          // && (DateTime.parse(d.startTime!).difference(DateTime.now())).inDays > 7)
          contestsThisYear.add(d);
        }

        allContests.add(d);
      }

      return list;
    } catch (err) {
      if (err != null) {
        print(err);
        // Show a pop up or an error screen
      }
    }
  }

  onTapBtnProceed(AllContests obj){
    Get.toNamed(AppRoutes.mainContestViewScreen, arguments: obj);
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
