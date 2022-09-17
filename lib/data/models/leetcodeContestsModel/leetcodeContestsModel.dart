// To parse this JSON data, do
//
//     final leetCodeContests = leetCodeContestsFromJson(jsonString);

import 'dart:convert';

List<LeetCodeContests> leetCodeContestsFromJson(String str) => List<LeetCodeContests>.from(json.decode(str).map((x) => LeetCodeContests.fromJson(x)));

String leetCodeContestsToJson(List<LeetCodeContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeetCodeContests {
  LeetCodeContests({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? in24Hours;
  String? status;

  factory LeetCodeContests.fromJson(Map<String, dynamic> json) => LeetCodeContests(
    name: json["name"],
    url: json["url"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    in24Hours: json["in_24_hours"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "start_time": startTime,
    "end_time": endTime,
    "duration": duration,
    "in_24_hours": in24Hours,
    "status": status,
  };
}
