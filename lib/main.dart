import 'package:flutter/material.dart';
import 'package:femi_app/app/interface/interface.dart';
import 'package:flutter_super/flutter_super.dart';

void main() {
  runApp(
    const SuperApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
