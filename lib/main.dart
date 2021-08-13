import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

Future<void> main() async {
  runApp(MyApp());

  await Parse().initialize(
    'NrFHP85AGpKoHwW79OVVjNCyeTBh7pbnCw2g1Hya',
    'https://parseapi.back4app.com/',
    clientKey: 'rSSKSPpBMehz89gG0CDfUISRgLOm9wJYaMWHKZSD',
    autoSendSessionId: true,
    debug: true,
  );

  final category = ParseObject('Categories')
    ..set('Title', 'Camisetas')
    ..set('Position', 2);

  final response = await category.save();
  print(response.success);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
