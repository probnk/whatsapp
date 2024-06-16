import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/BottomNavBar/CustomClipPath.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/BottomNavBarProvider.dart';
import 'package:whatsapp/screens/Call/Call.dart';
import 'package:whatsapp/screens/Communities/Communities.dart';
import 'package:whatsapp/screens/Home/Home.dart';
import 'package:whatsapp/screens/Updates/Updates.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var icons = [Icons.message,Icons.tips_and_updates_rounded,Icons.groups_rounded,Icons.call];
  var texts = ["Chats","Updates","Communities","Calls"];
  List screens = [Home(),Updates(),Communities(),Call()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomNavProvider>(
          builder: (context,value,child){
        return Stack(
          children: [
            screens[value.selectedIndex],
            Positioned(
              bottom: 0,
              right: 8,
              left: 8,
              child: Container(
                  margin: EdgeInsets.only(left: 10,right:10,bottom: 20),
                  padding: EdgeInsets.all(8),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child:ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                          child: GestureDetector(
                            onTap: () {
                                value.changeScreen(index);
                            },
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 40,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: value.selectedIndex == index ? green : Colors.transparent,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Icon(icons[index],color: value.selectedIndex == index ? Colors.white : Colors.grey,),
                                SizedBox(height: 3),
                                Text("${texts[index]}",style: value.selectedIndex == index ? boldWhiteNavBar : boldGreyNavBar)
                              ],
                            ),
                          ),
                        );
                      }
                  )
                ),
            ),
          ],
        );
        }
      ),
    );
  }
}