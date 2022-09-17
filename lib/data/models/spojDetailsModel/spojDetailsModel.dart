class SPOJDetails {
  SPOJDetails({
    required this.status,
    required this.username,
    required this.platform,
    required this.points,
    required this.rank,
    required this.solved,
    required this.todo,
    required this.join_data,
    required this.institute,
  });
  late final String status;
  late final String username;
  late final String platform;
  late final double points;
  late final int rank;
  late final List<String> solved;
  late final List<String> todo;
  late final String join_data;
  late final String institute;

  SPOJDetails.fromJson(Map<String, dynamic> json){
    status = json['status'];
    username = json['username'];
    platform = json['platform'];
    points = json['points'];
    rank = json['rank'];
    solved = List.castFrom<dynamic, String>(json['solved']);
    todo = List.castFrom<dynamic, String>(json['todo']);
    join_data = json['join data'];
    institute = json['institute'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['username'] = username;
    _data['platform'] = platform;
    _data['points'] = points;
    _data['rank'] = rank;
    _data['solved'] = solved;
    _data['todo'] = todo;
    _data['join data'] = join_data;
    _data['institute'] = institute;
    return _data;
  }
}