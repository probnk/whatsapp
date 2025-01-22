import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key});

  final WebsiteURL = Uri.parse('https://web.whatsapp.com/');

  avatarItems(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.2),
            child: Image.asset("assets/images/avatar.png",width:width-25,height: height * .3,)
        ),
        Text("Say more with Avatars now on WhatsApp",style: smallWhite),
        SizedBox(height: 10,),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: green,
                padding: EdgeInsets.symmetric(horizontal: 100),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                )
            ),
            child: Text("Create your Avatar",style: TextStyle(color: Colors.black),))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: userProfileApp(context, "Avatar"),
      backgroundColor: grey,
      body: Column(
        children: [
          Expanded(
            child: Container(
                color: Colors.black,
                child:avatarItems(width,height)
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: Link(
                  uri: WebsiteURL,
                  builder: (context,openLink) => TextButton(
                      onPressed: openLink,
                      child: Text('Learn more',style: TextStyle(color: Colors.blue),)),
              ),
            )
          ),
        ],
      ),
    );
  }
}