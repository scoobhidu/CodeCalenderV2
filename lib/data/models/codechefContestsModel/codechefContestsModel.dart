// To parse this JSON data, do
//
//     final codechefContests = codechefContestsFromJson(jsonString);

import 'dart:convert';

List<CodechefContests> codechefContestsFromJson(String str) => List<CodechefContests>.from(json.decode(str).map((x) => CodechefContests.fromJson(x)));

String codechefContestsToJson(List<CodechefContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CodechefContests {
  CodechefContests({
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

  factory CodechefContests.fromJson(Map<String, dynamic> json) => CodechefContests(
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
