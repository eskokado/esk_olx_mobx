import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'repositories/cep_repository.dart';
import 'repositories/ibge_repository.dart';
import 'screens/base/base_screen.dart';
import 'stores/category_store.dart';
import 'stores/home_store.dart';
import 'stores/page_store.dart';
import 'stores/user_manager_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());

  CepRepository().getAddressFromApi('055.77-200').then((value) => print(value));
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        cursorColor: Colors.orange,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BaseScreen(),
    );
  }
}
