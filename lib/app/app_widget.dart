import 'package:flutter/material.dart';
import 'package:getx_pratica/app/pages/home/home_page.dart';
import 'package:getx_pratica/teste_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      home: const TestePage(),
    );
  }
}
