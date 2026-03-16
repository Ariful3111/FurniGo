class UserProfileModel {
  Data? data;

  UserProfileModel({this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? abn;
  String? type;
  String? status;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.abn,
    this.type,
    this.status,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    abn = json['abn'];
    type = json['type'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['abn'] = abn;
    data['type'] = type;
    data['status'] = status;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
