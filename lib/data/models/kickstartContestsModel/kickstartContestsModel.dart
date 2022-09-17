// To parse this JSON data, do
//
//     final kickStartContests = kickStartContestsFromJson(jsonString);

import 'dart:convert';

List<KickStartContests> kickStartContestsFromJson(String str) => List<KickStartContests>.from(json.decode(str).map((x) => KickStartContests.fromJson(x)));

String kickStartContestsToJson(List<KickStartContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KickStartContests {
  KickStartContests({
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

  factory KickStartContests.fromJson(Map<String, dynamic> json) => KickStartContests(
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
