import 'data.dart';

class AddFileResponse {
  AddFileResponse({
      this.requestId, 
      this.error, 
      this.data, 
      this.success, 
      this.message,});

  AddFileResponse.fromJson(dynamic json) {
    requestId = json['requestId'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(v);
      });
    }
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    message = json['message'];
  }
  String? requestId;
  List<dynamic>? error;
  Data? data;
  int? success;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['requestId'] = requestId;
    if (error != null) {
      map['error'] = error?.map((v) => v.toJson()).toList();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['success'] = success;
    map['message'] = message;
    return map;
  }

}