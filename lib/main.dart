import 'package:flutter/material.dart';
import 'package:fulltime_force/src/pages/home.page.dart';
import 'package:fulltime_force/src/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Time Force',
      routes: getApplicationRoutes(),
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
