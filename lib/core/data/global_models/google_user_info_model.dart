class GoogleUserInfoModel {
  final String name;
  final String email;
  final String avatarUrl;
  final String idToken;
  final String uid;

  GoogleUserInfoModel({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.idToken,
    required this.uid,
  });

  @override
  String toString() {
    return 'GoogleUserInfo(name: $name, email: $email, uid: $uid)';
  }
}
