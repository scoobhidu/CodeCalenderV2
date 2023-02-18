class PlatformUsernameModel {
  PlatformUsernameModel({
    required this.codechef,
    required this.codeforces,
    required this.leetcode,
    // required this.atCoder,
    required this.interviewBit,
    required this.spoj,
  });

  late final String codechef;
  late final String codeforces;
  late final String leetcode;
  // late final String atCoder;
  late final String interviewBit;
  late final String spoj;

  PlatformUsernameModel.fromJson(Map<String, dynamic> json){
    codechef = json['codechef'];
    codeforces = json['codeforces'];
    leetcode = json['leetcode'];
    // atCoder = json['atcoder'];
    interviewBit = json['interviewbit'];
    spoj = json['spoj'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['codechef'] = codechef;
    _data['codeforces'] = codeforces;
    _data['leetcode'] = leetcode;
    // _data['atcoder'] = atCoder;
    _data['interviewbit'] = interviewBit;
    _data['spoj'] = spoj;
    return _data;
  }
}