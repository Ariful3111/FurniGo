class RentalDetailsModel {
  final String? uuid;
  final int? userId;
  final int? currentStep;
  final String? status;
  final BusinessInfo? businessInfo;
  final String? propertyType;
  final String? propertyUse;
  final String? address;
  final int? sizeSqm;
  final SpaceBreakdown? spaceBreakdown;
  final List<RoomDimension>? roomDimensions;
  final List<FurnitureSelection>? furnitureSelection;
  final List<ApplianceSelection>? applianceSelection;
  final RentalTerms? rentalTerms;
  final int? rentalTermId;
  final RentalTerm? rentalTerm;
  final DeliverySetup? deliverySetup;
  final AdditionalNotes? additionalNotes;
  final String? startDate;
  final String? endDate;
  final dynamic quotationUuid;
  final dynamic quotationStatus;
  final dynamic quotation;
  final String? createdAt;
  final String? updatedAt;

  RentalDetailsModel({
    this.uuid,
    this.userId,
    this.currentStep,
    this.status,
    this.businessInfo,
    this.propertyType,
    this.propertyUse,
    this.address,
    this.sizeSqm,
    this.spaceBreakdown,
    this.roomDimensions,
    this.furnitureSelection,
    this.applianceSelection,
    this.rentalTerms,
    this.rentalTermId,
    this.rentalTerm,
    this.deliverySetup,
    this.additionalNotes,
    this.startDate,
    this.endDate,
    this.quotationUuid,
    this.quotationStatus,
    this.quotation,
    this.createdAt,
    this.updatedAt,
  });

  factory RentalDetailsModel.fromJson(Map<String, dynamic> json) {
    return RentalDetailsModel(
      uuid: json['uuid'],
      userId: json['user_id'],
      currentStep: json['current_step'],
      status: json['status'],
      businessInfo: json['business_info'] != null
          ? BusinessInfo.fromJson(json['business_info'])
          : null,
      propertyType: json['property_type'],
      propertyUse: json['property_use'],
      address: json['address'],
      sizeSqm: json['size_sqm'],
      spaceBreakdown: json['space_breakdown'] != null
          ? SpaceBreakdown.fromJson(json['space_breakdown'])
          : null,
      roomDimensions: (json['room_dimensions'] as List<dynamic>?)
          ?.map((e) => RoomDimension.fromJson(e))
          .toList(),
      furnitureSelection: (json['furniture_selection'] as List<dynamic>?)
          ?.map((e) => FurnitureSelection.fromJson(e))
          .toList(),
      applianceSelection: (json['appliance_selection'] as List<dynamic>?)
          ?.map((e) => ApplianceSelection.fromJson(e))
          .toList(),
      rentalTerms: json['rental_terms'] != null
          ? RentalTerms.fromJson(json['rental_terms'])
          : null,
      rentalTermId: json['rental_term_id'],
      rentalTerm: json['rental_term'] != null
          ? RentalTerm.fromJson(json['rental_term'])
          : null,
      deliverySetup: json['delivery_setup'] != null
          ? DeliverySetup.fromJson(json['delivery_setup'])
          : null,
      additionalNotes: json['additional_notes'] != null
          ? AdditionalNotes.fromJson(json['additional_notes'])
          : null,
      startDate: json['start_date'],
      endDate: json['end_date'],
      quotationUuid: json['quotation_uuid'],
      quotationStatus: json['quotation_status'],
      quotation: json['quotation'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['user_id'] = userId;
    map['current_step'] = currentStep;
    map['status'] = status;
    if (businessInfo != null) {
      map['business_info'] = businessInfo!.toJson();
    }
    map['property_type'] = propertyType;
    map['property_use'] = propertyUse;
    map['address'] = address;
    map['size_sqm'] = sizeSqm;
    if (spaceBreakdown != null) {
      map['space_breakdown'] = spaceBreakdown!.toJson();
    }
    if (roomDimensions != null) {
      map['room_dimensions'] = roomDimensions!.map((v) => v.toJson()).toList();
    }
    if (furnitureSelection != null) {
      map['furniture_selection'] = furnitureSelection!
          .map((v) => v.toJson())
          .toList();
    }
    if (applianceSelection != null) {
      map['appliance_selection'] = applianceSelection!
          .map((v) => v.toJson())
          .toList();
    }
    if (rentalTerms != null) {
      map['rental_terms'] = rentalTerms!.toJson();
    }
    map['rental_term_id'] = rentalTermId;
    if (rentalTerm != null) {
      map['rental_term'] = rentalTerm!.toJson();
    }
    if (deliverySetup != null) {
      map['delivery_setup'] = deliverySetup!.toJson();
    }
    if (additionalNotes != null) {
      map['additional_notes'] = additionalNotes!.toJson();
    }
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['quotation_uuid'] = quotationUuid;
    map['quotation_status'] = quotationStatus;
    map['quotation'] = quotation;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class BusinessInfo {
  final String? businessName;
  final String? contactPerson;
  final String? email;
  final String? phone;
  final String? abn;
  final String? website;

  BusinessInfo({
    this.businessName,
    this.contactPerson,
    this.email,
    this.phone,
    this.abn,
    this.website,
  });

  factory BusinessInfo.fromJson(Map<String, dynamic> json) {
    return BusinessInfo(
      businessName: json['business_name'],
      contactPerson: json['contact_person'],
      email: json['email'],
      phone: json['phone'],
      abn: json['abn'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['business_name'] = businessName;
    map['contact_person'] = contactPerson;
    map['email'] = email;
    map['phone'] = phone;
    map['abn'] = abn;
    map['website'] = website;
    return map;
  }
}

class SpaceBreakdown {
  final List<Room>? rooms;

  SpaceBreakdown({this.rooms});

  factory SpaceBreakdown.fromJson(Map<String, dynamic> json) {
    return SpaceBreakdown(
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (rooms != null) {
      map['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Room {
  final String? type;
  final String? name;
  final int? count;

  Room({this.type, this.name, this.count});

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(type: json['type'], name: json['name'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['name'] = name;
    map['count'] = count;
    return map;
  }
}

class RoomDimension {
  final String? roomName;
  final String? length;
  final String? width;

  RoomDimension({this.roomName, this.length, this.width});

  factory RoomDimension.fromJson(Map<String, dynamic> json) {
    return RoomDimension(
      roomName: json['room_name'],
      length: json['length'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['room_name'] = roomName;
    map['length'] = length;
    map['width'] = width;
    return map;
  }
}

class FurnitureSelection {
  final String? room;
  final List<FurnitureItem>? items;
  final String? condition;
  final String? style;

  FurnitureSelection({this.room, this.items, this.condition, this.style});

  factory FurnitureSelection.fromJson(Map<String, dynamic> json) {
    return FurnitureSelection(
      room: json['room'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => FurnitureItem.fromJson(e))
          .toList(),
      condition: json['condition'],
      style: json['style'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['room'] = room;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    map['condition'] = condition;
    map['style'] = style;
    return map;
  }
}

class FurnitureItem {
  final String? name;
  final int? count;

  FurnitureItem({this.name, this.count});

  factory FurnitureItem.fromJson(Map<String, dynamic> json) {
    return FurnitureItem(name: json['name'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['count'] = count;
    return map;
  }
}

class ApplianceSelection {
  final String? room;
  final List<ApplianceItem>? items;

  ApplianceSelection({this.room, this.items});

  factory ApplianceSelection.fromJson(Map<String, dynamic> json) {
    return ApplianceSelection(
      room: json['room'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ApplianceItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['room'] = room;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ApplianceItem {
  final String? name;
  final int? count;

  ApplianceItem({this.name, this.count});

  factory ApplianceItem.fromJson(Map<String, dynamic> json) {
    return ApplianceItem(name: json['name'], count: json['count']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['count'] = count;
    return map;
  }
}

class RentalTerms {
  final int? rentalTermId;
  final int? rentalTermDays;
  final String? termType;
  final int? durationMonths;
  final String? paymentFrequency;
  final int? rentalTermDiscount;
  final String? pricingPreference;
  final String? startDate;
  final InstallmentSchedule? installmentSchedule;
  final String? timelineUrgency;
  final String? budgetPreference;
  final bool? fireSafetyRequired;
  final String? weightRestrictions;
  final String? ohsRequirements;

  RentalTerms({
    this.rentalTermId,
    this.rentalTermDays,
    this.termType,
    this.durationMonths,
    this.paymentFrequency,
    this.rentalTermDiscount,
    this.pricingPreference,
    this.startDate,
    this.installmentSchedule,
    this.timelineUrgency,
    this.budgetPreference,
    this.fireSafetyRequired,
    this.weightRestrictions,
    this.ohsRequirements,
  });

  factory RentalTerms.fromJson(Map<String, dynamic> json) {
    return RentalTerms(
      rentalTermId: json['rental_term_id'],
      rentalTermDays: json['rental_term_days'],
      termType: json['term_type'],
      durationMonths: json['duration_months'],
      paymentFrequency: json['payment_frequency'],
      rentalTermDiscount: json['rental_term_discount'],
      pricingPreference: json['pricing_preference'],
      startDate: json['start_date'],
      installmentSchedule: json['installment_schedule'] != null
          ? InstallmentSchedule.fromJson(json['installment_schedule'])
          : null,
      timelineUrgency: json['timeline_urgency'],
      budgetPreference: json['budget_preference'],
      fireSafetyRequired: json['fire_safety_required'],
      weightRestrictions: json['weight_restrictions'],
      ohsRequirements: json['ohs_requirements'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rental_term_id'] = rentalTermId;
    map['rental_term_days'] = rentalTermDays;
    map['term_type'] = termType;
    map['duration_months'] = durationMonths;
    map['payment_frequency'] = paymentFrequency;
    map['rental_term_discount'] = rentalTermDiscount;
    map['pricing_preference'] = pricingPreference;
    map['start_date'] = startDate;
    if (installmentSchedule != null) {
      map['installment_schedule'] = installmentSchedule!.toJson();
    }
    map['timeline_urgency'] = timelineUrgency;
    map['budget_preference'] = budgetPreference;
    map['fire_safety_required'] = fireSafetyRequired;
    map['weight_restrictions'] = weightRestrictions;
    map['ohs_requirements'] = ohsRequirements;
    return map;
  }
}

class InstallmentSchedule {
  final String? upfront;
  final String? secondPayment;
  final String? finalPayment;

  InstallmentSchedule({this.upfront, this.secondPayment, this.finalPayment});

  factory InstallmentSchedule.fromJson(Map<String, dynamic> json) {
    return InstallmentSchedule(
      upfront: json['upfront'],
      secondPayment: json['second_payment'],
      finalPayment: json['final_payment'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['upfront'] = upfront;
    map['second_payment'] = secondPayment;
    map['final_payment'] = finalPayment;
    return map;
  }
}

class RentalTerm {
  final int? id;
  final String? name;
  final int? days;
  final int? discountPercent;

  RentalTerm({this.id, this.name, this.days, this.discountPercent});

  factory RentalTerm.fromJson(Map<String, dynamic> json) {
    return RentalTerm(
      id: json['id'],
      name: json['name'],
      days: json['days'],
      discountPercent: json['discount_percent'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['days'] = days;
    map['discount_percent'] = discountPercent;
    return map;
  }
}

class DeliverySetup {
  final String? deliveryAddress;
  final String? contactPerson;
  final String? preferredDeliveryDate;
  final AccessDetails? accessDetails;
  final bool? isInstallationRequired;

  DeliverySetup({
    this.deliveryAddress,
    this.contactPerson,
    this.preferredDeliveryDate,
    this.accessDetails,
    this.isInstallationRequired,
  });

  factory DeliverySetup.fromJson(Map<String, dynamic> json) {
    return DeliverySetup(
      deliveryAddress: json['delivery_address'],
      contactPerson: json['contact_person'],
      preferredDeliveryDate: json['preferred_delivery_date'],
      accessDetails: json['access_details'] != null
          ? AccessDetails.fromJson(json['access_details'])
          : null,
      isInstallationRequired: json['installation_required'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['delivery_address'] = deliveryAddress;
    map['contact_person'] = contactPerson;
    map['preferred_delivery_date'] = preferredDeliveryDate;
    if (accessDetails != null) {
      map['access_details'] = accessDetails!.toJson();
    }
    map['installation_required'] = isInstallationRequired;
    return map;
  }
}

class AccessDetails {
  final bool? liftAccess;
  final bool? loadingDockAvailable;
  final bool? workingHoursRestrictions;

  AccessDetails({
    this.liftAccess,
    this.loadingDockAvailable,
    this.workingHoursRestrictions,
  });

  factory AccessDetails.fromJson(Map<String, dynamic> json) {
    return AccessDetails(
      liftAccess: json['lift_access'],
      loadingDockAvailable: json['loading_dock_available'],
      workingHoursRestrictions: json['working_hours_restrictions'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lift_access'] = liftAccess;
    map['loading_dock_available'] = loadingDockAvailable;
    map['working_hours_restrictions'] = workingHoursRestrictions;
    return map;
  }
}

class AdditionalNotes {
  final String? customRequests;
  final bool? brandingRequired;
  final List<String>? brandingElements;

  AdditionalNotes({
    this.customRequests,
    this.brandingRequired,
    this.brandingElements,
  });

  factory AdditionalNotes.fromJson(Map<String, dynamic> json) {
    return AdditionalNotes(
      customRequests: json['custom_requests'],
      brandingRequired: json['branding_required'],
      brandingElements: (json['branding_elements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['custom_requests'] = customRequests;
    map['branding_required'] = brandingRequired;
    if (brandingElements != null) {
      map['branding_elements'] = brandingElements;
    }
    return map;
  }
}
