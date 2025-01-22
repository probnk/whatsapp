import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/screens/Home/Add%20Contact/Contacts.dart';
import 'package:whatsapp/screens/Home/MetaSearch.dart';
import '../Constants/fonts.dart';
import '../Model/UserProfileModel.dart';
import '../Provider/HomeProvider.dart';
import '../Provider/userProfileProvider.dart';

final uploadUserProfile = FirebaseFirestore.instance.collection("WhatsApp");


Future<void> profileLoader(BuildContext context) async {
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

List label1 = [
  "Smart home device recs",
  "Best Mexican cookbooks",
  "Why do cats purr?",
  "Manga vs. graphic novel?",
  "Knitting reels",
  "Hybrid vehicles 101",
  "Retirement saving guide",
  "How to beat Rubik's Cube",
  "5 eg protein resources",
  "I need help job hunting"
];
List label2 =[
  "Music streaming recs",
  "Kitten videos",
  "NY-set TV shows?",
  "DIY gifts on a budget",
  "Imagine a 70s living room",
  "Recipe's videos",
  "Healthy meal prep for 1",
  "How to create website",
  "DIY furniture tips",
  "DIY birds feeder ideas"
];

List label3 =[
  "Natural cleaning ideas",
  "Top architecture books",
  "Buckets list hikes",
  "Period drama film recs",
  "Calligraphy videos",
  "2-minutes lunch recipe",
  "Best new Hip-Hop albums",
  "Imagine the clown in the Paris",
  "Outfit inspiration videos",
  "How to avoid burnout"
];


encryptedmessage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Your personal messages are ", style: smallGrey),
      Text("end-to-end encrypted", style: smallGreen)
    ],
  );
}

homeFloatingButton({required final double bottom,required BuildContext context}) {
  return Container(
    height: 120,
    width: 120,
    alignment: Alignment.bottomRight,
    margin: EdgeInsets.only(bottom: bottom),
    child: Column(
      children: [
        Container(
          height: 44,
          width: 44,
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
              onPressed: () {},
              elevation: 8,
              backgroundColor: Color(0xff212C2C),
              child: Lottie.asset("assets/images/meta.json")),
        ),
        FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Contacts()));
            },
            elevation: 8,
            backgroundColor: green,
            tooltip: "See Contacts",
            child: Icon(
              IconlyBold.chat,
              color: Colors.black87,
              size: 27,
            ))
      ],
    ),
  );
}

searchMetaAI(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), color: Colors.white24),
    child: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MetaSearch()));
        },
        child: Row(
          children: [
            Lottie.asset("assets/images/meta.json",
                width: 24, height: 24, repeat: true),
            Container(
                height: 50,
                width: 300,
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ask Meta AI or Search",
                  style: TextStyle(color: Colors.white70),
                )),
          ],
        ),
      ),
    ),
  );
}

Widget listTile(BuildContext context) {
  return Consumer<HomeProvider>(builder: (context, value, child) {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: ListTile(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Chatting(userProfileModel: chatList[index],)));
                  },
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/images/men.jpg}"),
                  ),
                  title: Text("Umar Farooq", style: title),
                  subtitle: Container(
                      width: 200,
                      child: Text("Ok", style: subTitle,overflow: TextOverflow.ellipsis,)),
                  trailing: Text("12:00 Pm",
                      style: GoogleFonts.roboto(
                          color: Colors.grey.shade400, fontSize: 13))),
            );
          }),
    );
  });
}

itemsList() {
  return Container(
    height: 130,
    padding: EdgeInsets.symmetric(horizontal: 10),
    color: Colors.grey.shade900,
    child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, upperIndex) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Color(0xff121212),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(IconlyBroken.camera, color: green, size: 22),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${upperIndex == 0 ? label1[index] : upperIndex == 1 ? label2[index] : label3[index]}",
                        style: smallGrey,
                      )
                    ],
                  ),
                );
              },
            ),
          );
        }),
  );
}
