class Data {
  Data({
    this.taskID,
    this.userID,
    this.latitude,
    this.longitude,
    this.remarks,
    this.imagePath,
  });

  Data.fromJson(dynamic json) {
    taskID = json['taskID'];
    userID = json['userID'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    remarks = json['remarks'];
    imagePath = json['imagePath'];
  }

  int? taskID;
  int? userID;
  double? latitude;
  double? longitude;
  String? remarks;
  String? imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['taskID'] = taskID;
    map['userID'] = userID;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['remarks'] = remarks;
    map['imagePath'] = imagePath;
    return map;
  }
}
