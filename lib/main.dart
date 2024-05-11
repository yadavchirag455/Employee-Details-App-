import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chirag',
        theme:
            ThemeData(appBarTheme: AppBarTheme(color: Colors.deepPurple[300])),
        home: HomePage());
  }
}
