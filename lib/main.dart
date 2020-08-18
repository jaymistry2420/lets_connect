import 'package:flutter/material.dart';
import 'package:lets_connect/config/palette.dart';
import 'package:lets_connect/screens/screens.dart';

void main() {
  runApp(ConnectApp());
}

class ConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets Connect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,

      ),
      home: NavigationScreen(),
    );
  }
}