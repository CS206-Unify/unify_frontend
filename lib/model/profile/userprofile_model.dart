class UserProfile {
  final String username;
  final String email;
  final String country;

  UserProfile(
      {required this.username, required this.email, required this.country});

  factory UserProfile.fromJson(Map<String, dynamic> map) {
    var userMap = map['user']; // Access the nested 'user' object
    return UserProfile(
      username: userMap["username"],
      email: userMap["email"],
      country: userMap["country"],
    );
  }
}
