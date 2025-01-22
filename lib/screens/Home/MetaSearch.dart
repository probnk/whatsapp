import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/ReuseWidgets/HomeWidget.dart';

class MetaSearch extends StatefulWidget {
  const MetaSearch({super.key});

  @override
  State<MetaSearch> createState() => _MetaSearchState();
}

class _MetaSearchState extends State<MetaSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    profileLoader(context);
  }

  metaAppbar() {
    return AppBar(
      backgroundColor: Colors.grey.shade900,
      toolbarHeight: MediaQuery.of(context).size.height*.11,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 8,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              width: MediaQuery.of(context).size.width-30,
              height: 56,
              padding: EdgeInsets.symmetric(vertical: 1,horizontal: 0),
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
                      },
                      icon: Icon(IconlyLight.arrow_left, color: Colors.grey.shade400),
                    ),
                  ),
                  Container(
                    height: 46,
                    width: MediaQuery.of(context).size.width-100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Lottie.asset("assets/images/meta.json", width: 20, height: 20),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: TextFormField(
                              controller: _searchController,
                              autofocus: true,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.grey.shade400,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(color: Colors.transparent)
                                ),
                                fillColor: Colors.transparent,
                                filled: true,
                                hintText: "Ask Meta AI or Search",
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 8,
                          color: green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            height: 30,
                            width: 30,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Center(
                              child: Icon(IconlyBold.send,size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: metaAppbar(),
      body: ListView(
        shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            itemsList(),
            SizedBox(height: 10,),
            GestureDetector(
            onVerticalDragDown: (value) {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav()));
              },
            child:listTile(context),
            ),
            SizedBox(height: 20),
            encryptedmessage()
          ],
      ),
    );
  }
}