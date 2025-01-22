import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/ReuseWidgets/ColumnRowsStuctures.dart';
import 'package:whatsapp/ReuseWidgets/settingAppbar.dart';

import '../../../Constants/Colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<Map<String, dynamic>> _accountItems = [
    {
      'title': 'Security notifications',
      'icon': Icons.shield_moon_outlined,
    },
    {
      'title': 'Passkeys',
      'icon': Icons.key,
    },
    {
      'title': 'Email address',
      'icon': Icons.mail_outline_rounded,
    },
    {
      'title': 'Two-step verification',
      'icon': Icons.lock_outline_rounded,
    },
    {
      'title': 'Change number',
      'icon': Icons.security_update_good_rounded,
    },
    {
      'title': 'Request account info',
      'icon': Icons.insert_drive_file_outlined,
    },
    {
      'title': 'Add Account',
      'icon': Icons.person_add_alt,
    },
    {
      'title': 'Delete account',
      'icon': IconlyBroken.delete,
    },
  ];

  _accountBody() {
    return ListView(
      children: [
        Divider(color: mediumGrey),
        _accountItemsList()
      ],
    );
  }

  _accountItemsList() {
    return ListView.builder(
      itemCount: _accountItems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return iconTitleList(accountItems: _accountItems,index:index,isTrue: false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userProfileApp(context, "Account"),
      backgroundColor: grey,
      body: _accountBody(),
    );
  }
}