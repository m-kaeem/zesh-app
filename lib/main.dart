import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ZeshApp());
}

class ZeshApp extends StatelessWidget {
  const ZeshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zésh',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Color(0xFFF4F4F4),
      ),
      home: HomeScreen(),
    );
  }
}
