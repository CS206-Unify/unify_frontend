class UserBsTeamsListing {
  final String id;
  final String name;
  final String imgUrl;

  UserBsTeamsListing(
      {required this.id, required this.name, required this.imgUrl});

  factory UserBsTeamsListing.fromMap(Map<String, dynamic> map) {
    return UserBsTeamsListing(
        id: map["_id"],
        name: map["teamName"],
        imgUrl: map["imageString"] ?? "");
  }
}
