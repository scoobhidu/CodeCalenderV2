class AtcoderDetails {
  AtcoderDetails({
    required this.status,
    required this.username,
    required this.platform,
    required this.rating,
    required this.highest,
    required this.rank,
    required this.level,
  });
  late final String status;
  late final String username;
  late final String platform;
  late final int rating;
  late final int highest;
  late final int rank;
  late final String level;

  AtcoderDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    username = json['username'];
    platform = json['platform'];
    rating = json['rating'];
    highest = json['highest'];
    rank = json['rank'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['username'] = username;
    _data['platform'] = platform;
    _data['rating'] = rating;
    _data['highest'] = highest;
    _data['rank'] = rank;
    _data['level'] = level;
    return _data;
  }
}