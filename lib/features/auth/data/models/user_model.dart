class UserModel {
  final String userid;
  final String name;
  final String email;
  final bool hasActiveCart;

  UserModel({
    required this.userid,
    required this.name,
    required this.email,
    required this.hasActiveCart,
  });

  // Convert Firestore doc -> UserModel
  factory UserModel.fromJson(jsonData) {
    return UserModel(
      userid: jsonData['userid'] ?? '',
      name: jsonData['name'] ?? '',
      email: jsonData['email'] ?? '',
      hasActiveCart: jsonData['hasActiveCart'] ?? '',
    );
  }


}
