import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ReuseWidgets/PopMenu.dart';
import '../Constants/Colors.dart';
import '../Constants/fonts.dart';
import '../Provider/UpdatesProvider.dart';
import '../screens/Setting/Setting.dart';

var text = ["ARY Digital HD","WhatsApp","Meta AI"];
var otherStatus = ["Jhon Doe","Charlie","Amenda","WhatsApp"," Meta AI","Hassan"];
var times = ["11 minutes ago","7:17 PM","9:06 PM","8:51 PM","12:51 PM","Yesterday"];
var avatars = ["men.jpg","men1.jfif","men2.png","whatsapp.png","meta ai.png","men.jpg"];
var option = ["Status privacy"];
var options = ["Setting"];
var _screens = [Setting()];

updateFloatingButton({required final double bottom}) {
  return Container(
    height: 130,
    width: 130,
    margin: EdgeInsets.only(bottom: bottom),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.all(10),
          child: FloatingActionButton(
              onPressed: () {},
              elevation: 8,
              backgroundColor: mediumGrey,
              child: Icon(IconlyBold.edit,color:Colors.white70,)
          ),
        ),
        FloatingActionButton(
            onPressed: () {},
            elevation: 8,
            backgroundColor: green,
            tooltip: "Camera",
            child: Icon(IconlyBold.camera,color: Colors.black87,size: 27,)
        )
      ],
    ),
  );
}

body(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Status",style: status),
            popMenuItems(context: context,option: option,size: option.length,screens: _screens)
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
            popMenuItems(
                context: context,
                option: options,size: options.length,screens: _screens)
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
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                              width: 25,height: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                  margin: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                      ),
                                  ),
                                  Icon(Icons.verified_rounded,color:green,size: 25,)
                                ],
                              )
                          ),
                        ),
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
