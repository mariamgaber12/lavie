class Post {
  String? type="";
  String? message="";
  Data? data ;

  Post({this.type, this.message, this.data});

  Post.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;

  Data(
      {this.forumId, this.title, this.description, this.imageUrl, this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forumId'] = forumId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    return data;
  }
}