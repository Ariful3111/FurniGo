import 'dart:convert';

ProductsModel productsResponseModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsModel data) =>
    json.encode(data.toJson());

class ProductsModel {
  final List<Product> data;

  ProductsModel({required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Product {
  final int id;
  final int categoryId;
  final String categoryName;
  final String name;
  final String sku;
  final String? description;
  final double price;
  final int sellingPrice;
  final String? discountType;
  final int discountAmount;
  final double finalPrice;
  final bool isRentable;
  final bool isFavourite;
  final bool isInStock;
  final String status;
  final dynamic dimensions;
  final Category category;
  final FurnitureType furnitureType;
  final List<Room> rooms;
  final List<Media> media;
  final List<DefaultOptionId> defaultOptionIds;
  final DateTime createdAt;
  final dynamic updatedAt;

  Product({
    required this.id,
    required this.categoryId,
    required this.categoryName,
    required this.name,
    required this.sku,
    this.description,
    required this.price,
    required this.sellingPrice,
    this.discountType,
    required this.discountAmount,
    required this.finalPrice,
    required this.isRentable,
    required this.isFavourite,
    required this.isInStock,
    required this.status,
    this.dimensions,
    required this.category,
    required this.furnitureType,
    required this.rooms,
    required this.media,
    required this.defaultOptionIds,
    required this.createdAt,
    this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    name: json["name"],
    sku: json["sku"],
    description: json["description"],
    price: json["price"].toDouble(),
    sellingPrice: json["selling_price"],
    discountType: json["discount_type"],
    discountAmount: json["discount_amount"],
    finalPrice: json["final_price"].toDouble(),
    isRentable: json["is_rentable"],
    isFavourite: json["is_favourite"],
    isInStock: json["is_in_stock"],
    status: json["status"],
    dimensions: json["dimensions"],
    category: Category.fromJson(json["category"]),
    furnitureType: FurnitureType.fromJson(json["furniture_type"]),
    rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
    media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    defaultOptionIds: List<DefaultOptionId>.from(
      json["default_option_ids"].map((x) => DefaultOptionId.fromJson(x)),
    ),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "category_name": categoryName,
    "name": name,
    "sku": sku,
    "description": description,
    "price": price,
    "selling_price": sellingPrice,
    "discount_type": discountType,
    "discount_amount": discountAmount,
    "final_price": finalPrice,
    "is_rentable": isRentable,
    "is_favourite": isFavourite,
    "is_in_stock": isInStock,
    "status": status,
    "dimensions": dimensions,
    "category": category.toJson(),
    "furniture_type": furnitureType.toJson(),
    "rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
    "media": List<dynamic>.from(media.map((x) => x.toJson())),
    "default_option_ids": List<dynamic>.from(
      defaultOptionIds.map((x) => x.toJson()),
    ),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
  };
}

class Category {
  final int id;
  final String name;
  final String slug;
  final dynamic parentId;
  final dynamic imageUrl;
  final dynamic status;
  final dynamic order;
  final dynamic createdAt;
  final dynamic updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    this.parentId,
    this.imageUrl,
    this.status,
    this.order,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    parentId: json["parent_id"],
    imageUrl: json["image_url"],
    status: json["status"],
    order: json["order"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "parent_id": parentId,
    "image_url": imageUrl,
    "status": status,
    "order": order,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class FurnitureType {
  final int id;
  final String name;

  FurnitureType({required this.id, required this.name});

  factory FurnitureType.fromJson(Map<String, dynamic> json) =>
      FurnitureType(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Room {
  final int id;
  final String name;

  Room({required this.id, required this.name});

  factory Room.fromJson(Map<String, dynamic> json) =>
      Room(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Media {
  final int id;
  final int productId;
  final String type;
  final String url;
  final bool isPrimary;
  final DateTime createdAt;
  final DateTime updatedAt;

  Media({
    required this.id,
    required this.productId,
    required this.type,
    required this.url,
    required this.isPrimary,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    productId: json["product_id"],
    type: json["type"],
    url: json["url"],
    isPrimary: json["is_primary"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "type": type,
    "url": url,
    "is_primary": isPrimary,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class DefaultOptionId {
  final int productAttributeOptionId;
  final int attributeId;
  final int optionId;

  DefaultOptionId({
    required this.productAttributeOptionId,
    required this.attributeId,
    required this.optionId,
  });

  factory DefaultOptionId.fromJson(Map<String, dynamic> json) =>
      DefaultOptionId(
        productAttributeOptionId: json["product_attribute_option_id"],
        attributeId: json["attribute_id"],
        optionId: json["option_id"],
      );

  Map<String, dynamic> toJson() => {
    "product_attribute_option_id": productAttributeOptionId,
    "attribute_id": attributeId,
    "option_id": optionId,
  };
}
