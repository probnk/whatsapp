import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/HomeProvider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var titles = ["Jhon Doe","Study","Boys","Computer Science","Flutter","Zauq-e-khair","WhatsApp","Meta AI"];
  var subTitles = ["Ok","Charlie:Hmm","Muhammad:Mera check kr lo koi","BSCS-F22","~ ~Jhon:Sir Jordy will show papers...","Announcements Ahmed Added th...","New: Add more privacy to your app","Photo Generated"];
  var time = ["2:01 PM","1:57 PM","12:45 PM","12:36 PM","12:12 PM","Yesterday","6/11/24","6/9/24"];
  var avatars = ["men.jpg","study.jfif","men1.jfif","men2.png","cs.jfif","khair.jfif","whatsapp.png","meta ai.png"];
  var messageDetails = ["All","Unread","Groups"];

  Widget _body(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white24
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Lottie.asset("assets/images/meta.json",width: 24,height: 24, repeat: true),
                Container(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.grey.shade400,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color:Colors.transparent)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: "Ask Meta AI or Search",
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        Consumer<HomeProvider>(
            builder: (context,value,index){
          return value.isShow
          ?  Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  height: 30,
                  child: ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                      return  Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                                backgroundColor: value.isIndex == index
                                    ?  green.withOpacity(.4)
                                    : Colors.white24
                            ),
                            onPressed: () {
                              value.selectIndex(index);
                            },
                            child: Text("${messageDetails[index]}",
                              style: TextStyle(
                                color:value.isIndex == index
                                ? green : Colors.grey
                              )
                            )
                        ),
                      );
                  }),
                ),
              ],
            )
          ) : Text("");
        }),
        _listTile(context),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your personal messages are ",style:smallGrey),
            Text("end-to-end encrypted",style:smallGreen)
          ],
        ),
        SizedBox(height: 150,)
      ],
    );
  }

  Widget _listTile(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (context,value,child){
      return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: titles.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onVerticalDragDown: (details) {
                value.showReadButton();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/${avatars[index]}"),
                    ),
                    title:Text("${titles[index]}",style:title),
                    subtitle: Container(
                        width: 200,
                        child: Text("${subTitles[index]}",style:subTitle)),
                    trailing: Text("${time[index]}",style:GoogleFonts.roboto(
                        color: Colors.grey.shade400,
                        fontSize: 13
                    )
                    )
                ),
              ),
            );
          });
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
            height: 120,
            width: 120,
            margin: EdgeInsets.only(bottom: 140,right: 90),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  margin: EdgeInsets.all(10),
                  child: FloatingActionButton(
                      onPressed: () {},
                      elevation: 8,
                      backgroundColor: Color(0xff212C2C),
                      child: Lottie.asset("assets/images/meta.json")
                  ),
                ),
                FloatingActionButton(
                    onPressed: () {},
                    elevation: 8,
                    backgroundColor: green,
                    tooltip: "See Contacts",
                    child: Transform.rotate(
                        angle:4.7,
                        child: Icon(IconlyBold.chat,color: Colors.grey.shade200,size: 27,))
                )
              ],
            ),
          ),
        ),
      ),
        appBar: AppBar(
          backgroundColor: Color(0xff0B141B),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.camera,color: Colors.white),
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
                        child: Text("New group",style: TextStyle(color: Colors.white)),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text("New broadcast",style: TextStyle(color: Colors.white)),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text("Linked devices",style: TextStyle(color: Colors.white)),
                      ),
                      PopupMenuItem(
                        value: 4,
                        child: Text("Starred messages",style: TextStyle(color: Colors.white)),
                      ),
                      PopupMenuItem(
                        value: 5,
                        child: Text("Settings",style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        backgroundColor: grey,
        body: _body(context)
    );
  }
}