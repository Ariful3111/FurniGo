class StepZeroModel {
  String? uuid;
  int? userId;
  BusinessInfo? businessInfo;
  int? currentStep;
  int? rentalStatusId;
  String? updatedAt;
  String? createdAt;
  int? id;

  StepZeroModel({
    this.uuid,
    this.userId,
    this.businessInfo,
    this.currentStep,
    this.rentalStatusId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  StepZeroModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    userId = json['user_id'];
    businessInfo = json['business_info'] != null
        ? BusinessInfo.fromJson(json['business_info'])
        : null;
    currentStep = json['current_step'];
    rentalStatusId = json['rental_status_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['user_id'] = userId;
    if (businessInfo != null) {
      data['business_info'] = businessInfo!.toJson();
    }
    data['current_step'] = currentStep;
    data['rental_status_id'] = rentalStatusId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class BusinessInfo {
  String? businessName;
  String? contactPerson;
  String? email;
  String? phone;
  String? abn;
  String? website;

  BusinessInfo({
    this.businessName,
    this.contactPerson,
    this.email,
    this.phone,
    this.abn,
    this.website,
  });

  BusinessInfo.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    contactPerson = json['contact_person'];
    email = json['email'];
    phone = json['phone'];
    abn = json['abn'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_name'] = businessName;
    data['contact_person'] = contactPerson;
    data['email'] = email;
    data['phone'] = phone;
    data['abn'] = abn;
    data['website'] = website;
    return data;
  }
}
