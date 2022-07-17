import 'package:flutter/material.dart';

import '../consts/theme_data.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isDark = true;
    return MaterialApp(
      title: 'Grocery',
      theme: Styles.getTheme(_isDark, context),
      home: const Scaffold(
        body: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
