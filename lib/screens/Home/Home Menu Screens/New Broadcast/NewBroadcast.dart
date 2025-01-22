import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/HomeMenuAppbar.dart';
import 'package:whatsapp/ReuseWidgets/newGroupFloatingActionButton.dart';
import 'package:whatsapp/ReuseWidgets/newGroupUsers.dart';
import 'package:whatsapp/ReuseWidgets/usersListTile.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Broadcast/SearchBroadcast.dart';
import 'package:whatsapp/screens/Home/Home%20Menu%20Screens/New%20Group/NewGroup.dart';

class NewBroadcast extends StatefulWidget {
  const NewBroadcast({super.key});

  @override
  State<NewBroadcast> createState() => _NewBroadcastState();
}

class _NewBroadcastState extends State<NewBroadcast> {

  List<Map<String, dynamic>> whatsappContacts = [
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Alice Johnson',
      'subTitle': 'Available',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Mike Brown',
      'subTitle': 'Busy',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Emily Davis',
      'subTitle': 'Available',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Kevin White',
      'subTitle': 'Offline',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Sarah Lee',
      'subTitle': 'Available',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'David Kim',
      'subTitle': 'Busy',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Lisa Nguyen',
      'subTitle': 'Offline',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Tom Harris',
      'subTitle': 'Available',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Rachel Patel',
      'subTitle': 'Busy',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Chris Martin',
      'subTitle': 'Offline',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Jessica Hall',
      'subTitle': 'Available',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Brian Wilson',
      'subTitle': 'Busy',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Heather Brooks',
      'subTitle': 'Offline',
    },
  ];

  _newBroadcastBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Divider(color: mediumGrey),
          SizedBox(height: 10),
          Text(
              "Only contacts with +92 317 0731446 in their address book"
                  " will receive your broadcast messages",
              style: subTitle,textAlign: TextAlign.center
          ),
          SizedBox(height: 5),
          Divider(color: mediumGrey),
          ListView.builder(
              itemCount: whatsappContacts.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            child: userListTile(items:whatsappContacts , index: index, context: context),);
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: newGroupFloatingButton(Icons.done_rounded),
      backgroundColor: grey,
      appBar: homeMenuAppbar(
          screen: SearchBroadcast(),
          newTitle: "New broadcast",
          newSubTitle: "0 of 256 selected",
          context: context),
      body: _newBroadcastBody(),
    );
  }
}
