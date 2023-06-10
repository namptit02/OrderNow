// class UserResponse {
//   String? respondcode;
//   String? message;
//   Data? data;

//   UserResponse({this.respondcode, this.message, this.data});

//   UserResponse.fromJson(Map<String, dynamic> json) {
//     respondcode = json["Respondcode"];
//     message = json["message"];
//     data = json["data"] == null ? null : Data.fromJson(json["data"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["Respondcode"] = respondcode;
//     _data["message"] = message;
//     if (data != null) {
//       _data["data"] = data?.toJson();
//     }
//     return _data;
//   }

//   UserResponse copyWith({
//     String? respondcode,
//     String? message,
//     Data? data,
//   }) =>
//       UserResponse(
//         respondcode: respondcode ?? this.respondcode,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );
// }

// class Data {
//   String? username;
//   int? password;
//   bool? ismale;
//   PartnerData? partnerData;

//   Data({this.username, this.password, this.ismale, this.partnerData});

//   Data.fromJson(Map<String, dynamic> json) {
//     username = json["username"];
//     password = json["password"];
//     ismale = json["ismale"];
//     partnerData = json["partnerData"] == null
//         ? null
//         : PartnerData.fromJson(json["partnerData"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["username"] = username;
//     _data["password"] = password;
//     _data["ismale"] = ismale;
//     if (partnerData != null) {
//       _data["partnerData"] = partnerData?.toJson();
//     }
//     return _data;
//   }

//   Data copyWith({
//     String? username,
//     int? password,
//     bool? ismale,
//     PartnerData? partnerData,
//   }) =>
//       Data(
//         username: username ?? this.username,
//         password: password ?? this.password,
//         ismale: ismale ?? this.ismale,
//         partnerData: partnerData ?? this.partnerData,
//       );
// }

// class PartnerData {
//   String? username;
//   int? bondLeve;

//   PartnerData({this.username, this.bondLeve});

//   PartnerData.fromJson(Map<String, dynamic> json) {
//     username = json["username"];
//     bondLeve = json["bondLeve"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["username"] = username;
//     _data["bondLeve"] = bondLeve;
//     return _data;
//   }

//   PartnerData copyWith({
//     String? username,
//     int? bondLeve,
//   }) =>
//       PartnerData(
//         username: username ?? this.username,
//         bondLeve: bondLeve ?? this.bondLeve,
//       );
// }
