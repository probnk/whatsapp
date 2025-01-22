import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';
import 'package:whatsapp/ReuseWidgets/SwitchButton.dart';

import '../../../Constants/Colors.dart';

class AppUpdates extends StatefulWidget {
  const AppUpdates({super.key});

  @override
  State<AppUpdates> createState() => _AppUpdatesState();
}

class _AppUpdatesState extends State<AppUpdates> {
  _appUpdatesAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black)),
      centerTitle: true,
      title: Text("App update settings",
          style: GoogleFonts.nunito(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 22)),
    );
  }

  _appUpdatesBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: textGrey),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsRow(
                  isDark: false,
                  newTitle: "Auto-update WhatsApp",
                  newSubTitle: "Automatically update app over Wi-Fi",
                  providerValue: context.watch<SettingProvider>().AutoUpdateWhatsApp,
                  onChanged: (newValue) {
                    context.read<SettingProvider>().allowAutoUpdateWhatsApp(newValue);
                  }),
              SettingsRow(
                  isDark: false,
                  newTitle: "Update WhatsApp over cellular",
                  newSubTitle: "Automatically update app over Cellular",
                  providerValue: context.watch<SettingProvider>().UpdateOverCellular,
                  onChanged: (newValue) {
                    context.read<SettingProvider>().allowUpdateOverCellular(newValue);
                  }),
              SizedBox(height: 20,),
              Text("Notification",style: GoogleFonts.abel(
                color:Colors.black,
                fontSize:27,
                fontWeight:FontWeight.w600
                ),
              ),
              SettingsRow(
                  isDark: false,
                  newTitle: "WhatsApp update available",
                  newSubTitle: "Get notified when updates are available",
                  providerValue: context.watch<SettingProvider>().getNotifiedByWhatsApp,
                  onChanged: (newValue) {
                    context.read<SettingProvider>().allowGetNotifiedByWhatsApp(newValue);
                  })
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appUpdatesAppbar(),
      body: _appUpdatesBody(),
    );
  }
}
