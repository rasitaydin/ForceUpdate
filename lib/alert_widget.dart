

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceUpdateWidget {
  static Widget ForceUpdateDialog({BuildContext context}) {
    return AlertDialog(
      content: Text("Bu uygulamanın yeni bir sürümü mevcut. Güncellemeyi yapmamanız halinde uygulama açılmayacaktır",
          style: TextStyle(
              color: Colors.black, fontFamily: 'OpenSans')),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            launch('https://play.google.com/store/apps/details?id=com.whatsapp');
          },
          color: Colors.green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Güncelle'),
        ),
        FlatButton(
          onPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          color: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          textColor: Colors.white,
          child: Text('Çık'),
        )
      ],
    );
  }


}
