import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Model/ContactsModel.dart';
import 'package:whatsapp/Model/UserProfileModel.dart';
import 'package:whatsapp/Provider/ContactProvider.dart';
import 'package:whatsapp/ReuseWidgets/HomeMenuAppbar.dart';
import 'package:whatsapp/ReuseWidgets/inviteList.dart';
import 'package:whatsapp/screens/Home/Add%20Contact/AddNewContact.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Broadcast/SearchBroadcast.dart';
import '../../../Constants/Colors.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final _currentUser = FirebaseAuth.instance.currentUser?.phoneNumber;
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    showAllContacts();
  }

  Future<void> showAllContacts() async {
    try {
      final receiveData = await _firestore
          .collection('WhatsApp')
          .doc(_currentUser)
          .collection("contacts")
          .get();

      if (receiveData.docs.isNotEmpty) {
        List<ContactsModel> contacts = receiveData.docs
            .map((doc) => ContactsModel.fromSnapshot(doc))
            .toList();

        for (var contact in contacts) {
          var profileDoc = await _firestore
              .collection('WhatsApp')
              .doc(contact.phoneNumber)
              .collection('profile')
              .doc('data')
              .get();
          if (profileDoc.exists) {
            var userProfile = UserProfileModel.fromSnapshot(profileDoc);
            context.read<ContactProvider>().setAllContacts(userProfile);
          }
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Contacts Loaded"),
          )
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: $e"),
      ));
    }
  }

  addNewItemsList(
      {required IconData icon, required String newTitle, var isTrue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor:
              !isTrue ? Colors.grey.shade800.withOpacity(.7) : green,
          child: Center(
              child: Icon(icon, color: !isTrue ? Colors.grey : Colors.black)),
        ),
        SizedBox(width: 20),
        Text(newTitle, style: title)
      ],
    );
  }

  contactsBody() {
    return Expanded(
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addNewItemsList(
                    icon: Icons.group_add_rounded,
                    newTitle: "New group",
                    isTrue: true),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addNewContact()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      addNewItemsList(
                          icon: Icons.person_add_alt_1_rounded,
                          newTitle: "New contact",
                          isTrue: true),
                      Icon(
                        Icons.qr_code_rounded,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                addNewItemsList(
                    icon: Icons.groups_rounded,
                    newTitle: "New community",
                    isTrue: true),
                SizedBox(height: 20),
                Text(
                  "Contacts on WhatsApp",
                  style: subTitle,
                ),
              ],
            ),
          ),
          Consumer<ContactProvider>(builder: (context, value, child) {
            return value.userProfileModel!.length == 0
                ? Center(
                    child: Text(
                      "No Contact Found",
                      style: status,
                    ),
                  )
                : ListView.builder(
                    itemCount: value.userProfileModel!.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var _contactsItems = value.userProfileModel![index];
                      return ListTile(
                        onTap: () {},
                        leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            backgroundImage: _contactsItems.photoUrl.isEmpty
                                ? NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
                                : NetworkImage(_contactsItems.photoUrl)),
                        title: Text("${_contactsItems.name}", style: title),
                        subtitle: Container(
                            width: 200,
                            child: Text(
                              "${_contactsItems.slogan}",
                              style: subTitle,
                              overflow: TextOverflow.ellipsis,
                            )),
                      );
                    });
          }),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text("Invite on WhatsApp", style: subTitle),
          ),
          SizedBox(height: 20),
          inviteList(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addNewItemsList(
                    icon: Icons.share_rounded,
                    newTitle: "Share invite link",
                    isTrue: false),
                SizedBox(
                  height: 20,
                ),
                addNewItemsList(
                    icon: Icons.question_mark_rounded,
                    newTitle: "Help",
                    isTrue: false),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: homeMenuAppbar(
          newTitle: "Select contact",
          newSubTitle: "117 contacts",
          context: context,
          screen: SearchBroadcast()),
      body: contactsBody(),
    );
  }
}
