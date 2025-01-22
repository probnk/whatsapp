import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/userProfileProvider.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';
import 'package:path/path.dart' as path;

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _nameController = TextEditingController();
  final List<String> statusMessages = [
    "Allah is the best creator🧡",
    "Available",
    "Busy",
    "At work",
    "In a meeting",
    "On vacation",
    "Sleeping",
    "Studying",
    "Eating",
    "Watching a movie",
    "Working out",
    "Feeling happy 😊",
    "Feeling sad ☹️",
    "Feeling bored 🙄",
    "Feeling excited 🎉",
    "Feeling tired 😴",
    "Feeling motivated 💪",
    "Just chilling",
    "Do not disturb",
    "Feeling creative 🎨",
    "Traveling ✈️",
  ];

  String _noProfile =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  File? _imageFile;
  final currentUser = FirebaseAuth.instance.currentUser?.phoneNumber;
  final uploadUserProfile = FirebaseFirestore.instance.collection("WhatsApp");

  Future<void> _pickImage(
      {required bool isCamera,
        required String slogan,
        required String name}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery,
      );
      final productProvider = context.read<UserProfileProvider>();
      if (pickedFile == null) return;
      context.read<UserProfileProvider>().toggleLoading(true);

      productProvider.setImageFile(File(pickedFile.path));

      final fileName = path.basename(_imageFile!.path);
      final storageRef =
      FirebaseStorage.instance.ref().child('$currentUser/$fileName');

      final previousPhotosRef =
      FirebaseStorage.instance.ref().child('$currentUser/');
      final listResult = await previousPhotosRef.listAll();
      if (listResult.items.isNotEmpty) {
        for (var item in listResult.items) {
          await item.delete();
        }
      }

      await storageRef.putFile(_imageFile!);
      final url = await storageRef.getDownloadURL();
      productProvider.setProductPhoto(url);
      productProvider.toggleLoading(false);

      await uploadUserProfile
          .doc(currentUser)
          .collection("profile")
          .doc("data")
          .set({
        'name': name,
        'slogan': slogan,
        'photoUrl': url,
        'phoneNumber': currentUser,
      });

      context.read<UserProfileProvider>().toggleLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Profile Uploaded")));
    } catch (e) {
      context.read<UserProfileProvider>().toggleLoading(false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  _profileBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(
          color: mediumGrey,
        ),
        SizedBox(
          height: 20,
        ),
        Consumer<UserProfileProvider>(builder: (context, value, child) {
          return Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(value.userProfile!.photoUrl),
                    fit: BoxFit.fill)
            ),
            child: Stack(
              children: [
                if(value.isLoading)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        shape: BoxShape.circle
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: grey,
                      ),
                    ),
                  ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap:_profilePhotoBottomSheet,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: green,
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(8),
                        decoration:
                        BoxDecoration(color: green, shape: BoxShape.circle),
                        child: Center(
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              InkWell(
                onTap: _bottomSheet,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person_2_outlined,
                      color: textGrey,
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name", style: subTitle),
                                Consumer<UserProfileProvider>(
                                    builder: (context, value, child) {
                                      return Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 110,
                                        ),
                                        child: Text(
                                          value.userProfile!.name,
                                          style: title,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      );
                                    })
                              ],
                            ),
                            SizedBox(
                              width: 140,
                            ),
                            Icon(
                              Icons.edit_outlined,
                              color: green,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                MediaQuery.of(context).size.width - 100),
                            child: Text(
                                "This is not your username or pin. This name will be visible to your Whatsapp contacts",
                                style: subTitle)),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: mediumGrey,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: sloganEditor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: textGrey),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("About", style: subTitle),
                            Consumer<UserProfileProvider>(
                                builder: (context, value, child) {
                                  return Text(value.userProfile!.slogan,
                                      style: title);
                                })
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.edit_outlined,
                      color: green,
                    ),
                  ],
                ),
              ),
              Divider(
                color: mediumGrey,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone, color: textGrey),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone", style: subTitle),
                      Text("$currentUser", style: title)
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  sloganEditor() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            color: grey,
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back,
                                color: Colors.white, size: 28)),
                        SizedBox(width: 20),
                        Text(
                          "About",
                          style: status,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: mediumGrey),
                SizedBox(height: 10),
                Text("Currently set to", style: subTitle),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<UserProfileProvider>(
                      builder: (context, value, child) {
                        return Text(value.userProfile!.slogan, style: title);
                      },
                    ),
                    Icon(Icons.edit_outlined, color: green)
                  ],
                ),
                SizedBox(height: 5),
                Divider(color: mediumGrey),
                Text("Select About", style: subTitle),
                SizedBox(height: 20),
                Consumer<UserProfileProvider>(builder: (context, value, child) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: statusMessages.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () async {
                            // value.selectedSloganIndex(index);
                            value.setSlogan(statusMessages[index]);
                            final name = value.userProfile!.name;
                            final slogan = value.userProfile!.slogan;
                            final url = value.userProfile!.photoUrl;

                            await uploadUserProfile
                                .doc(currentUser)
                                .collection("profile")
                                .doc("data")
                                .set({
                              'name': name,
                              'slogan': slogan,
                              'photoUrl': url,
                              'phoneNumber': currentUser
                            }).then((_) {
                              Navigator.of(context)
                                  .pop(); // Ensure this pops the correct sheet
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      "Profile updated",
                                      style: title,
                                    )),
                              );
                            }).catchError((error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Failed to update profile: $error")),
                              );
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${statusMessages[index]}",
                                  style: title,
                                ),
                                Icon(Icons.done,
                                    color: value.userProfile!.slogan == index
                                        ? green
                                        : Colors.transparent)
                              ],
                            ),
                          ),
                        );
                      });
                })
              ],
            ),
          );
        });
  }

  _bottomSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: grey,
        builder: (context) {
          return Container(
            color: grey,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: MediaQuery.of(context).size.height * .7,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  cursorColor: green,
                  controller: _nameController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: textGrey,
                        ),
                      ),
                      label: Text("Enter your name", style: smallWhite),
                      hintText: 'Full name',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w300),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: green, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: lightGrey))),
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel", style: smallGreen)),
                    SizedBox(
                      width: 30,
                    ),
                    Consumer<UserProfileProvider>(
                        builder: (context, value, index) {
                          return TextButton(
                            onPressed: () async {
                              value.setName(_nameController.text);
                              final name = value.userProfile!.name;
                              final slogan = value.userProfile!.slogan;
                              final url = value.userProfile!.photoUrl;

                              await uploadUserProfile
                                  .doc(currentUser)
                                  .collection("profile")
                                  .doc("data")
                                  .set({
                                'name': name,
                                'slogan': slogan,
                                'photoUrl': url,
                                'phoneNumber': currentUser
                              }).then((_) {
                                Navigator.of(context)
                                    .pop(); // Ensure this pops the correct sheet
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Profile updated")),
                                );
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                      Text("Failed to update profile: $error")),
                                );
                              });
                            },
                            child: Text("Save", style: smallGreen),
                          );
                        })
                  ],
                )
              ],
            ),
          );
        });
  }

  _profilePhotoBottomSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: grey,
        builder: (context) {
          return Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile photo", style: status),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyLight.delete,
                          color: Colors.grey,
                          size: 28,
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<UserProfileProvider>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              _pickImage(
                                  isCamera: true,
                                  slogan: value.userProfile!.slogan,
                                  name: value.userProfile!.name);
                              Navigator.of(context).pop();
                            },
                            splashColor: Colors.transparent,
                            child: profilePhotoRow(
                                icon: Icons.camera_alt_outlined, label: "Camera"),
                          );
                        }),
                    Consumer<UserProfileProvider>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              _pickImage(
                                  isCamera: false,
                                  slogan: value.userProfile!.slogan,
                                  name: value.userProfile!.name);
                              Navigator.of(context).pop();
                            },
                            splashColor: Colors.transparent,
                            child: profilePhotoRow(
                                icon: Icons.image_outlined, label: "Gallery"),
                          );
                        }),
                    profilePhotoRow(
                        icon: Icons.emoji_emotions_outlined, label: "Avatar")
                  ],
                )
              ],
            ),
          );
        });
  }

  profilePhotoRow({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: mediumGrey), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: green,
            size: 28,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: boldGreyNavBar,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: userProfileApp(context, "Profile"),
        backgroundColor: grey,
        body: _profileBody()
    );
  }
}