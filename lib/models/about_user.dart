class AboutUser{
  AboutUser({
      this.type, 
      this.message, 
      this.data,});

  AboutUser.fromJson(dynamic json) {
    type = json['type'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)! as List<Data>?;
  }
  String? type="";
  String? message="";
  List<Data>? data=[];

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
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.address,
    this.role,
    this.userPoints,
    //this.userNotification,
  });

  Data.fromJson(dynamic json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
   // if (json['UserNotification'] != null) {userNotification = [];json['UserNotification'].forEach((v) {userNotification!.add(userNotification?.fromJson(v));});}
  }
  String? userId="";
  String? firstName="";
  String? lastName="";
  String? email="";
  String? imageUrl="";
  dynamic address="";
  String? role="";
  String? userPoints="";
  //List<dynamic>? userNotification=[];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['imageUrl'] = imageUrl;
    map['address'] = address;
    map['role'] = role;
    map['UserPoints'] = userPoints;
    //if (userNotification != null) {map['UserNotification'] = userNotification!.map((v) => v.toJson()).toList();}
    return map;
  }

}