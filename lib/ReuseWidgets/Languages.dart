import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Constants/Colors.dart';
import '../Constants/fonts.dart';
import '../Provider/Setting Provider.dart';

var _languages = [
  {'title': '(device language)', 'subtitle': 'English', 'value': 'en_US'},
  {'title': 'اردو', 'subtitle': 'Urdu', 'value': 'ur_PK'},
  {'title': 'الإسبانية', 'subtitle': 'Spanish', 'value': 'es_ES'},
  {'title': '普通话', 'subtitle': 'Mandarin', 'value': 'zh_CN'},
  {'title': 'العربية', 'subtitle': 'Arabic', 'value': 'ar_EG'},
  {'title': 'हिन्दी', 'subtitle': 'Hindi', 'value': 'hi_IN'},
  {'title': 'বাংলা', 'subtitle': 'Bengali', 'value': 'bn_BD'},
  {'title': 'Português', 'subtitle': 'Portuguese', 'value': 'pt_PT'},
  {'title': 'Русский', 'subtitle': 'Russian', 'value': 'ru_RU'},
  {'title': '日本語', 'subtitle': 'Japanese', 'value': 'ja_JP'},
];

bottomSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery
            .of(context)
            .size
            .height * .5,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.close_rounded,color: textGrey)
                ),
                Text('Select Language', style: status),
              ],
            ),
            Divider(color: mediumGrey),
            Consumer<SettingProvider>(builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: _languages.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _languages[index]['subtitle'].toString(),
                        style: title,
                      ),
                      subtitle: Text(
                        _languages[index]['title'].toString(),
                        style: subTitle,
                      ),
                      leading: Radio<int>(
                        activeColor: green,
                        value: index,
                        groupValue: value.selectedLanguage,
                        onChanged: (newValue) {
                          value.toggleSelectedLanguage(newValue!);
                        },
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      );
    },
  );
}
