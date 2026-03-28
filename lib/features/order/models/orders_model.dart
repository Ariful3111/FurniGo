class OrdersModel {
  List<OrderData>? data;
  Links? links;
  Meta? meta;

  OrdersModel({this.data, this.links, this.meta});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderData.fromJson(e))
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

class OrderData {
  String? id;
  String? status;
  String? deliveryTime;
  String? createdAt;
  double? subtotal;
  int? deliveryCharge;
  int? tax;
  double? grandTotal;
  String? paymentStatus;
  String? paymentProvider;
  dynamic airwallexClientSecret;
  dynamic airwallexPaymentIntentId;
  Address? shippingAddress;
  Address? billingAddress;
  String? notes;
  int? itemsCount;
  List<OrderItem>? items;
  List<StatusHistory>? statusHistories;

  OrderData({
    this.id,
    this.status,
    this.deliveryTime,
    this.createdAt,
    this.subtotal,
    this.deliveryCharge,
    this.tax,
    this.grandTotal,
    this.paymentStatus,
    this.paymentProvider,
    this.airwallexClientSecret,
    this.airwallexPaymentIntentId,
    this.shippingAddress,
    this.billingAddress,
    this.notes,
    this.itemsCount,
    this.items,
    this.statusHistories,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'],
      status: json['status'],
      deliveryTime: json['delivery_time'],
      createdAt: json['created_at'],
      subtotal: (json['subtotal'] is num) ? json['subtotal'].toDouble() : 0.0,
      deliveryCharge: json['delivery_charge'],
      tax: json['tax'],
      grandTotal: (json['grand_total'] is num)
          ? json['grand_total'].toDouble()
          : 0.0,
      paymentStatus: json['payment_status'],
      paymentProvider: json['payment_provider'],
      airwallexClientSecret: json['airwallex_client_secret'],
      airwallexPaymentIntentId: json['airwallex_payment_intent_id'],
      shippingAddress: json['shipping_address'] != null
          ? Address.fromJson(json['shipping_address'])
          : null,
      billingAddress: json['billing_address'] != null
          ? Address.fromJson(json['billing_address'])
          : null,
      notes: json['notes'],
      itemsCount: json['items_count'],
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e))
          .toList(),
      statusHistories: (json['status_histories'] as List<dynamic>?)
          ?.map((e) => StatusHistory.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['status'] = status;
    map['delivery_time'] = deliveryTime;
    map['created_at'] = createdAt;
    map['subtotal'] = subtotal;
    map['delivery_charge'] = deliveryCharge;
    map['tax'] = tax;
    map['grand_total'] = grandTotal;
    map['payment_status'] = paymentStatus;
    map['payment_provider'] = paymentProvider;
    map['airwallex_client_secret'] = airwallexClientSecret;
    map['airwallex_payment_intent_id'] = airwallexPaymentIntentId;
    if (shippingAddress != null) {
      map['shipping_address'] = shippingAddress!.toJson();
    }
    if (billingAddress != null) {
      map['billing_address'] = billingAddress!.toJson();
    }
    map['notes'] = notes;
    map['items_count'] = itemsCount;
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (statusHistories != null) {
      map['status_histories'] = statusHistories!
          .map((v) => v.toJson())
          .toList();
    }
    return map;
  }
}

class Address {
  int? id;
  int? userId;
  String? name;
  String? phone;
  String? addressLine1;
  dynamic addressLine2;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  bool? isDefault;
  String? type;
  String? createdAt;
  String? updatedAt;

  Address({
    this.id,
    this.userId,
    this.name,
    this.phone,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.isDefault,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      phone: json['phone'],
      addressLine1: json['address_line_1'],
      addressLine2: json['address_line_2'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      isDefault: json['is_default'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['name'] = name;
    map['phone'] = phone;
    map['address_line_1'] = addressLine1;
    map['address_line_2'] = addressLine2;
    map['city'] = city;
    map['state'] = state;
    map['postal_code'] = postalCode;
    map['country'] = country;
    map['is_default'] = isDefault;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class OrderItem {
  int? id;
  int? productId;
  String? productName;
  String? categoryName;
  String? productImage;
  int? quantity;
  double? unitPrice;
  double? totalPrice;
  List<Option>? options;

  OrderItem({
    this.id,
    this.productId,
    this.productName,
    this.categoryName,
    this.productImage,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
    this.options,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      productId: json['product_id'],
      productName: json['product_name'],
      categoryName: json['category_name'],
      productImage: json['product_image'],
      quantity: json['quantity'],
      unitPrice: (json['unit_price'] is num)
          ? json['unit_price'].toDouble()
          : 0.0,
      totalPrice: (json['total_price'] is num)
          ? json['total_price'].toDouble()
          : 0.0,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['product_name'] = productName;
    map['category_name'] = categoryName;
    map['product_image'] = productImage;
    map['quantity'] = quantity;
    map['unit_price'] = unitPrice;
    map['total_price'] = totalPrice;
    if (options != null) {
      map['options'] = options!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Option {
  int? productAttributeOptionId;
  int? attributeId;
  int? optionId;
  String? attributeName;
  String? optionName;
  String? displayName;
  dynamic productImage;
  String? image;
  bool? isDefault;

  Option({
    this.productAttributeOptionId,
    this.attributeId,
    this.optionId,
    this.attributeName,
    this.optionName,
    this.displayName,
    this.productImage,
    this.image,
    this.isDefault,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      productAttributeOptionId: json['product_attribute_option_id'],
      attributeId: json['attribute_id'],
      optionId: json['option_id'],
      attributeName: json['attribute_name'],
      optionName: json['option_name'],
      displayName: json['display_name'],
      productImage: json['product_image'],
      image: json['image'],
      isDefault: json['is_default'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_attribute_option_id'] = productAttributeOptionId;
    map['attribute_id'] = attributeId;
    map['option_id'] = optionId;
    map['attribute_name'] = attributeName;
    map['option_name'] = optionName;
    map['display_name'] = displayName;
    map['product_image'] = productImage;
    map['image'] = image;
    map['is_default'] = isDefault;
    return map;
  }
}

class StatusHistory {
  String? status;
  int? statusId;
  String? statusName;
  String? statusSlug;
  String? comment;
  UpdatedBy? updatedBy;
  String? updatedAt;

  StatusHistory({
    this.status,
    this.statusId,
    this.statusName,
    this.statusSlug,
    this.comment,
    this.updatedBy,
    this.updatedAt,
  });

  factory StatusHistory.fromJson(Map<String, dynamic> json) {
    return StatusHistory(
      status: json['status'],
      statusId: json['status_id'],
      statusName: json['status_name'],
      statusSlug: json['status_slug'],
      comment: json['comment'],
      updatedBy: json['updated_by'] != null
          ? UpdatedBy.fromJson(json['updated_by'])
          : null,
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_id'] = statusId;
    map['status_name'] = statusName;
    map['status_slug'] = statusSlug;
    map['comment'] = comment;
    if (updatedBy != null) {
      map['updated_by'] = updatedBy!.toJson();
    }
    map['updated_at'] = updatedAt;
    return map;
  }
}

class UpdatedBy {
  int? id;
  String? name;
  String? email;

  UpdatedBy({this.id, this.name, this.email});

  factory UpdatedBy.fromJson(Map<String, dynamic> json) {
    return UpdatedBy(id: json['id'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
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
  List<Link>? links;
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
          ?.map((e) => Link.fromJson(e))
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

class Link {
  dynamic url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(url: json['url'], label: json['label'], active: json['active']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }
}
