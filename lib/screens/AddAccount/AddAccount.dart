import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/Languages.dart';
import 'package:whatsapp/screens/AddAccount/UserDetails.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {

  _addAccountBody() {
    return Expanded(
        child:Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 130,
                      backgroundImage: AssetImage("assets/images/pic3.jfif"),
                    ),
                    SizedBox(height: 40),
                    Text("Add an account",style: status),
                    SizedBox(height: 10),
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width - 110
                      ),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Read our ',
                            style: smallGrey
                          ),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: smallBlue
                          ),
                          TextSpan(
                              text: '. Tap \"Agree and continue\" to accept the ',
                              style: smallGrey
                          ),
                          TextSpan(
                              text: 'Terms of Service',
                              style: smallBlue
                          ),
                          TextSpan(
                              text: '.',
                              style: smallGrey
                          )
                        ]
                      )),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        bottomSheet(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * .4,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: dullGreen.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.public_rounded,color: dullGreen),
                            Text("English",style: GoogleFonts.raleway(color:dullGreen.withOpacity(.9),),),
                            Icon(Icons.keyboard_arrow_down_rounded,color: dullGreen)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)  => UserDetails()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: dullGreen,
                      elevation: 8
                    ),
                    child: Text("Agree and continue",style: TextStyle(color: Colors.black),)),
              ),
            ],
          ),
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      appBar: AppBar(
        backgroundColor: grey,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back,color: textGrey)
        ),
        actions: [
          Icon(Icons.more_vert_rounded,color: textGrey)
        ],
      ),
      body: _addAccountBody(),
    );
  }
}
