import 'package:flutter/material.dart';
import 'package:rwazi/components/app_buttons.dart';
import 'package:rwazi/config/constants.dart';


class AppBarStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            color: kprimaryBlack, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: <Widget>[
            AvatarButton(),
            Text(
              "Rwazi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}