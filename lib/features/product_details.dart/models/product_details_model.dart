import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  final ProductDetail data;

  ProductDetailsModel({required this.data});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(data: ProductDetail.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class ProductDetail {
  final num? id;
  final num? categoryId;
  final String? categoryName;
  final String? name;
  final String? sku;
  final String? description;
  final num? price;
  final num? sellingPrice;
  final String? discountType;
  final num? discountAmount;
  final num? finalPrice;
  final bool? isRentable;
  final bool? isFavourite;
  final bool? isInStock;
  final String? status;
  final dynamic dimensions;
  final Category? category;
  final FurnitureType? furnitureType;
  final List<Room>? rooms;
  final List<Media>? media;
  final List<DefaultOptionId>? defaultOptionIds;
  final num? averageRating;
  final int? totalReviews;
  final List<Review>? reviews;
  final DateTime? createdAt;
  final dynamic updatedAt;

  ProductDetail({
    this.id,
    this.categoryId,
    this.categoryName,
    this.name,
    this.sku,
    this.description,
    this.price,
    this.sellingPrice,
    this.discountType,
    this.discountAmount,
    this.finalPrice,
    this.isRentable,
    this.isFavourite,
    this.isInStock,
    this.status,
    this.dimensions,
    this.category,
    this.furnitureType,
    this.rooms = const [],
    this.media,
    this.defaultOptionIds,
    this.averageRating = 0,
    this.totalReviews = 0,
    this.reviews = const [],
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    name: json["name"],
    sku: json["sku"],
    description: json["description"],
    price: json["price"],
    sellingPrice: json["selling_price"],
    discountType: json["discount_type"],
    discountAmount: json["discount_amount"],
    finalPrice: json["final_price"],
    isRentable: json["is_rentable"],
    isFavourite: json["is_favourite"],
    isInStock: json["is_in_stock"],
    status: json["status"],
    dimensions: json["dimensions"],
    category: json["category"] != null
        ? Category.fromJson(json["category"])
        : null,
    furnitureType: json["furniture_type"] != null
        ? FurnitureType.fromJson(json["furniture_type"])
        : null,
    rooms: json["rooms"] != null
        ? List<Room>.from(json["rooms"].map((x) => Room.fromJson(x)))
        : [],
    media: json["media"] != null
        ? List<Media>.from(json["media"].map((x) => Media.fromJson(x)))
        : [],
    defaultOptionIds: json["default_option_ids"] != null
        ? List<DefaultOptionId>.from(
            json["default_option_ids"].map((x) => DefaultOptionId.fromJson(x)),
          )
        : [],
    averageRating: json["average_rating"] ?? 0,
    totalReviews: json["total_reviews"] ?? 0,
    reviews: json["reviews"] != null
        ? List<Review>.from(json["reviews"].map((x) => Review.fromJson(x)))
        : [],
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : null,
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
    "category": category?.toJson(),
    "furniture_type": furnitureType?.toJson(),
    "rooms": rooms != null
        ? List<dynamic>.from(rooms!.map((x) => x.toJson()))
        : [],
    "media": media != null
        ? List<dynamic>.from(media!.map((x) => x.toJson()))
        : [],
    "default_option_ids": defaultOptionIds != null
        ? List<dynamic>.from(defaultOptionIds!.map((x) => x.toJson()))
        : [],
    "average_rating": averageRating,
    "total_reviews": totalReviews,
    "reviews": reviews != null
        ? List<dynamic>.from(reviews!.map((x) => x.toJson()))
        : [],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt,
  };
}

class Category {
  final num? id;
  final String? name;
  final String? slug;
  final dynamic parentId;
  final dynamic imageUrl;
  final dynamic status;
  final dynamic order;
  final dynamic createdAt;
  final dynamic updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
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
  final num? id;
  final String? name;

  FurnitureType({this.id, this.name});

  factory FurnitureType.fromJson(Map<String, dynamic> json) =>
      FurnitureType(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Room {
  final num? id;
  final String? name;

  Room({this.id, this.name});

  factory Room.fromJson(Map<String, dynamic> json) =>
      Room(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}

class Media {
  final num? id;
  final num? productId;
  final String? type;
  final String? url;
  final bool? isPrimary;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Media({
    this.id,
    this.productId,
    this.type,
    this.url,
    this.isPrimary,
    this.createdAt,
    this.updatedAt,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    productId: json["product_id"],
    type: json["type"],
    url: json["url"],
    isPrimary: json["is_primary"],
    createdAt: json["created_at"] != null
        ? DateTime.parse(json["created_at"])
        : null,
    updatedAt: json["updated_at"] != null
        ? DateTime.parse(json["updated_at"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "type": type,
    "url": url,
    "is_primary": isPrimary,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class DefaultOptionId {
  final num? productAttributeOptionId;
  final num? attributeId;
  final num? optionId;

  DefaultOptionId({
    this.productAttributeOptionId,
    this.attributeId,
    this.optionId,
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

class Review {
  final num? id;
  final num? productId;
  final String? reviewerName;
  final dynamic reviewerImage;
  final num? rating;
  final String? title;
  final String? review;
  final bool? isVerifiedPurchase;
  final num? helpfulCount;
  final String? status;
  final DateTime? createdAt;

  Review({
    this.id,
    this.productId,
    this.reviewerName,
    this.reviewerImage,
    this.rating,
    this.title,
    this.review,
    this.isVerifiedPurchase,
    this.helpfulCount,
    this.status,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    productId: json["product_id"],
    reviewerName: json["reviewer_name"],
    reviewerImage: json["reviewer_image"],
    rating: json["rating"],
    title: json["title"],
    review: json["review"],
    isVerifiedPurchase: json["is_verified_purchase"],
    helpfulCount: json["helpful_count"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "reviewer_name": reviewerName,
    "reviewer_image": reviewerImage,
    "rating": rating,
    "title": title,
    "review": review,
    "is_verified_purchase": isVerifiedPurchase,
    "helpful_count": helpfulCount,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
  };
}
