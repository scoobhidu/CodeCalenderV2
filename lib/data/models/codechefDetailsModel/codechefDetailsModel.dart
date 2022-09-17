class CodechefDetails {
  CodechefDetails({
    required this.status,
    required this.rating,
    required this.stars,
    required this.highestRating,
    required this.globalRank,
    required this.countryRank,
    required this.userDetails,
    required this.contests,
    required this.contestRatings,
    required this.fullySolved,
    required this.partiallySolved,
  });
  late final String status;
  late final int rating;
  late final String stars;
  late final int highestRating;
  late final String globalRank;
  late final String countryRank;
  late final UserDetails userDetails;
  late final List<dynamic> contests;
  late final List<ContestRatings> contestRatings;
  late final FullySolved fullySolved;
  late final PartiallySolved partiallySolved;

  CodechefDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    rating = json['rating'];
    stars = json['stars'];
    highestRating = json['highest_rating'];
    globalRank = json['global_rank'];
    countryRank = json['country_rank'];
    userDetails = UserDetails.fromJson(json['user_details']);
    contests = List.castFrom<dynamic, dynamic>(json['contests']);
    contestRatings = List.from(json['contest_ratings']).map((e)=>ContestRatings.fromJson(e)).toList();
    fullySolved = FullySolved.fromJson(json['fully_solved']);
    partiallySolved = PartiallySolved.fromJson(json['partially_solved']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['rating'] = rating;
    _data['stars'] = stars;
    _data['highest_rating'] = highestRating;
    _data['global_rank'] = globalRank;
    _data['country_rank'] = countryRank;
    _data['user_details'] = userDetails.toJson();
    _data['contests'] = contests;
    _data['contest_ratings'] = contestRatings.map((e)=>e.toJson()).toList();
    _data['fully_solved'] = fullySolved.toJson();
    _data['partially_solved'] = partiallySolved.toJson();
    return _data;
  }
}

class UserDetails {
  UserDetails({
    required this.name,
    required this.username,
    required this.country,
    required this.student_professional,
    required this.institution,
    required this.codechef_pro_plan,
  });
  late final String name;
  late final String username;
  late final String country;
  late final String student_professional;
  late final String institution;
  late final String codechef_pro_plan;

  UserDetails.fromJson(Map<String, dynamic> json){
    name = json['name'];
    username = json['username'];
    country = json['country'];
    student_professional = json['student/professional'];
    institution = json['institution'];
    codechef_pro_plan = json['codechef pro plan'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['username'] = username;
    _data['country'] = country;
    _data['student/professional'] = student_professional;
    _data['institution'] = institution;
    _data['codechef pro plan'] = codechef_pro_plan;
    return _data;
  }
}

class ContestRatings {
  ContestRatings({
    required this.code,
    required this.getyear,
    required this.getmonth,
    required this.getday,
    required this.reason,
    required this.penalisedIn,
    required this.rating,
    required this.rank,
    required this.name,
    required this.endDate,
  });
  late final String code;
  late final String getyear;
  late final String getmonth;
  late final String getday;
  late final String reason;
  late final List<String> penalisedIn;
  late final String rating;
  late final String rank;
  late final String name;
  late final String endDate;

  ContestRatings.fromJson(Map<String, dynamic> json){
    code = json['code'];
    getyear = json['getyear'];
    getmonth = json['getmonth'];
    getday = json['getday'];
    reason = json['reason'];
    penalisedIn = json['penalised_in'];
    rating = json['rating'];
    rank = json['rank'];
    name = json['name'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['getyear'] = getyear;
    _data['getmonth'] = getmonth;
    _data['getday'] = getday;
    _data['reason'] = reason;
    _data['penalised_in'] = penalisedIn;
    _data['rating'] = rating;
    _data['rank'] = rank;
    _data['name'] = name;
    _data['end_date'] = endDate;
    return _data;
  }
}

class FullySolved {
  FullySolved({
    required this.count,
  });
  late final int count;

  FullySolved.fromJson(Map<String, dynamic> json){
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    return _data;
  }
}
class PartiallySolved {
  PartiallySolved({
    required this.count,
  });
  late final int count;

  PartiallySolved.fromJson(Map<String, dynamic> json){
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['count'] = count;
    return _data;
  }
}

class Practice {
  Practice({
    required this.name,
    required this.link,
  });
  late final String name;
  late final String link;

  Practice.fromJson(Map<String, dynamic> json){
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['link'] = link;
    return _data;
  }
}