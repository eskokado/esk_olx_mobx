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

  // final category = ParseObject('Categories')
  //   ..set('Title', 'Meias')
  //   ..set('Position', 1);

  // final response = await category.save();
  // print(response.success);

  // final  category = ParseObject('Categories')
  //   ..objectId = 'EWfbygumHO'
  //   ..set('Position', 3);

  // final response = await category.save();
  // print(response.success);

  // final  category = ParseObject('Categories')
  //   ..objectId = 'EWfbygumHO';

  // category.delete();

  // final response = await ParseObject('Categories').getObject('fjMJyVblap');
  // if (response.success) {
  //   print(response.result);
  // }

  // final response = await ParseObject('Categories').getAll();
  // if (response.success) {
  //   for (final object in response.result) {
  //     print(object);
  //   }
  // }

  // final query = QueryBuilder(ParseObject('Categories'));

  // query.whereEqualTo('Position', 2);

  // final response = await query.query();
  // if (response.success) {
  //   print(response.result);
  // }
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
