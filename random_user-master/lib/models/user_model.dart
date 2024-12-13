class UserModel {
  List<dynamic> result;

  UserModel({required this.result});

  factory UserModel.fromJson(Map<String, dynamic> json) {
   
    return UserModel(result: json["results"]);
  }
}
