import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import 'package:whatsapp/Constants/Colors.dart';

import '../../Constants/fonts.dart';

class CommunitiesGroups extends StatelessWidget {
  const CommunitiesGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: grey,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          toolbarHeight: 80,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: [StretchMode.blurBackground],
            title: ListTile(
              leading: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/air.png"),
              ),
              title: Text("BSCS|AU A&AC",
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16)),
              subtitle: Text("Community: 7 groups",
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade400, fontSize: 11)),
            ),
          ),
          actions: [
            PopupMenuButton(
              color: grey,
              elevation: 8,
              icon: Icon(Icons.more_vert_rounded, color: Colors.white),
              onSelected: (value) {
                // Handle the selected value
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Community info",
                      style: TextStyle(color: Colors.white)),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text("View members",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
        body: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            color: grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.only(bottom: 10, right: 3),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: green.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.speaker_phone_rounded,
                                color: Colors.green.shade50,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.av_timer_outlined,
                                    color: Colors.grey.shade400,
                                    size: 24,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Announcements", style: title),
                              ],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: Text("Sir:Sir Imran will show the...",
                                    style: subTitle))
                          ],
                        ),
                      ],
                    ),
                    Text("6/17/24", style: subTitle)
                  ],
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Group's you're in",
                  style: subTitle,
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundImage: AssetImage("assets/images/air.png"),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("BSCS-F22", style: title),
                              ],
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width - 150,
                                child: Text(
                                    "Sir:Dear All AoA Reference is made to...",
                                    style: subTitle))
                          ],
                        ),
                      ],
                    ),
                    Text("6/15/24", style: subTitle)
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade800,
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Groups you can join", style: subTitle),
                SizedBox(height: 10),
                ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage("assets/images/air.png"),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("BSCS-F22", style: title),
                                  ],
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 160,
                                    child: Text(
                                        "Request to join",
                                        style: subTitle))
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: Text("+ Add group",style: TextStyle(color: Colors.black),)),
          )
        ]
      )
    );
  }
}
