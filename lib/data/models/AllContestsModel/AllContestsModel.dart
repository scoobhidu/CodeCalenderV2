import 'package:codecalenderv2/data/models/atcoderContestsModel/atcoderContestsModel.dart';
import 'package:codecalenderv2/data/models/codechefContestsModel/codechefContestsModel.dart';
import 'package:codecalenderv2/data/models/codeforcesContestsModel/codeforcesContestsModel.dart';
import 'package:codecalenderv2/data/models/hackerearthContestsModel/hackerearthContestsModel.dart';
import 'package:codecalenderv2/data/models/hackerrankContestsModel/hackerrankContestModel.dart';
import 'package:codecalenderv2/data/models/kickstartContestsModel/kickstartContestsModel.dart';
import 'package:codecalenderv2/data/models/leetcodeContestsModel/leetcodeContestsModel.dart';

class AllContests {
  AllContests({
    required this.ccContests,
    required this.cfContests,
    required this.lcContests,
    required this.acContests,
    required this.hrContests,
    required this.heContests,
    required this.kcContests,
    required this.contestsIn24Hrs,
    required this.contestsThisWeek,
    required this.contestsThisMonth,
    required this.contestsThisYear,
    required this.liveContests,
    required this.allContests,
  });

  List<CodechefContests>? ccContests;
  List<CodeforcesContests>? cfContests;
  List<LeetCodeContests>? lcContests;
  List<AtcoderContests>? acContests;
  List<HackerrankContests>? hrContests;
  List<HackerearthContests>? heContests;
  List<KickStartContests>? kcContests;
  List? contestsIn24Hrs;
  List? contestsThisWeek;
  List? contestsThisMonth;
  List? contestsThisYear;
  List? liveContests;
  List? allContests;
}
