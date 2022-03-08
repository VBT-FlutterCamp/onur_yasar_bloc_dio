import 'package:flutter/material.dart';

import 'golden_girls/home/view/golden_girls_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.black,
      ),
      home: const GoldenGirls(),
    );
  }
}
