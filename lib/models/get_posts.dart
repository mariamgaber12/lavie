class GetPosts {
  String? type;
  String? message;
  List<Data>? data;

  GetPosts({this.type, this.message, this.data});

  GetPosts.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? forumId="";
  String? title="";
  String? description="";
  String? imageUrl="";
  String? userId="";
  List? forumLikes=[];
  List? forumComments=[];
  User? user;

  Data(
      {this.forumId,
        this.title,
        this.description,
        this.imageUrl,
        this.userId,
        this.forumLikes,
        this.forumComments,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = <String>[];
      json['ForumLikes'].forEach((v) {
        forumLikes!.add(json['ForumLikes']);
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <String>[];
      json['ForumComments'].forEach((v) {
        forumComments!.add(json['ForumComments']);
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forumId'] = forumId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    if (forumLikes != null) {
      data['ForumLikes'] = forumLikes!.map((v) => v!.toJson()).toList();
    }
    if (forumComments != null) {
      data['ForumComments'] =
          forumComments!.map((v) => v!.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? imageUrl;

  User({this.firstName, this.lastName, this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
