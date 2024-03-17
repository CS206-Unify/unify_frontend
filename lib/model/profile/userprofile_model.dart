class UserProfile {
  final String username;
  final String email;
  final String country;

  UserProfile(
      {required this.username, required this.email, required this.country});

  factory UserProfile.fromJson(Map<String, dynamic> map) {
    return UserProfile(
      username: map["username"],
      email: map["email"],
      country: map["country"],
    );
  }
}
