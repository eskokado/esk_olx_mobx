import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'screens/base/base_screen.dart';

Future<void> main() async {
  await initializeParse();
  runApp(MyApp());

}

Future<void> initializeParse() async {
  await Parse().initialize(
    'NrFHP85AGpKoHwW79OVVjNCyeTBh7pbnCw2g1Hya',
    'https://parseapi.back4app.com/',
    clientKey: 'rSSKSPpBMehz89gG0CDfUISRgLOm9wJYaMWHKZSD',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
