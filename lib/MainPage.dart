import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import 'package:whatsapp/screens/AddAccount/AddAccount.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData){
                  return BottomNav();
                }
                else{
                  return AddAccount();
                }
              }
              return Center(child: CircularProgressIndicator(),);
            }
        )
    );
  }
}
