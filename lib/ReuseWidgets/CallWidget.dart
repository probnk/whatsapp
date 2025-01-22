import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

tile() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 24,
        backgroundColor: green,
        child: Icon(Icons.link,size: 30),
      ),
      SizedBox(width: 20),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create call link",style: title),
          Text("Share a link for your Whatsapp call",style: subTitle,)
        ],
      )
    ],
  );
}

callBody() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
    child: ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        tile(),
        SizedBox(height: 20,),
        Text("Recent",style: title,),
        SizedBox(height: 20,),
        callRecordTiles(),
        SizedBox(height: 10,),
        Divider(color: Colors.grey.shade800),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your personal calls are ",style: smallGrey,),
            Text("end-to-end encrypted",style: smallGreen,)
          ],
        )
      ],
    ),
  );
}

callRecordTiles() {
  return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/images/men.jpg"),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Asad",style: title),
                        Text("June 17, 7:04 PM",style: subTitle),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyBold.call,color: Colors.white))
              ],
            )
        );
      });
}