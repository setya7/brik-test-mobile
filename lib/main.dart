import 'package:briktestklontong21/routers/router.dart';
import 'package:briktestklontong21/routers/router_name.dart';
import 'package:flutter/material.dart';

import 'base/service/api.dart';

void main() async {
  runApp(const MyApp());
  await Api.instantiation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: RouterName.splash,
      onGenerateRoute: Pages.generateRoute,
    );
  }
}

