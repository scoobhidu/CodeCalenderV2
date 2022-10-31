class CodeForcesDetails {
  CodeForcesDetails({
    required this.status,
    required this.username,
    required this.platform,
    required this.rating,
    required this.max_rating,
    required this.rank,
    required this.max_rank,
    required this.contests,
  });
  late final String status;
  late final String username;
  late final String platform;
  late final int rating;
  late final int max_rating;
  late final String rank;
  late final String max_rank;
  late final List<ContestsParticipated> contests;

  CodeForcesDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    username = json['username'];
    platform = json['platform'];
    if(json['rating'] != "Unrated"){
      rating = json['rating'];
    } else {
      rating = -1;
    }
    if(json['max rating'] != "Unrated"){
      max_rating = json['max rating'];
    } else {
      max_rating = -1;
    }
    rank = json['rank'];
    max_rank = json['max rank'];
    if(json['contests'].isEmpty()){
      contests = [];
    } else {
      contests = List.from(json['contests']).map((e)=>ContestsParticipated.fromJson(e)).toList();
    }

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['username'] = username;
    _data['platform'] = platform;
    _data['rating'] = rating;
    _data['max rating'] = max_rating;
    _data['rank'] = rank;
    _data['max rank'] = max_rank;
    _data['contests'] = contests.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ContestsParticipated {
  ContestsParticipated({
    required this.Contest,
    required this.Rank,
    required this.Solved,
    required this.Rating_Change,
    required this.New_Rating,
  });
  late final String Contest;
  late final String Rank;
  late final String Solved;
  late final String Rating_Change;
  late final String New_Rating;

  ContestsParticipated.fromJson(Map<String, dynamic> json){
    Contest = json['Contest'];
    Rank = json['Rank'];
    Solved = json['Solved'];
    Rating_Change = json['Rating Change'];
    New_Rating = json['New Rating'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Contest'] = Contest;
    _data['Rank'] = Rank;
    _data['Solved'] = Solved;
    _data['Rating Change'] = Rating_Change;
    _data['New Rating'] = New_Rating;
    return _data;
  }
}