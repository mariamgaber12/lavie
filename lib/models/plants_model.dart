
class PlantModel {
  String? type = "";
  String? message = "";
  List<Data>? data = [];

  PlantModel({this.type, this.message, this.data});


  PlantModel.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  String plantId="";
  String name="";
  String description="";
  String imageUrl="";
  int waterCapacity=0;
  int sunLight=0;
  int temperature=0;

  Data({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,});

  Data.fromJson(dynamic json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plantId'] = plantId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['waterCapacity'] = waterCapacity;
    map['sunLight'] = sunLight;
    map['temperature'] = temperature;
    return map;
  }

}