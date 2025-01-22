import 'package:flutter/material.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/usersListTile.dart';

class NewGroupUser extends StatefulWidget {
  const NewGroupUser({super.key});

  @override
  State<NewGroupUser> createState() => _NewGroupUserState();
}

class _NewGroupUserState extends State<NewGroupUser> {

  List<Map<String, dynamic>> frequentlyContacted = [
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'John Doe',
      'subTitle': 'Hello, how are you?',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Jane Doe',
      'subTitle': 'Hey, what\'s up?',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Bob Smith',
      'subTitle': 'Hi, how can I help you?',
    },
  ];

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

  List<Map<String, dynamic>> inviteContacts = [
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Olivia Taylor',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Alexander Brown',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Samantha Johnson',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Ethan Davis',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men.jpg',
      'title': 'Lily White',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men2.png',
      'title': 'Noah Lee',
      'subTitle': 'Invite to WhatsApp',
    },
    {
      'profileUrl': 'assets/images/men1.jfif',
      'title': 'Ava Kim',
      'subTitle': 'Invite to WhatsApp',
    },
  ];

  _listBuilder(List<Map<String?,dynamic>> items){
    return ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: userListTile(items: items, index: index, context: context)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Divider(color: mediumGrey),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Frequently Contacted",style: subTitle),
              _listBuilder(frequentlyContacted),
              SizedBox(height: 20),
              Text("Contacts on whatsapp",style: subTitle),
              _listBuilder(whatsappContacts),
              SizedBox(height: 20,),
              Text("Invite to WhatsApp",style: subTitle),
              _listBuilder(inviteContacts)
            ],
          ),
        ),

      ],
    );
  }
}