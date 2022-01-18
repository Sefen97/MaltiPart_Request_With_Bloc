class AddFileRequest {
  AddFileRequest({
    this.taskID,
    this.userID,
    this.latitude,
    this.longitude,
    this.remarks,
  });

  AddFileRequest.fromJson(dynamic json) {
    taskID = json['taskID'];
    userID = json['userID'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    remarks = json['remarks'];
  }

  int? taskID;
  int? userID;
  double? latitude;
  double? longitude;
  String? remarks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taskID'] = taskID;
    map['userID'] = userID;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['remarks'] = remarks;
    return map;
  }
}
