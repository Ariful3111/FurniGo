import 'dart:convert';
import '../../home/models/products_model.dart';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  final String? id;
  final int? userId;
  final List<CartItem>? items;
  final num? subtotal;
  final num? totalCartValue;
  final num? discountAmount;
  final String? couponCode;
  final String? couponMessage;
  final num? grandTotal;
  final int? totalQty;
  final int? itemCount;

  CartModel({
    this.id,
    this.userId,
    this.items,
    this.subtotal,
    this.totalCartValue,
    this.discountAmount,
    this.couponCode,
    this.couponMessage,
    this.grandTotal,
    this.totalQty,
    this.itemCount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    userId: json["user_id"],
    items: json["items"] != null
        ? List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x)))
        : [],
    subtotal: json["subtotal"],
    totalCartValue: json["total_cart_value"],
    discountAmount: json["discount_amount"],
    couponCode: json["coupon_code"],
    couponMessage: json["coupon_message"],
    grandTotal: json["grand_total"],
    totalQty: json["total_qty"],
    itemCount: json["item_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "items": items != null
        ? List<dynamic>.from(items!.map((x) => x.toJson()))
        : [],
    "subtotal": subtotal,
    "total_cart_value": totalCartValue,
    "discount_amount": discountAmount,
    "coupon_code": couponCode,
    "coupon_message": couponMessage,
    "grand_total": grandTotal,
    "total_qty": totalQty,
    "item_count": itemCount,
  };
}

class CartItem {
  final int? id;
  bool isSelected;
  final Product? product;
  final int? quantity;
  final num? unitPrice;
  final num? basePrice;
  final num? optionPrice;
  final num? subtotal;
  final List<CartOption>? options;

  CartItem({
    this.id,
    required this.isSelected,
    this.product,
    this.quantity,
    this.unitPrice,
    this.basePrice,
    this.optionPrice,
    this.subtotal,
    this.options,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    isSelected: json["is_selected"] ?? false,
    product: json["product"] != null ? Product.fromJson(json["product"]) : null,
    quantity: json["quantity"],
    unitPrice: json["unit_price"],
    basePrice: json["base_price"],
    optionPrice: json["option_price"],
    subtotal: json["subtotal"],
    options: json["options"] != null
        ? List<CartOption>.from(
            json["options"].map((x) => CartOption.fromJson(x)),
          )
        : [],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_selected": isSelected,
    "product": product?.toJson(),
    "quantity": quantity,
    "unit_price": unitPrice,
    "base_price": basePrice,
    "option_price": optionPrice,
    "subtotal": subtotal,
    "options": options != null
        ? List<dynamic>.from(options!.map((x) => x.toJson()))
        : [],
  };
}

class CartOption {
  final num? productAttributeOptionId;
  final num? attributeId;
  final num? optionId;
  final String? attributeName;
  final String? optionName;
  final num? price;
  final dynamic productImage;
  final bool? isDefault;

  CartOption({
    this.productAttributeOptionId,
    this.attributeId,
    this.optionId,
    this.attributeName,
    this.optionName,
    this.price,
    this.productImage,
    this.isDefault,
  });

  factory CartOption.fromJson(Map<String, dynamic> json) => CartOption(
    productAttributeOptionId: json["product_attribute_option_id"],
    attributeId: json["attribute_id"],
    optionId: json["option_id"],
    attributeName: json["attribute_name"],
    optionName: json["option_name"],
    price: json["price"],
    productImage: json["product_image"],
    isDefault: json["is_default"],
  );

  Map<String, dynamic> toJson() => {
    "product_attribute_option_id": productAttributeOptionId,
    "attribute_id": attributeId,
    "option_id": optionId,
    "attribute_name": attributeName,
    "option_name": optionName,
    "price": price,
    "product_image": productImage,
    "is_default": isDefault,
  };
}
