// To parse this JSON data, do
//
//     final atcoderContests = atcoderContestsFromJson(jsonString);

import 'dart:convert';

List<AtcoderContests> atcoderContestsFromJson(String str) => List<AtcoderContests>.from(json.decode(str).map((x) => AtcoderContests.fromJson(x)));

String atcoderContestsToJson(List<AtcoderContests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AtcoderContests {
  AtcoderContests({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.ratedRange,
    this.in24Hours,
    this.status,
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? ratedRange;
  String? in24Hours;
  String? status;

  factory AtcoderContests.fromJson(Map<String, dynamic> json) => AtcoderContests(
    name: json["name"],
    url: json["url"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    ratedRange: json["rated_range"],
    in24Hours: json["in_24_hours"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
    "start_time": startTime,
    "end_time": endTime,
    "duration": duration,
    "rated_range": ratedRange,
    "in_24_hours": in24Hours,
    "status": status,
  };
}
