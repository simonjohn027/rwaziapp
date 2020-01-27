import 'package:flutter/material.dart';

const Color kaccentColor = Color(0xFFE91533);
const Color kprimaryBlack = Color(0xFF100F0F);
const Color kaccentCanvasColor = Color(0xFF55589d);

const InputDecoration kSignInInputDecoration = InputDecoration(
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
        color: kaccentColor, width: 1.0),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide:
    BorderSide(color: Colors.white, width: 1.0),
  ),
  hintText: '',
  hintStyle: TextStyle(color: Colors.white,
      fontSize: 15.0
  ),
);