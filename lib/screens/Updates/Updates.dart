import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/UpdatesProvider.dart';

import '../../Constants/Colors.dart';

class Updates extends StatefulWidget {
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {

  var text = ["ARY Digigtal HD","WhatsApp","Meta AI"];
  var otherStatus = ["Jhon Doe","Charlie","Amenda","WhatsApp"," Meta AI","Hassan"];
  var times = ["11 minutes ago","7:17 PM","9:06 PM","8:51 PM","12:51 PM","Yesterday"];
  var avatars = ["men.jpg","men1.jfif","men2.png","whatsapp.png","meta ai.png","men.jpg"];

  _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 70),
      child: ListView(
        children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Status",style: status),
                PopupMenuButton(
                  color:grey,
                  elevation: 8,
                  icon: Icon(Icons.more_vert_rounded,color: Colors.white),
                  onSelected: (value) {
                    // Handle the selected value
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text("Status Privacy",style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(height: 13,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/men2.png"),
                ),
              ),
              SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My status",style: title),
                  Text("5:17 PM",style: subTitle,)
                ],
              )
            ],
          ),
          SizedBox(height: 10,),
        Consumer<UpdateProvider>(
            builder: (context,value,child){
          return   ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              value.showExpanded();
            },
            children: [
              ExpansionPanel(
                  backgroundColor: grey,
                  headerBuilder: (BuildContext context,bool isExpanded){
                    return  Text("View updates",style:subTitle);
                  },
                  body:Container(
                    child: ListView.builder(
                        itemCount: otherStatus.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index){
                          return  Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle
                                  ),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage("assets/images/${avatars[index]}"),
                                  ),
                                ),
                                SizedBox(width: 7),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${otherStatus[index]}",style: title),
                                    Text("${times[index]}",style: subTitle,)
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  isExpanded: value.isExpanded
              )
            ],
          );
        }),
          Divider(color: Colors.grey.shade700),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Channels",style: status),
              PopupMenuButton(
                color:grey,
                elevation: 8,
                icon: Icon(Icons.add,color: Colors.white),
                onSelected: (value) {
                  // Handle the selected value
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text("Setting",style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 300,
            child: Text(
              "Stay updated on topics that matter to you. Find channels to follow below.",
              style: subTitle
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child:ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context,index){
              return Container(
                width: 150,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade700)
                ),
                child: Column(
                  children: [
                        CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage("assets/images/whatsapp.png"),
                          child: Container(
                              alignment: Alignment.bottomRight,
                              child: Image.asset("assets/images/verify.png",width: 30,height: 30,)),
                        ),
                    SizedBox(height: 10,),
                    Text("${text[index]}",style: title,),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade200.withOpacity(.7)
                        ),
                        onPressed: () {},
                        child: Text("Follow",style: title,)
                    )
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(right: 160),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: green
                ),
                onPressed: () {},
                child: Text("Explore more",style: title,)
            ),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }

  _appbar(){
    return Consumer<UpdateProvider>(
        builder: (context,value,child){
      return SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            color: Color(0xff0B141B),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Updates",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.camera,color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        value.showSearchField();
                      },
                      icon: Icon(IconlyLight.search,color: Colors.white,size: 22),
                    ),
                    PopupMenuButton(
                      color:grey,
                      elevation: 8,
                      icon: Icon(Icons.more_vert_rounded,color: Colors.white),
                      onSelected: (value) {
                        // Handle the selected value
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text("Setting",style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
        ),
      );
    });
  }

  searchFieldAppBar() {
    return Consumer<UpdateProvider>(
        builder: (context,value,child){
      return  SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10,bottom: 20),
            color: Color(0xff0B141B),
            child:Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              width: MediaQuery.of(context).size.width-30,
              child: TextFormField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.grey.shade400,
                decoration: InputDecoration(
                  fillColor: Colors.white30,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color:Colors.transparent)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon:IconButton(
                      onPressed: () {
                        value.showSearchField();
                      },
                      icon:Icon(IconlyLight.arrow_left,color: Colors.white,)
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            )
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Transform.rotate(
          angle:1.55,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 130,
              width: 130,
              margin: EdgeInsets.only(bottom: 140,right: 90),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(10),
                    child: FloatingActionButton(
                        onPressed: () {},
                        elevation: 8,
                        backgroundColor: mediumGrey,
                        child: Transform.rotate(
                            angle: 4.7,
                            child: Icon(IconlyBold.edit,color:Colors.white70,))
                    ),
                  ),
                  FloatingActionButton(
                      onPressed: () {},
                      elevation: 8,
                      backgroundColor: green,
                      tooltip: "Camera",
                      child: Transform.rotate(
                          angle:4.7,
                          child: Icon(IconlyBold.camera,color: Colors.grey.shade200,size: 27,))
                  )
                ],
              ),
            ),
          ),
        ),
      backgroundColor: grey,
      body:Stack(
        children: [
          _body(),
          SizedBox(height: 100,),
          Consumer<UpdateProvider>(
              builder: (context,value,child){
                return  value.isSearch ? _appbar() : searchFieldAppBar();
              }),
        ],
      )
    );
  }
}
