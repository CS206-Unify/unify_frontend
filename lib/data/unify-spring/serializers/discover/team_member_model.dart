class TeamMember {
  final String id;

  TeamMember({
    required this.id,
  });

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      id: map["_id"],
    );
  }
}
