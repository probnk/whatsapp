import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import 'package:whatsapp/Provider/BottomNavBarProvider.dart';
import 'package:whatsapp/Provider/HomeProvider.dart';
import 'package:whatsapp/Provider/UpdatesProvider.dart';
import 'package:whatsapp/screens/Home/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => UpdateProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNav(),
      ),
    );
  }
}
