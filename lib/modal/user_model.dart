class UserModel {
  int? id;
  String? token;

  UserModel({this.id, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
