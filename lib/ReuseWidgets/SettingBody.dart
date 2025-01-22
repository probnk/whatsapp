import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Provider/userProfileProvider.dart';
import 'package:whatsapp/ReuseWidgets/Languages.dart';
import 'package:whatsapp/screens/AddAccount/AddAccount.dart';
import 'package:whatsapp/screens/Setting/Accounts/Account.dart';
import 'package:whatsapp/screens/Setting/Avatar/Avatar.dart';
import 'package:whatsapp/screens/Setting/Chats/Chats.dart';
import 'package:whatsapp/screens/Setting/Notifications/Notifications.dart';
import 'package:whatsapp/screens/Setting/Privacy/Privacy.dart';
import 'package:whatsapp/screens/Setting/QR%20code/QRCode.dart';
import 'package:whatsapp/screens/Setting/Storage/Storage.dart';
import 'package:whatsapp/screens/Setting/UserProfile/UserProfile.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/fonts.dart';
import '../../../ReuseWidgets/ColumnRowsStuctures.dart';
import '../screens/Setting/Help/Help.dart';
import '../screens/Setting/Invite Friend/InviteFriends.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  String _noProfile =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";
  var _screen = [
    Account(),
    Privacy(),
    Avatar(),
    Chats(),
    Notifications(),
    Storage(),
  ];

  var _settings = [
    {
      'title': 'Account',
      'icon': Icons.key_rounded,
      'subtitle': 'Security notifications, change number',
    },
    {
      'title': 'Privacy',
      'icon': Icons.lock_outline_rounded,
      'subtitle': 'Block contacts, disappearing messages',
    },
    {
      'title': 'Avatar',
      'icon': IconlyLight.profile,
      'subtitle': 'Create, edit, profile photo',
    },
    {
      'title': 'Chats',
      'icon': Icons.chat_outlined,
      'subtitle': 'Theme, wallpapers, chat history',
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications_outlined,
      'subtitle': 'Messages, group & call tones',
    },
    {
      'title': 'Storage and data',
      'icon': Icons.storage_rounded,
      'subtitle': 'Network usage, auto-download',
    },
  ];

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AddAccount()));
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  _settingBody(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Divider(color: mediumGrey),
        _userSettingData(),
        Divider(color: mediumGrey),
        _settingItemsList(context),
        avatarTitleSubTitle(
            context: context,
            isTrue: true,
            icons: Icons.language_rounded,
            newSubTitle: "English",
            newTitle: "App Language",
            onPressed: () {
              bottomSheet(context);
            }),
        avatarTitleSubTitle(
            context: context,
            isTrue: true,
            newTitle: "Help?",
            newSubTitle: "Help center, contact us, privacy policy",
            icons: Icons.question_mark_rounded,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Help()));
            }),
        iconTitleList(
          isTrue: true,
          newTitle: "Invite a friend",
          icon: Icons.group_outlined,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InviteFriend()));
          },
        ),
        iconTitleList(
          isTrue: true,
          newTitle: "App Updates",
          icon: Icons.security_update_good_rounded,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => InviteFriend()));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Also From Meta",
            style: subTitle,
          ),
        ),
        iconTitleList(
            isTrue: true,
            newTitle: "Open App",
            icon: Icons.apple_rounded,
            onPressed: () {
              _launchURL(
                  'https://itunes.apple.com/us/app/apple-store/id375380948');
            }),
        iconTitleList(
            isTrue: true,
            newTitle: "Open Facebook",
            icon: Icons.facebook_rounded,
            onPressed: () {
              _launchURL(
                  'https://itunes.apple.com/us/app/apple-store/id375380948');
            })
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _userSettingData() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserProfile()));
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Consumer<UserProfileProvider>(builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: value.userProfile!.photoUrl.isEmpty
                                  ? NetworkImage(_noProfile)
                                  : NetworkImage(value.userProfile!.photoUrl),
                              fit: BoxFit.fill)),
                      child: value.isLoading
                          ? Container(
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            shape: BoxShape.circle),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: grey,
                          ),
                        ),
                      )
                          : Text(""),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            constraints: BoxConstraints(maxWidth: 163),
                            child: Text(
                              value.userProfile!.name.isEmpty ? "" : value.userProfile!.name,
                              style: status,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Container(
                            constraints: BoxConstraints(maxWidth: 163),
                            child: Text(
                              value.userProfile!.slogan.isEmpty ? "" :value.userProfile!.slogan,
                              style: subTitle,
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    )
                  ],
                );
              }),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => QRCode()));
                      },
                      icon: Icon(Icons.qr_code, color: green)),
                  IconButton(
                      onPressed: _showUserBottomSheet,
                      icon: Icon(Icons.arrow_drop_down_circle_outlined,
                          color: green)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _settingItemsList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: _settings.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return avatarTitleSubTitle(
                context: context,
                isTrue: false,
                items: _settings,
                screen: _screen,
                index: index);
          }),
    );
  }

  _showUserBottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * .22,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: grey,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Container(
                    height: 3,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: textGrey),
                  )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<UserProfileProvider>(
                      builder: (context, value, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: value.userProfile!.photoUrl.isEmpty
                                  ? NetworkImage(_noProfile)
                                  :NetworkImage(value.userProfile!.photoUrl),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text( value.userProfile!.name.isEmpty ? "" : value.userProfile!.name, style: status),
                                Container(
                                    constraints: BoxConstraints(maxWidth: 163),
                                    child: Text(
                                      FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
                                      style: subTitle,
                                      overflow: TextOverflow.ellipsis,
                                    ))
                              ],
                            )
                          ],
                        );
                      }),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration:
                    BoxDecoration(color: green, shape: BoxShape.circle),
                    child: Icon(Icons.done, color: grey, size: 18),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  signOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Add account",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _settingBody(context);
  }
}
