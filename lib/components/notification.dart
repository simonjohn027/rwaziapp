import 'package:flutter/material.dart';



class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(icon: Icon(Icons.notifications_active), onPressed: () {},),
        Positioned(
          right: 10,
          bottom: 15,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}