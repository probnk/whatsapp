import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp/BottomNavBar/BottomNavBar.dart';
import '../../Constants/Colors.dart';
import '../../Constants/fonts.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _smsController = TextEditingController();

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+${_phoneNumberController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification
        await _auth.signInWithCredential(credential);
        // Navigate to home screen or next screen
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => BottomNav()));
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failed
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  textField(
      {required TextEditingController controller,
      required String hintText,
      required String labelText,
      required bool isTrue}) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        autofocus: true,
        cursorColor: green,
        controller: controller,
        decoration: InputDecoration(
            label: Text(labelText, style: smallWhite),
            hintText: hintText,
            hintStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: green, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: lightGrey))),
        style: TextStyle(color: Colors.white, fontSize: 18),
        keyboardType: isTrue ? TextInputType.text : TextInputType.number,
        maxLength: isTrue ? 100 : 6,
      ),
    );
  }

  Future<void> _signInWithPhoneNumber() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: _smsController.text,
      );
      await _auth.signInWithCredential(credential);
      // Navigate to home screen or next screen
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => BottomNav()));
    } catch (e) {
      print(e.toString());
    }
  }

  _userDataBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close, color: textGrey)),
                    Text("Phone Authentication", style: title),
                    Icon(Icons.more_vert_rounded, color: textGrey)
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 55),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text:
                                'WhatsApp will need to verify your phone number. Carrier charges may apply. ',
                            style: smallWhite),
                        TextSpan(text: 'What\'s my number?', style: smallBlue),
                      ])),
                ),
                SizedBox(height: 30),
                textField(
                    isTrue: true,
                    controller: _phoneNumberController,
                    hintText: "Phone Number",
                    labelText: "Enter Phone Number"),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  child: ElevatedButton(
                      onPressed: _verifyPhoneNumber,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: dullGreen, elevation: 8),
                      child: Text(
                        "Verify",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                SizedBox(height: 40),
                Visibility(
                  visible: _verificationId.isNotEmpty,
                  child: Column(
                    children: [
                      textField(
                          isTrue: true,
                          controller: _smsController,
                          hintText: "SMS Code",
                          labelText: "Enter SMS Code"),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 80),
                        child: ElevatedButton(
                            onPressed: _signInWithPhoneNumber,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: dullGreen, elevation: 8),
                            child: Text(
                              "Create Account",
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey,
      body: _userDataBody(),
    );
  }
}
