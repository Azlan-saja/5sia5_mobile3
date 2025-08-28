class UserModel {
  final int? userId;
  final String userName;
  final String userPassword;

  UserModel({
    this.userId,
    required this.userName,
    required this.userPassword,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        userName: json["userName"],
        userPassword: json["userPassword"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "userPassword": userPassword,
      };
}
