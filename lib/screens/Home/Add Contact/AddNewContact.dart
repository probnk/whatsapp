import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';
import '../../../Constants/fonts.dart';

class addNewContact extends StatefulWidget {
  const addNewContact({super.key});

  @override
  State<addNewContact> createState() => _addNewContactState();
}

class _addNewContactState extends State<addNewContact> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _currentUser = FirebaseAuth.instance.currentUser!.phoneNumber;
  final _saveContact = FirebaseFirestore.instance.collection("WhatsApp");

  iconTextField(
      {required String label,
        required String hint,
        required IconData icon,
        required TextEditingController controller}) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        autofocus: true,
        cursorColor: green,
        controller: controller,
        decoration: InputDecoration(
            label: Text(label, style: smallWhite),
            hintText: hint,
            hintStyle:
            TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            prefixIcon: Icon(icon, color: textGrey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: green, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: lightGrey))),
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  Future<void> saveUserContact() async {
    try {
      final phoneNumber = _phoneNumberController.text.trim();

      // Check if the phone number is the same as the current user's number
      if (phoneNumber == _currentUser) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("You cannot add yourself as a contact."),
        ));
        return;
      }

      // Check if the phone number is already in the contacts collection
      final querySnapshot = await _saveContact
          .doc(_currentUser)
          .collection("contacts")
          .where("phone number", isEqualTo: phoneNumber)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("This contact already exists in your contacts."),
        ));
        return;
      }

      // Check if the user of that number has a collection in Firestore
      final userDoc =
      await _saveContact.doc(phoneNumber).collection("profile").doc("data").get();
      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User with this number is not registered on WhatsApp."),
        ));
        return;
      }

      // Save the contact if all conditions are met
      await _saveContact
          .doc(_currentUser)
          .collection("contacts")
          .doc()
          .set({
        'first name': _firstNameController.text.trim(),
        'last name': _lastNameController.text.trim(),
        'phone number': phoneNumber,
      })
          .then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Contact Added")),
        );
      });
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: userProfileApp(context, "New contact"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ListView(
          children: [
            iconTextField(
                label: "First name",
                hint: "Enter first name",
                icon: Icons.person_outline_rounded,
                controller: _firstNameController),
            SizedBox(height: 20),
            iconTextField(
                label: "Last name",
                hint: "Enter last name",
                icon: Icons.person_outline_rounded,
                controller: _lastNameController),
            SizedBox(height: 20),
            iconTextField(
                label: "Phone number",
                hint: "Enter phone number",
                icon: Icons.phone,
                controller: _phoneNumberController),
            SizedBox(height: 20),
            Text(
              "Add information",
              style: smallGreen,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: saveUserContact,
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  elevation: 8,
                ),
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
