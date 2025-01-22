import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/PopMenu.dart';
import 'package:whatsapp/screens/CommunitiesGroups/CommunitiesGroups.dart';
import '../../Constants/Colors.dart';
import '../Setting/Setting.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {

  var option = ["Setting"];
  var _screens = [Setting()];


  appbar(){
    return AppBar(
      backgroundColor: grey,
      leadingWidth: MediaQuery.of(context).size.width,
      leading:  Container(
          padding: EdgeInsets.only(left: 10,right: 8),
          color: grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Communities",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconlyLight.camera,color: Colors.white),
                  ),
                  popMenuItems(context: context,size: option.length,option: option,screens: _screens)
                ],
              )
            ],
          )
      ),
    );
  }

  communitiesList(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.all(10),
          color: grey,
          child:   Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    margin: EdgeInsets.only(right: 8,bottom: 8),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.groups_rounded,color: Colors.white,size: 30,),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding:EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)
                      ),
                      child: Center(child: Icon((Icons.add),size: 18,),),
                    ),
                  )
                ],
              ),
              SizedBox(width: 10,),
              Text("New community",style: title,)
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context,index){
            return  Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                color: grey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("assets/images/air.png",width: 30,height: 30,),
                        ),
                        SizedBox(width: 10,),
                        Text("BSCS|AU A&AC",style: title)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Divider(color: Colors.grey.shade600,),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  margin: EdgeInsets.only(bottom: 10,right: 3),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: green.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.speaker_phone_rounded,color: Colors.green.shade50,size: 33,),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                      padding:EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.circle
                                      ),
                                      child: Icon(Icons.av_timer_outlined,color: Colors.grey.shade400,size: 24,)),
                                )
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Announcements",style: title),

                                  ],
                                ),
                                Container(
                                    width:MediaQuery.of(context).size.width-150,
                                    child: Text("Sir:Sir Imran will show the...",style: subTitle))
                              ],
                            ),
                          ],
                        ),
                        Text("6/17/24",style: subTitle)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset("assets/images/air.png"),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("BSCS-F22",style: title),

                                  ],
                                ),
                                Container(
                                    width:MediaQuery.of(context).size.width-160,
                                    child: Text("Sir:Dear All AoA Reference is made to...",style: subTitle))
                              ],
                            ),
                          ],
                        ),
                        Text("6/15/24",style: subTitle)
                      ],
                    ),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CommunitiesGroups()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              color: Colors.transparent,
                              child: Icon(IconlyLight.arrow_right_2,color: Colors.white60,)),
                          SizedBox(width: 30,),
                          Text("View all",style: subTitle,)
                        ],
                      ),
                    )
                  ],
                )
            );
          },
        ),
        SizedBox(height: 200,)
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appbar(),
      body: communitiesList(context),
    );
  }
}