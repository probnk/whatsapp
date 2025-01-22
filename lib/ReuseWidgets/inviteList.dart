import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

final List<Map<String, String>> contacts = [
  {'name': 'Ahmed Hassan', 'phone': '+1 123 456 7890'},
  {'name': 'Sara Ali', 'phone': '+44 234 567 8901'},
  {'name': 'Mike Johnson', 'phone': '+61 345 678 9012'},
  {'name': 'Emma Wilson', 'phone': '+1 456 789 0123'},
  {'name': 'Alex Lee', 'phone': '+86 567 890 1234'},
  {'name': 'James Kim', 'phone': '+82 678 901 2345'},
  {'name': 'Sophia Chen', 'phone': '+886 789 012 3456'},
  {'name': 'Daniel Park', 'phone': '+49 890 123 4567'},
  {'name': 'Olivia Brown', 'phone': '+1 234 567 8901'},
  {'name': 'William Davis', 'phone': '+64 345 678 9012'},
  {'name': 'Ava Thompson', 'phone': '+44 456 789 0123'},
  {'name': 'Ethan Johnson', 'phone': '+1 567 890 1234'},
  {'name': 'Isabella Lee', 'phone': '+86 678 901 2345'},
  {'name': 'Mia Kim', 'phone': '+82 789 012 3456'},
  {'name': 'Liam Chen', 'phone': '+886 890 123 4567'},
  {'name': 'Noah Park', 'phone': '+49 901 234 5678'},
];

inviteList(){
  return ListView.builder(
      itemCount: 16,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,width: 50,
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey
                    ),
                    child: Icon(Icons.person,color: Colors.grey.shade200,size: 30),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contacts[index]['name'].toString(),style: title),
                      Text("${contacts[index]['phone']}",style: subTitle)
                    ],
                  )
                ],
              ),
              TextButton(
                  onPressed: () {}, child: Text("Invite",style: GoogleFonts.raleway(
                  color:green,
                  fontWeight:FontWeight.w500,
                  fontSize:18
              ),))
            ],
          ),
        );
      });
}