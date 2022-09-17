// To parse this JSON data, do
//
//     final hackerrankContests = hackerrankContestsFromJson(jsonString);

import 'dart:convert';

List<HackerrankContests> hackerrankContestsFromJson(String str) => List<HackerrankContests>.from(json.decode(str).map((x) => HackerrankContests.fromJson(x)));

String hackerrankContestsToJson(List<HackerrankContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HackerrankContests {
  HackerrankContests({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.type,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? type;
  String? in24Hours;
  String? status;

  factory HackerrankContests.fromJson(Map<String, dynamic> json) => HackerrankContests(
    name: json["name"],
    url: json["url"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    type: json["type_"],
    in24Hours: json["in_24_hours"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "start_time": startTime,
    "end_time": endTime,
    "duration": duration,
    "type_": type,
    "in_24_hours": in24Hours,
    "status": status,
  };
}
