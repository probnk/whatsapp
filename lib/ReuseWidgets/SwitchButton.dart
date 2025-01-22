import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/Colors.dart';
import '../Constants/fonts.dart';

class SettingsRow extends StatelessWidget {
  final String newTitle;
  final String newSubTitle;
  final bool providerValue;
  final bool isDark;
  final Function(bool) onChanged;

  const SettingsRow({
    Key? key,
    required this.newTitle,
    required this.newSubTitle,
    required this.providerValue,
    required this.onChanged, required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width - 140,
                  ),
                  child: Text(newTitle, style: isDark ? title : GoogleFonts.abel(
                      color:Colors.black,
                      fontSize:22,
                      fontWeight:FontWeight.w600
                  ),)),
              Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 140,
                ),
                child: Text(newSubTitle, style: isDark ? subTitle : GoogleFonts.abel(
                    color:Colors.grey,
                    fontSize:14,
                    fontWeight:FontWeight.w600
                ),),
              ),
            ],
          ),
          Switch(
            activeColor:isDark ? Colors.black : Colors.white,
            activeTrackColor: isDark ? green : Colors.blueAccent,
            inactiveThumbColor:Colors.grey,
            inactiveTrackColor: isDark ? grey : Colors.white,
            value: providerValue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}