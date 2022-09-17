// To parse this JSON data, do
//
//     final hackerearthContests = hackerearthContestsFromJson(jsonString);

import 'dart:convert';

List<HackerearthContests> hackerearthContestsFromJson(String str) => List<HackerearthContests>.from(json.decode(str).map((x) => HackerearthContests.fromJson(x)));

String hackerearthContestsToJson(List<HackerearthContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HackerearthContests {
  HackerearthContests({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.type_,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? type_;
  String? in24Hours;
  String? status;

  factory HackerearthContests.fromJson(Map<String, dynamic> json) => HackerearthContests(
    name: json["name"],
    url: json["url"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    type_: json["type_"],
    in24Hours: json["in_24_hours"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "start_time": startTime,
    "end_time": endTime,
    "duration": duration,
    "type_": type_,
    "in_24_hours": in24Hours,
    "status": status,
  };
}