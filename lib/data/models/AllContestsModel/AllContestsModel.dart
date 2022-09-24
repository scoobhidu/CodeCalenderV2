import '../../../presentation/mainContestView_Screen/widgets/contestButtons.dart';
import '../ContestsModel/ContestsModel.dart';

class AllContests {
  AllContests({
    required this.allContestsData,
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

  List<Contests> allContestsData;

  List<ContestButton>? ccContests;
  List<ContestButton>? cfContests;
  List<ContestButton>? lcContests;
  List<ContestButton>? acContests;
  List<ContestButton>? hrContests;
  List<ContestButton>? heContests;
  List<ContestButton>? kcContests;
  List<ContestButton>? contestsIn24Hrs;
  List<ContestButton>? contestsThisWeek;
  List<ContestButton>? contestsThisMonth;
  List<ContestButton>? contestsThisYear;
  List<ContestButton>? liveContests;
  List<ContestButton>? allContests;
}
