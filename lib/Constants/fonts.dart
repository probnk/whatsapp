import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Provider/BottomNavBarProvider.dart';

final status = GoogleFonts.nunito(
    color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400);

final menuBar = GoogleFonts.inconsolata(
    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);

final title = GoogleFonts.raleway(
    color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17);

final subTitle = GoogleFonts.roboto(color: Colors.grey.shade400, fontSize: 15);

final smallGrey = GoogleFonts.abel(color: Colors.grey.shade400, fontSize: 13);

final messageText = GoogleFonts.openSans(
    fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400);

final smallWhite = GoogleFonts.abel(color: Colors.white, fontSize: 13);

final smallGreen = GoogleFonts.abel(color: Color(0xff21C063), fontSize: 13);

final smallBlue = GoogleFonts.abel(color: Color(0xff61B9D9), fontSize: 13);

final boldWhiteNavBar = GoogleFonts.raleway(
    color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);

final boldGreyNavBar = GoogleFonts.raleway(
    color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold);
