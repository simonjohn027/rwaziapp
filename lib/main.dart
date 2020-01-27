import 'package:flutter/material.dart';
import 'package:rwazi/screens/home.dart';
import 'package:rwazi/screens/profile.dart';
import 'package:rwazi/screens/signup_screen.dart';
import 'package:rwazi/screens/verify.dart';
import 'screens/mapping.dart';
import 'screens/auth_interface.dart';

void main() => runApp(Rwazi());



class Rwazi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rwazi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,


      ),
      home: HomePage(),
      routes: {
        Mapping.id: (context) => Mapping(),
      },
    );
  }
}
