class RoomsModel {
  List<Rooms>? data;

  RoomsModel({this.data});

  RoomsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Rooms>[];
      json['data'].forEach((v) {
        data!.add(Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  int? id;
  String? name;
  String? imageUrl;

  Rooms({this.id, this.name, this.imageUrl});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    return data;
  }
}
