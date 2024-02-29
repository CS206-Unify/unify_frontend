// class ProfileListing {
//   final String id;
//   final String name;
//   final int trophies;
//   final int wins3v3;
//   final String region;
//   final String brawler;
//   final int rank;

//   ProfileListing( 
//       {required this.id,
//       required this.name,
//       required this.trophies,
//       required this.wins3v3,
//       required this.region,
//       required this.brawler, required this.rank});

//   factory ProfileListing.fromJson(Map<String, dynamic> json){
//     return switch(json){
//       {
//         '_id': String _id,
//         'username': String username,
//         'trophies': String
//       } => ProfileListing(
//         id: _id, 
//         name: username, 
//         trophies: trophies, 
//         wins3v3: wins3v3, 
//         region: region, 
//         brawler: brawler), => throw const FormatException("Failed to load Profile Listing")
//     };
//   }
// }
