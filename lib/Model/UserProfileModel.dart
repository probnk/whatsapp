import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfileModel {
  String name;
  String phoneNumber;
  String photoUrl;
  String slogan;

  UserProfileModel({
    this.name = "Unknown",
    this.phoneNumber = "",
    this.photoUrl =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
    this.slogan = "",
  });

  factory UserProfileModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return UserProfileModel(
      name: data['name'] ?? "Unknown",
      phoneNumber: data['phoneNumber'] ?? "",
      photoUrl: data['photoUrl'] ?? "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      slogan: data['slogan'] ?? "",
    );
  }
}