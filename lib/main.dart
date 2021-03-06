import 'package:amirTest/Core/Routes/routes.dart';
import 'package:amirTest/Core/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amirTest/injection_container.dart' as sl;

void main() {
  sl.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'amirTest',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: AppColors.primaryColor,
      ),
      initialRoute: '/homeProvider',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
