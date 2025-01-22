import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Model/UserProfileModel.dart';
import 'package:whatsapp/ReuseWidgets/Camera.dart';
import 'package:whatsapp/ReuseWidgets/PopMenu.dart';
import '../RecieverProfile/RecieverProfile.dart';

class Chatting extends StatefulWidget {
  final UserProfileModel userProfileModel;

  Chatting({super.key, required this.userProfileModel});

  @override
  State<Chatting> createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  final _messageController = TextEditingController();
  final time = DateFormat('hh:mm a').format(DateTime.now());
  List options = [
    "View contacts",
    "Media, links, and docs",
    "Search",
    "Mute notifications",
    "Disappearing messages",
    "Wallpaper",
    "More ->"
  ];
  final currentUser = FirebaseAuth.instance.currentUser!.phoneNumber;
  final messageDataCollection = FirebaseFirestore.instance.collection("Chats");
  final chatData = FirebaseDatabase.instance.ref().child("messages");

  void _saveMessage() {
    final messageRef = chatData.child(currentUser!).push();
    messageRef.set({
      'message': _messageController.text.trim(),
      'phone': currentUser!,
      'time': time,
      'status': 'clock',
    }).then((_){
      messageRef.update({'status':'done'});
    }).then((_) {
      // Successfully saved message
      print('Message saved successfully.');

      // Get reference to the newly added message
      DatabaseReference reference = messageRef;
      // Do something with the reference if needed
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${reference.parent!.key}")));
      print('Reference to the message: ${reference.parent!.key}');
    }).catchError((error) {
      // Handle any errors that occur during the operation
      print('Failed to save message: $error');
    });
  }



  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {});
    _messageController.addListener(_onMessageChanged);
  }

  @override
  void dispose() {
    _messageController.removeListener(_onMessageChanged);
    _messageController.dispose();
    super.dispose();
  }

  void _onMessageChanged() {
    setState(() {});
  }

  AppBar chattingAppbar() {
    return AppBar(
      backgroundColor: grey,
      toolbarHeight: 65,
      leadingWidth: 300,
      leading: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ReceiverProfile()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BottomNav()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            CircleAvatar(
              radius: 22,
              backgroundImage:
                  NetworkImage(widget.userProfileModel.photoUrl),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: Text(widget.userProfileModel.name,
                      style: title, overflow: TextOverflow.ellipsis),
                ),
                Container(
                  width: 120,
                  child: Text("tap here to see info",
                      style: smallWhite, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.video,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.call,
            color: Colors.white,
          ),
        ),
        popMenuItems(option: options, size: options.length, context: context)
      ],
    );
  }

  Widget messageField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 13, right: 13, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                color: darkGrey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      cursorColor: green,
                      style: TextStyle(color: Colors.white),
                      maxLines: null,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.smiley,
                            color: Color(0xffa1acc7),
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file_rounded,
                            color: Color(0xffa1acc7),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        hintText: "Message",
                        hintStyle: subTitle,
                      ),
                    ),
                  ),
                  if (_messageController.text.isEmpty)
                    CameraWidget(color: Color(0xffa1acc7))
                ],
              ),
            ),
          ),
          SizedBox(width: 7),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: green, shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                final message = _messageController.text.trim();
                if (message.isNotEmpty) {
                  _saveMessage();
                  // _loadMessages();
                }
                _messageController.clear();
              },
              icon: _messageController.text == ""
                  ? Icon(Icons.mic, color: Colors.black)
                  : Icon(Icons.send, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget MessagingList() {
    return FirebaseAnimatedList(
      query: FirebaseDatabase.instance.ref("messages").child(currentUser!),  // Use child() method to specify the path
      reverse: false,
      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 45,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              color: snapshot.child('phone').value.toString() == currentUser
                  ? Color.fromRGBO(7, 94, 84, 50)
                  : darkGrey,
              elevation: 8,
              margin: snapshot.child('phone').value.toString() == currentUser
                  ? EdgeInsets.only(left: 100)
                  : EdgeInsets.only(right: 100),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 100,
                ),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.child('message').value.toString(),
                      style: messageText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(snapshot.child('time').value.toString(), style: smallWhite),
                        SizedBox(width: 5),
                        if (snapshot.child('phone').value.toString() == currentUser)
                          snapshot.child('status').value.toString() == "clock"
                              ? Icon(
                            Icons.access_time_rounded,
                            color: textGrey,
                            size: 18,
                          )
                              :snapshot.child('status').value.toString() == "done"
                              ? Icon(
                            Icons.done,
                            color: textGrey,
                            size: 18,
                          )
                              : snapshot.child('status').value.toString() != "scene"
                              ? Icon(
                            Icons.done_all,
                            color: textGrey,
                            size: 18,
                          )
                              : Icon(
                            Icons.done_all,
                            color: Colors.blue,
                            size: 18,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: chattingAppbar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat1.jfif"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: MessagingList(),
              ),
            ),
            messageField(context),
          ],
        ),
      ),
    );
  }
}
