class DetailsErrorModel {
  DetailsErrorModel({
    required this.status,
    required this.details,
  });
  late final String status;
  late final String details;

  DetailsErrorModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['details'] = details;
    return _data;
  }
}