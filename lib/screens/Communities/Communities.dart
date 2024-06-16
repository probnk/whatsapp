import 'package:flutter/material.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Communities Screen",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
