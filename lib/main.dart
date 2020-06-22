import 'package:flutter/material.dart';
import 'package:native_updater/native_updater.dart';

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

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkVersion();
  }

  Future<void> checkVersion() async {

    /// Yerel depolamada tutulan versiyon
    int localVersion = 9;

    /// Güncellenecek Versiyon
    int serverLatestVersion = 10;

    Future.delayed(Duration.zero, () {
      if (serverLatestVersion > localVersion) {
        NativeUpdater.displayUpdateAlert(
          context,
          forceUpdate: true,
          playStoreUrl: 'https://play.google.com/store/apps/details?id=com.champion.profileanalyzer&gl=TR',
        );
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