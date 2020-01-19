import 'package:flutter/material.dart';

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