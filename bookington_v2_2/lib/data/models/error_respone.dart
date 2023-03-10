import 'dart:convert';

ErrorResp errorRespFromJson(String str) => ErrorResp.fromJson(json.decode(str));

String errorRespToJson(ErrorResp data) => json.encode(data.toJson());

class ErrorResp {
  ErrorResp({
    required this.error,
  });

  String error;

  factory ErrorResp.fromJson(Map<String, dynamic> json) => ErrorResp(
    error: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Message": error,
  };
}