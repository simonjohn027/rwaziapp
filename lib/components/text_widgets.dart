import 'package:flutter/material.dart';


class DividerTexted extends StatelessWidget {
  final String label;
  DividerTexted({this.label='or'});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child:  Container(
              margin:  EdgeInsets.only(
                  left: 20.0, right: 20.0),
              child: Divider(
                color: Colors.white,
              )),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        Expanded(
          child:  Container(
              margin:  EdgeInsets.only(
                  left: 20.0, right: 20.0),
              child: Divider(
                color: Colors.white,
              )),
        ),
      ],
    );
  }
}
