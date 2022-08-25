class ToolModel {

  String? type="";
  String? message="";
  List<Data>? data=[];

  ToolModel({
       this.type,
       this.message,
       this.data,});

  ToolModel.fromJson(dynamic json) {
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
    map['data'] = data!.map((v) => v.toJson()).toList();
    return map;
  }

}


class Data {
  String toolId="";
  String name="";
  String description="";
  String imageUrl="";

  Data({
    required this.toolId,
    required this.name,
    required this.description,
    required this.imageUrl,});

  Data.fromJson(dynamic json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['toolId'] = toolId;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }

}