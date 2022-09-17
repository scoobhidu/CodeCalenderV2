class InterviewBitDetails {
  InterviewBitDetails({
    required this.status,
    required this.username,
    required this.platform,
    required this.rank,
    required this.score,
    required this.streak,
  });
  late final String status;
  late final String username;
  late final String platform;
  late final int rank;
  late final int score;
  late final String streak;

  InterviewBitDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    username = json['username'];
    platform = json['platform'];
    rank = json['rank'];
    score = json['score'];
    streak = json['streak'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['username'] = username;
    _data['platform'] = platform;
    _data['rank'] = rank;
    _data['score'] = score;
    _data['streak'] = streak;
    return _data;
  }
}