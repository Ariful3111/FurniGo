import 'dart:convert';

ProductAttributesModel productAttributesModelFromJson(String str) =>
    ProductAttributesModel.fromJson(json.decode(str));

String productAttributesModelToJson(ProductAttributesModel data) =>
    json.encode(data.toJson());

class ProductAttributesModel {
  final List<ProductAttribute> data;

  ProductAttributesModel({required this.data});

  factory ProductAttributesModel.fromJson(Map<String, dynamic> json) =>
      ProductAttributesModel(
        data: List<ProductAttribute>.from(
          json["data"].map((x) => ProductAttribute.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ProductAttribute {
  final num? productAttributeId;
  final num? attributeId;
  final String? name;
  final List<AttributeOption>? options;

  ProductAttribute({
    this.productAttributeId,
    this.attributeId,
    this.name,
    this.options,
  });

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      ProductAttribute(
        productAttributeId: json["product_attribute_id"],
        attributeId: json["attribute_id"],
        name: json["name"],
        options: json["options"] != null
            ? List<AttributeOption>.from(
                json["options"].map((x) => AttributeOption.fromJson(x)),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
    "product_attribute_id": productAttributeId,
    "attribute_id": attributeId,
    "name": name,
    "options": options != null
        ? List<dynamic>.from(options!.map((x) => x.toJson()))
        : [],
  };
}

class AttributeOption {
  final num? productAttributeOptionId;
  final num? optionId;
  final String? name;
  final dynamic image;
  final String? productImage;
  final num? price;
  final num? stock;
  final bool? isDefault;

  AttributeOption({
    this.productAttributeOptionId,
    this.optionId,
    this.name,
    this.image,
    this.productImage,
    this.price,
    this.stock,
    this.isDefault,
  });

  factory AttributeOption.fromJson(Map<String, dynamic> json) =>
      AttributeOption(
        productAttributeOptionId: json["product_attribute_option_id"],
        optionId: json["option_id"],
        name: json["name"],
        image: json["image"],
        productImage: json["product_image"],
        price: json["price"],
        stock: json["stock"],
        isDefault: json["is_default"],
      );

  Map<String, dynamic> toJson() => {
    "product_attribute_option_id": productAttributeOptionId,
    "option_id": optionId,
    "name": name,
    "image": image,
    "product_image": productImage,
    "price": price,
    "stock": stock,
    "is_default": isDefault,
  };
}
