import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screens/exchange_page.dart';
import './screens/reorder_list_item.dart';
import './screens/grows_page.dart';
import './widgets/DrawerCode.dart';
import './screens/currency_page.dart';
import './widgets/image_carousel.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  color: Colors.amber,
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      title: 'Currency App',
      home: HomePage(),
      routes: {
        ExchangePage.routeName: (ctx) => ExchangePage(),
        GrowsPage.routeName: (ctx) => GrowsPage(),
        CurrencyPage.routeName: (ctx) => CurrencyPage(),
        ReorderListItemScreen.routeName: (ctx) => ReorderListItemScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.amber),
        title: const Text('Currency App'),
      ),
      body: ImageCarousel(),
      drawer: DrawerCode(),
    );
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
