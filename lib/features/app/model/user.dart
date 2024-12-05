class UserModel {
  final String tokenType;
  final String accessToken;

  UserModel({
    required this.tokenType,
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return {
      "token_type": tokenType,
      "access_token": accessToken
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      tokenType: map['token_type'],
      accessToken: map['access_token'],
    );
  }
}
