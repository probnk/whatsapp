import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:whatsapp/Constants/Colors.dart';
import 'package:whatsapp/Constants/fonts.dart';
import 'package:whatsapp/Provider/Setting%20Provider.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _currentUser = FirebaseAuth.instance.currentUser!.phoneNumber;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  _qrCodeAppbar() {
    return AppBar(
      backgroundColor: grey,
      leadingWidth: MediaQuery.of(context).size.width * .5,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          Text("QR Code", style: status),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_rounded, color: Colors.white,),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded, color: Colors.white,),
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        indicatorColor: green,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            child: Text("My code", style: _tabController.index == 0 ? title : subTitle),
          ),
          Tab(
            child: Text("Scan code", style: _tabController.index == 1 ? title : subTitle),
          ),
        ],
      ),
    );
  }

  MyCode(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
                  child: Consumer<SettingProvider>(
                      builder: (context,value,child){
                    return Column(
                      children: [
                        Text(value.qrCodeData,style: title),
                        Text("WhatsApp contact",style: smallGrey,),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: QrImageView(
                            data: _currentUser!,
                            version: QrVersions.auto,
                            size: 180,
                          ),
                        )
                      ],
                    );
                  })
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 100,
          ),
          child: Text(
            "Your QR code is private. If you share it with someone, they can scan it with their WhatsApp camera to add you as a contact",
            style: subTitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  ScanCode() {
    return Stack(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width  - 100,
            child: Consumer<SettingProvider>(
                builder: (context,value,child){
              return MobileScanner(
                onDetect: (capture) {
                  final barcode = capture.barcodes;
                  var code = barcode[0].rawValue ?? "No Data found in QR";
                  value.getQRCodeData(code);
                  _tabController.animateTo(0);
                },
              );
            })
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _qrCodeAppbar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyCode(),
          ScanCode()
        ],
      ),
    );
  }
}