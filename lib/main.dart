import 'package:ecogo_mobile_app/router.dart';
import 'package:flutter/material.dart';

void main() {
  AppRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Ubuntu'),
      initialRoute: "/",
      onGenerateRoute: AppRouter.router.generator,
    );
  }
}
