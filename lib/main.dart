import 'package:avio/avio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pokedex/app/constants/color_schemes.g.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Avio.init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Pokedex",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      builder: (context, child) => AvioWrapper(
          loader: const Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CupertinoActivityIndicator(),
            ),
          ),
          child: child!),
    );
  }
}
