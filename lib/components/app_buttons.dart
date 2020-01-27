import 'package:flutter/material.dart';
import 'package:rwazi/config/constants.dart';

//AvatarButton with onPress functionality
class AvatarButton extends StatelessWidget {
  final Function onPressed;

  AvatarButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        backgroundImage: NetworkImage(
            'https://res.cloudinary.com/spiredigitalassert/image/upload/v1561626069/NEWS/rings/TRIO_BLUE_SWA_R_S7_03089_RS_1_025_1.6_G_Light_Sapphire_Crysta.jpg'),
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 20.0,
        height: 20.0,
      ),
    );
  }
}



class AppRaisedButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String label;
  final Function onPressed;
  AppRaisedButton({this.backgroundColor = kaccentColor,this.textColor = Colors.white, this.onPressed=null,this.label});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
          borderRadius:
          new BorderRadius.circular(6.0)),
      color: backgroundColor,
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}