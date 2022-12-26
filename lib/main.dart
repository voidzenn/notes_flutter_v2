import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_flutter_v2/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.getHomeRoute(),
      getPages: Routes.routes,
    );
  }
}