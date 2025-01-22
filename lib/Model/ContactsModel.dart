import 'package:cloud_firestore/cloud_firestore.dart';

class ContactsModel{
  String firstName;
  String lastName;
  String phoneNumber;

  ContactsModel({
    this.firstName = "",
    this.lastName = "",
    this.phoneNumber =""
  });

  factory ContactsModel.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return ContactsModel(
      firstName: data['first name'] ?? "",
      lastName: data['last name'] ?? "",
      phoneNumber: data['phone number'] ?? ""
    );
  }
}