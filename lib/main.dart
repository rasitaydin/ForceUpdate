import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:forceupdate/alert_widget.dart';
import 'package:package_info/package_info.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Force Update Deneme',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends  State<Home> {
  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  checkVersion() async {

    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    await remoteConfig.fetch(expiration: const Duration(seconds: 10));
    await remoteConfig.activateFetched();

    /// Uygulamanın Güncel Versiyonu. Firebase'den gelen veri
    String ServerVersion = remoteConfig.getString('force_update_current_version');

    /// Yerel Hafızada Tutulan Versiyon Değeri
    String LocalVersion = packageInfo.version;


    Future.delayed(Duration.zero, () {
      if (ServerVersion!= LocalVersion) {
        showDialog(
            context: context,
            builder: (context) => ForceUpdateWidget.ForceUpdateDialog(
                context: context),
            barrierDismissible: false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Force Update Deneme'),
      ),
      body: Center(
        child: Text('çalışıyor...'),
      ),
    );
  }


}
