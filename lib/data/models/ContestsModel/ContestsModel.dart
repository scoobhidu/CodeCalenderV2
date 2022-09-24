// To parse this JSON data, do
//
//     final atcoderContests = atcoderContestsFromJson(jsonString);

import 'dart:convert';

List<Contests> contestsFromJson(String str) => List<Contests>.from(json.decode(str).map((x) => Contests.fromJson(x)));

String ContestsToJson(List<Contests> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contests {
  Contests({
    this.name,
    this.url,
    this.startTime,
    this.endTime,
    this.duration,
    this.ratedRange,
    this.in24Hours,
    this.status,
    this.site
  });

  String? name;
  String? url;
  String? startTime;
  String? endTime;
  String? duration;
  String? ratedRange;
  String? in24Hours;
  String? status;
  String? site;

  factory Contests.fromJson(Map<String, dynamic> json) => Contests(
    name: json["name"],
    url: json["url"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    duration: json["duration"],
    ratedRange: json["rated_range"],
    in24Hours: json["in_24_hours"],
    status: json["status"],
    site: json["site"] != null ? json["site"] : '',
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
    "site": site != '' ? site : '',
  };
}
