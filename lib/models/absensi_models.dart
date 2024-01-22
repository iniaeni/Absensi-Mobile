class AbsensiModels {
  String? image;
  String? name;
  String? nis;
  String? lat;
  String? lon;

  AbsensiModels({this.image, this.name, this.nis, this.lat, this.lon});

  AbsensiModels.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    name = json["name"];
    nis = json["nis"];
    lat = json["lat"];
    lon = json["lon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["image"] = image;
    data["name"] = name;
    data["nis"] = nis;
    data["lat"] = lat;
    data["lon"] = lon;
    return data;
  }
}
