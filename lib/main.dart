import 'package:flutter/material.dart';
import 'screens/mapping.dart';

void main() => runApp(Rwazi());



class Rwazi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rwazi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFFEBD426),
      ),
      initialRoute: Mapping.id,
      routes: {
        Mapping.id: (context) => Mapping(),
      },
    );
  }
}
