import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/SettingBody.dart';
import 'package:whatsapp/screens/Setting/SearchSetting.dart';
import '../../Model/UserProfileModel.dart';
import '../../Provider/userProfileProvider.dart';
import '../../ReuseWidgets/settingAppbar.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  final currentUser = FirebaseAuth.instance.currentUser?.phoneNumber;
  final uploadUserProfile = FirebaseFirestore.instance.collection("WhatsApp");

  @override
  void initState() {
    super.initState();
   // _profileLoader();
  }

  Future<void> _profileLoader() async {
    try {
      context.read<UserProfileProvider>().toggleLoading(true);
      final currentUser = FirebaseAuth.instance.currentUser?.phoneNumber;
      final uploadUserProfile = FirebaseFirestore.instance
          .collection("WhatsApp")
          .doc(currentUser)
          .collection("profile")
          .doc("data");

      var data = await uploadUserProfile.get();

      if (data.exists) {
        var userProfile = UserProfileModel.fromSnapshot(data);
        context.read<UserProfileProvider>().setUserData(userProfile);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Profile not found!")));
      }
      context.read<UserProfileProvider>().toggleLoading(false);
    } catch (e) {
      context.read<UserProfileProvider>().toggleLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: settingAppbar(context, "Setting",SearchSetting()),
        body: SettingBody());
  }
}