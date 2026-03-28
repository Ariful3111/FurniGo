class RentalsModel {
  List<RentalData>? data;
  Links? links;
  Meta? meta;

  RentalsModel({this.data, this.links, this.meta});

  factory RentalsModel.fromJson(Map<String, dynamic> json) {
    return RentalsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => RentalData.fromJson(e))
          .toList(),
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links!.toJson();
    }
    if (meta != null) {
      map['meta'] = meta!.toJson();
    }
    return map;
  }
}

class RentalData {
  int? id;
  String? uuid;
  String? propertyType;
  String? startDate;
  String? endDate;
  String? status;
  String? shipmentStatus;
  String? paymentStatus;
  dynamic quotationId;
  String? quotationStatus;
  List<dynamic>? installments;

  RentalData({
    this.id,
    this.uuid,
    this.propertyType,
    this.startDate,
    this.endDate,
    this.status,
    this.shipmentStatus,
    this.paymentStatus,
    this.quotationId,
    this.quotationStatus,
    this.installments,
  });

  factory RentalData.fromJson(Map<String, dynamic> json) {
    return RentalData(
      id: json['id'],
      uuid: json['uuid'],
      propertyType: json['property_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      status: json['status'],
      shipmentStatus: json['shipment_status'],
      paymentStatus: json['payment_status'],
      quotationId: json['quotation_id'],
      quotationStatus: json['quotation_status'],
      installments: json['installments'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uuid'] = uuid;
    map['property_type'] = propertyType;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['status'] = status;
    map['shipment_status'] = shipmentStatus;
    map['payment_status'] = paymentStatus;
    map['quotation_id'] = quotationId;
    map['quotation_status'] = quotationStatus;
    map['installments'] = installments;
    return map;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({this.first, this.last, this.prev, this.next});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json['first'],
      last: json['last'],
      prev: json['prev'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      from: json['from'],
      lastPage: json['last_page'],
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Links.fromJson(e))
          .toList(),
      path: json['path'],
      perPage: json['per_page'],
      to: json['to'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links!.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}
