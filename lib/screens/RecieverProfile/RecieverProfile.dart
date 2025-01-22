import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/Constants/fonts.dart';
import '../../Constants/Colors.dart';
import '../../ReuseWidgets/PopMenu.dart';

class ReceiverProfile extends StatefulWidget {

  ReceiverProfile({super.key});

  @override
  State<ReceiverProfile> createState() => _ReceiverProfileState();
}

class _ReceiverProfileState extends State<ReceiverProfile> {
  var icons = [IconlyBold.call, IconlyLight.video, IconlyLight.search];
  var texts = ["Audio", "Video", "Search"];
  List options = ["Share","Edit","View in address book","Verify security code"];

  userData() {
    return Container(
      color: grey,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff435A64)),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(
                          "assets/images/men2.png"),
                    ),
                  ),
                  Text(
                    "Umar Farooq",
                    style: title,
                  ),
                  Text(
                    "+92 3170731446",
                    style: subTitle,
                  )
                ],
              ),
              popMenuItems(context: context,size: options.length,option: options)
            ],
          ),

          SizedBox(
            height: 16,
          ),
          Container(
              height: 100,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.grey.shade700)),
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(icons[index], color: green)),
                            Text(
                              texts[index],
                              style: smallWhite,
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  media(
      {required var icon1,
      required var icon2,
      required var title1,
      required var title2,
      required bool isTrue,
      var subtitle1,
      var subtitle2,
      var color}) {
    return Container(
      color: grey,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon1,
                color: color == Colors.redAccent ? color : textGrey,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title1,
                      style: color == Colors.redAccent
                          ? TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)
                          : title),
                  if (isTrue)
                    Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text(subtitle1, style: subTitle)),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon2,
                color: color == Colors.redAccent ? color : textGrey,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title2,
                      style: color == Colors.redAccent
                          ? TextStyle(
                              color: color,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)
                          : title),
                  if (isTrue) Text(subtitle2, style: subTitle),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  commonGroups() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      color: grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("1 Groups in common",style: subTitle,),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: green, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.group_outlined, color: Colors.black),
                ),
              ),
              SizedBox(width: 20,),
              Container(
                  constraints: BoxConstraints(
                    minWidth: 0,
                    maxWidth: MediaQuery.of(context).size.width - 150,
                    maxHeight: 24
                  ),
                  child: Text("Create group with Muhammad Shamir",style: title,overflow: TextOverflow.ellipsis,)
              )
            ],
          ),
          SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             CircleAvatar(
               radius: 20,
               backgroundImage: AssetImage("assets/images/study.jfif"),
             ),
             SizedBox(width: 20,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Study",style: title,),
                 Text("You, Mohsin, Muhammad Shamir",style: subTitle,),
               ],
             )
           ],
         )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          userData(),
          SizedBox(height: 10),
          media(
              icon1: Icons.notifications_outlined,
              icon2: Icons.image_outlined,
              title1: "Notifications",
              title2: "Media visibility",
              isTrue: false
          ),
          SizedBox(height: 10),
          media(
              icon1: Icons.lock_outline_rounded,
              icon2: Icons.timer,
              title1: "Encryption",
              title2: "Disappearing messages",
              isTrue: true,
              subtitle1:
                  "Messages and calls are end-to-end encrypted. Tap to verify",
              subtitle2: "Off"
          ),
          SizedBox(
            height: 10,
          ),
          commonGroups(),
          SizedBox(
            height: 10,
          ),
          media(
              icon1: Icons.notifications_outlined,
              icon2: Icons.image_outlined,
              title1: "Block Muhammad Shamir",
              title2: "Report Muhammad Shamir",
              isTrue: false,
              color: Colors.redAccent
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}