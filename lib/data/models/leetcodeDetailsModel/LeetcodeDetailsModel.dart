class LeetcodeDetails {
  LeetcodeDetails({
    required this.status,
    required this.ranking,
    required this.totalProblemsSubmitted,
    required this.totalProblemsSolved,
    required this.acceptanceRate,
    required this.easyProblemsSubmitted,
    required this.easyQuestionsSolved,
    required this.easyAcceptanceRate,
    required this.totalEasyQuestions,
    required this.mediumProblemsSubmitted,
    required this.mediumQuestionsSolved,
    required this.mediumAcceptanceRate,
    required this.totalMediumQuestions,
    required this.hardProblemsSubmitted,
    required this.hardQuestionsSolved,
    required this.hardAcceptanceRate,
    required this.totalHardQuestions,
    required this.contributionPoints,
    required this.contributionProblems,
    required this.contributionTestcases,
    required this.reputation,
  });
  late final String status;
  late final String ranking;
  late final String totalProblemsSubmitted;
  late final String totalProblemsSolved;
  late final String acceptanceRate;
  late final String easyProblemsSubmitted;
  late final String easyQuestionsSolved;
  late final String easyAcceptanceRate;
  late final String totalEasyQuestions;
  late final String mediumProblemsSubmitted;
  late final String mediumQuestionsSolved;
  late final String mediumAcceptanceRate;
  late final String totalMediumQuestions;
  late final String hardProblemsSubmitted;
  late final String hardQuestionsSolved;
  late final String hardAcceptanceRate;
  late final String totalHardQuestions;
  late final String contributionPoints;
  late final String contributionProblems;
  late final String contributionTestcases;
  late final String reputation;

  LeetcodeDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    ranking = json['ranking'];
    totalProblemsSubmitted = json['total_problems_submitted'];
    totalProblemsSolved = json['total_problems_solved'];
    acceptanceRate = json['acceptance_rate'];
    easyProblemsSubmitted = json['easy_problems_submitted'];
    easyQuestionsSolved = json['easy_questions_solved'];
    easyAcceptanceRate = json['easy_acceptance_rate'];
    totalEasyQuestions = json['total_easy_questions'];
    mediumProblemsSubmitted = json['medium_problems_submitted'];
    mediumQuestionsSolved = json['medium_questions_solved'];
    mediumAcceptanceRate = json['medium_acceptance_rate'];
    totalMediumQuestions = json['total_medium_questions'];
    hardProblemsSubmitted = json['hard_problems_submitted'];
    hardQuestionsSolved = json['hard_questions_solved'];
    hardAcceptanceRate = json['hard_acceptance_rate'];
    totalHardQuestions = json['total_hard_questions'];
    contributionPoints = json['contribution_points'];
    contributionProblems = json['contribution_problems'];
    contributionTestcases = json['contribution_testcases'];
    reputation = json['reputation'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['ranking'] = ranking;
    _data['total_problems_submitted'] = totalProblemsSubmitted;
    _data['total_problems_solved'] = totalProblemsSolved;
    _data['acceptance_rate'] = acceptanceRate;
    _data['easy_problems_submitted'] = easyProblemsSubmitted;
    _data['easy_questions_solved'] = easyQuestionsSolved;
    _data['easy_acceptance_rate'] = easyAcceptanceRate;
    _data['total_easy_questions'] = totalEasyQuestions;
    _data['medium_problems_submitted'] = mediumProblemsSubmitted;
    _data['medium_questions_solved'] = mediumQuestionsSolved;
    _data['medium_acceptance_rate'] = mediumAcceptanceRate;
    _data['total_medium_questions'] = totalMediumQuestions;
    _data['hard_problems_submitted'] = hardProblemsSubmitted;
    _data['hard_questions_solved'] = hardQuestionsSolved;
    _data['hard_acceptance_rate'] = hardAcceptanceRate;
    _data['total_hard_questions'] = totalHardQuestions;
    _data['contribution_points'] = contributionPoints;
    _data['contribution_problems'] = contributionProblems;
    _data['contribution_testcases'] = contributionTestcases;
    _data['reputation'] = reputation;
    return _data;
  }
}