import 'dart:convert';

import 'package:codecalenderv2/core/utils/progress_dialog_utils.dart';
import 'package:codecalenderv2/data/models/AllContestsModel/AllContestsModel.dart';
import 'package:codecalenderv2/presentation/mainContestView_Screen/widgets/contestButtons.dart';

import '../../../data/apiClient/api_client.dart';
import '../../../data/models/ContestsModel/ContestsModel.dart';
import '/core/app_export.dart';

class ContestLoadingController extends GetxController {
  @override

  List<Contests> contestsIn24Hrs = [];
  List<Contests> contestsThisWeek = [];
  List<Contests> contestsThisMonth = [];
  List<Contests> contestsThisYear = [];
  List<Contests> liveContests = [];

  List<Contests> allContests = [];



  void onInit() async {
    super.onInit();

    List<Contests> cc = await fetchCodechefContests();
    List<Contests> cf = await fetchCodeforcesContests();
    List<Contests> lc = await fetchLeetcodeContests();
    List<Contests> ac = await fetchAtcoderContests();
    List<Contests> ks = await fetchKickstartContests();
    List<Contests> hr = await fetchHackerrankContests();
    List<Contests> he = await fetchHackerearthContests();

    List<ContestButton> ccWidgets = [];
    List<ContestButton> cfWidgets = [];
    List<ContestButton> lcWidgets = [];
    List<ContestButton> acWidgets = [];
    List<ContestButton> ksWidgets = [];
    List<ContestButton> hrWidgets = [];
    List<ContestButton> heWidgets = [];

    List<ContestButton> contestsIn24HrsWidgets = [];
    List<ContestButton> contestsThisWeekWidgets = [];
    List<ContestButton> contestsThisMonthWidgets = [];
    List<ContestButton> contestsThisYearWidgets = [];
    List<ContestButton> liveContestsWidgets = [];

    List<ContestButton> allContestsWidgets = [];

    // ! Sorting the lists once they are ready according to increasing date order

    cc.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    cf.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    lc.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    ac.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    ks.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    hr.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    he.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    allContests.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    liveContests.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsIn24Hrs.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisWeek.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisMonth.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));
    contestsThisYear.sort((a, b) => DateTime.parse(a.startTime!).compareTo(DateTime.parse(b.startTime!)));

    for(var d in cc){
      ccWidgets.add(ContestButton(contest: d));
    }
    for(var d in cf){
      cfWidgets.add(ContestButton(contest: d));
    }
    for(var d in lc){
      lcWidgets.add(ContestButton(contest: d));
    }
    for(var d in ac){
      acWidgets.add(ContestButton(contest: d));
    }
    for(var d in he){
      heWidgets.add(ContestButton(contest: d));
    }
    for(var d in hr){
      hrWidgets.add(ContestButton(contest: d));
    }
    for(var d in ks){
      ksWidgets.add(ContestButton(contest: d));
    }
    for(var d in contestsIn24Hrs){
      contestsIn24HrsWidgets.add(ContestButton(contest: d));
    }
    for(var d in contestsThisWeek){
      contestsThisWeekWidgets.add(ContestButton(contest: d));
    }
    for(var d in contestsThisMonth){
      contestsThisMonthWidgets.add(ContestButton(contest: d));
    }
    for(var d in contestsThisYear){
      contestsThisYearWidgets.add(ContestButton(contest: d));
    }
    for(var d in liveContests){
      liveContestsWidgets.add(ContestButton(contest: d));
    }
    for(var d in allContests){
      allContestsWidgets.add(ContestButton(contest: d));
    }

    AllContests allContestLists = AllContests(
        ccContests: ccWidgets,
        cfContests: cfWidgets,
        lcContests: lcWidgets,
        acContests: acWidgets,
        hrContests: hrWidgets,
        heContests: heWidgets,
        kcContests: ksWidgets,
        allContestsData: allContests,
        contestsIn24Hrs: contestsIn24HrsWidgets,
        contestsThisWeek: contestsThisWeekWidgets,
        contestsThisMonth: contestsThisMonthWidgets,
        contestsThisYear: contestsThisYearWidgets,
        liveContests: liveContestsWidgets,
        allContests: allContestsWidgets
    );

    // for (var d in allContestLists.ccContests!){
    //   print(d.startTime);
    // }

    print("Navigating to contest view screen now");
    onTapBtnProceed(allContestLists);
  }

  Future fetchCodechefContests() async {
    try {
      var list = contestsFromJson(await Get.find<ApiClient>().fetchCodechefContest());

      for(var d in list){
        d.site = 'CodeChef';

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchCodeforcesContest());
      // for loop for data cleaning
      for(var d in list){
        d.site = 'CodeForces';

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchAtcoderContest());
      // for loop for data cleaning

      for(var d in list){
        d.site = "AtCoder";

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchHackerRankContest());
      // for loop for data cleaning

      for(var d in list){
        d.site = "HackerRank";

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchHackerearthContest());
      // for loop for data cleaning

      for(var d in list){
        d.site = "HackerEarth";

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchLeetCodeContest());
      // for loop for data cleaning
      for(var d in list){
        d.site = "LeetCode";

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
      var list = contestsFromJson(await Get.find<ApiClient>().fetchKickstartContest());
      // for loop for data cleaning

      for(var d in list){
        d.site = "Kick Start";

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
