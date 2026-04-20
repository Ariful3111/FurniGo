import 'package:zb_dezign/features/home/models/products_model.dart';

class FavouriteModel {
  final List<FavoriteItem> data;
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final String? firstPageUrl;
  final String? lastPageUrl;
  final List<FavoriteLink>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  FavouriteModel({
    required this.data,
    this.currentPage,
    this.from,
    this.lastPage,
    this.firstPageUrl,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (item) => FavoriteItem.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      currentPage: json['current_page'] as int?,
      from: json['from'] as int?,
      lastPage: json['last_page'] as int?,
      firstPageUrl: json['first_page_url'] as String?,
      lastPageUrl: json['last_page_url'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((link) => FavoriteLink.fromJson(link as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: json['per_page'] as int?,
      prevPageUrl: json['prev_page_url'] as String?,
      to: json['to'] as int?,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'data': data.map((item) => item.toJson()).toList(),
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'links': links?.map((link) => link.toJson()).toList(),
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'prev_page_url': prevPageUrl,
      'to': to,
      'total': total,
    };
  }
}

class FavoriteItem {
  final num? id;
  final num? userId;
  final num? productId;
  final Product? product;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FavoriteItem({
    this.id,
    this.userId,
    this.productId,
    this.product,
    this.createdAt,
    this.updatedAt,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      id: json['id'] as num?,
      userId: json['user_id'] as num?,
      productId: json['product_id'] as num?,
      product: json['product'] != null
          ? Product.fromJson(json['product'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'product': product?.toJson(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class FavoriteLink {
  final String? url;
  final String label;
  final bool active;

  FavoriteLink({this.url, required this.label, required this.active});

  factory FavoriteLink.fromJson(Map<String, dynamic> json) {
    return FavoriteLink(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'label': label, 'active': active};
  }
}
