import 'package:flutter/material.dart';
import 'package:flutter_app/screens/base/base_screen.dart';
import 'package:flutter_app/stores/category_store.dart';
import 'package:flutter_app/stores/page_store.dart';
import 'package:flutter_app/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setUpLocators();
  runApp(MyApp());
}

void setUpLocators(){
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('vz51RcsnmIQtgP4VEmKokNQRDBBIOhNhy0LTXU3a',
      'https://parseapi.back4app.com/',
      clientKey: 'm1jZkjwIpWC5GwaATaHB9UmM4GOJm7UEVmrrCFWV',
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        cursorColor: Colors.orange,
      ),
      home: BaseScreen(),
    );
  }
}