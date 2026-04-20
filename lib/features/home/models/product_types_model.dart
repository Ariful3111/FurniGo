class ProductTypesModel {
  final List<ProductType> data;

  ProductTypesModel({required this.data});

  factory ProductTypesModel.fromJson(Map<String, dynamic> json) {
    return ProductTypesModel(
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (item) => ProductType.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'data': data.map((item) => item.toJson()).toList()};
  }
}

class ProductType {
  final num? id;
  final String? name;

  ProductType({this.id, this.name});

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(id: json['id'] as num?, name: json['name'] as String?);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
