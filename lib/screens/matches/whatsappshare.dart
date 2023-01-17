
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
enum Share {
  whatsapp,
  share_instagram,
  share_telegram
}
class WhatsappShare extends StatefulWidget {
  const WhatsappShare({Key? key, required this.refferelwhatsapp}) : super(key: key);
final String refferelwhatsapp;
  @override
  State<WhatsappShare> createState() => _WhatsappShareState();
}

class _WhatsappShareState extends State<WhatsappShare> {
    File? file;
  bool videoEnable = false;
  @override
  Widget build(BuildContext context) {
        return  Container(
          width: double.infinity,
          child: Row(
            children: <Widget>[
              const SizedBox(height: 30),
              IconButton(
                onPressed: () => onButtonTap(Share.whatsapp),
                  icon: Icon(Icons.whatsapp,color: Colors.green,),
              ),
              IconButton(
                onPressed: () => onButtonTap(Share.share_telegram),
                icon: Icon(Icons.telegram,color: Colors.blue,),
              ),
            ],
          ),


    );
  }
  Future<void> onButtonTap(Share share) async {
    String msg =
        " YOUR REFFEREL FOR BOOK THE SLOT ${widget.refferelwhatsapp}";

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case Share.whatsapp:
        if (file != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: file!.path,
              fileType: videoEnable ? FileType.video : FileType.image);
        } else {
          response = await flutterShareMe.shareToWhatsApp(msg: msg);
        }
        break;

      case Share.share_telegram:
        response = await flutterShareMe.shareToTelegram(msg: msg);
        break;
    }
    debugPrint(response);
  }
}
