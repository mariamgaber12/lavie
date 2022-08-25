import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/seed_model.dart';
import 'package:la_vie/models/tool_model.dart';

class Blog {
  String? type="";
  String? message="";
  List<Data>? data=[];

  Blog({
      this.type, 
      this.message, 
      this.data,});

  Blog.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null) as List<Data>?;
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
  Data({
    this.plants,
    this.seeds,
    this.tools,});

  Data.fromJson(dynamic json) {
    if (json['plants'] != null) {
      plants = [];
      json['plants'].forEach((v) {
        plants!.add(PlantModel.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      seeds = [];
      json['seeds'].forEach((v) {
        seeds!.add(SeedModel.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      tools = [];
      json['tools'].forEach((v) {
        tools!.add(ToolModel.fromJson(v));
      });
    }
  }
  List<PlantModel>? plants=[];
  List<SeedModel>? seeds=[];
  List<ToolModel>? tools=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (plants != null) {
      map['plants'] = plants!.map((v) => v.toJson()).toList();
    }
    if (seeds != null) {
      map['seeds'] = seeds!.map((v) => v.toJson()).toList();
    }
    if (tools != null) {
      map['tools'] = tools!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}