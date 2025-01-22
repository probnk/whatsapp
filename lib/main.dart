import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/MainPage.dart';
import 'package:whatsapp/Provider/BottomNavBarProvider.dart';
import 'package:whatsapp/Provider/ContactProvider.dart';
import 'package:whatsapp/Provider/HomeProvider.dart';
import 'package:whatsapp/Provider/ImagePickerProvider.dart';
import 'package:whatsapp/Provider/MessageProvider.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';
import 'package:whatsapp/Provider/UpdatesProvider.dart';
import 'package:whatsapp/Provider/userProfileProvider.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:const FirebaseOptions(
          apiKey: "AIzaSyCtVRIW865Co4rEfCvtFsTVN9g5YNGqeJk",
          appId: "1:326369129556:android:471cf92be0c2689f9829c1",
          messagingSenderId: "326369129556",
          projectId: "whatsapp-c0beb",
          storageBucket: "whatsapp-c0beb.appspot.com"
      )
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BottomNavProvider()),
          ChangeNotifierProvider(create: (context) => HomeProvider()),
          ChangeNotifierProvider(create: (context) => UpdateProvider()),
          ChangeNotifierProvider(create: (context) => MessageProvider()),
          ChangeNotifierProvider(create: (context) => SettingProvider()),
          ChangeNotifierProvider(create: (context) => UserProfileProvider()),
          ChangeNotifierProvider(create: (context) => ContactProvider()),
          ChangeNotifierProvider(create: (context) => ImagePickerProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true),
        home: MainPage(),
      ),
    );
  }
}