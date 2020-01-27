import 'package:flutter/material.dart';
import 'package:rwazi/components/text_widgets.dart';
import 'package:rwazi/components/app_buttons.dart';
import 'package:rwazi/config/constants.dart';

class VerifyPage extends StatelessWidget {
  static const String ID = 'verify_page';

  double _height, _width, _topPadding, _avatorRadius;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _topPadding = MediaQuery.of(context).size.height;
    _avatorRadius = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: _topPadding * 0.11,
            ),
            child: Card(
              color: Color(0xFF100F0F),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: SizedBox(
                height: _height * 0.71,
                width: _width * 0.85,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        constraints: BoxConstraints.tightFor(
                          width: _avatorRadius * 0.17,
                          height: _avatorRadius * 0.17,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(
                              'https://res.cloudinary.com/spiredigitalassert/image/upload/v1561626069/NEWS/rings/TRIO_BLUE_SWA_R_S7_03089_RS_1_025_1.6_G_Light_Sapphire_Crysta.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.phone,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            decoration: kSignInInputDecoration.copyWith(
                                hintText: 'Enter Phone Number'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                AppRaisedButton(
                                  label: "Verify",
                                  onPressed: () {},
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                            child: RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: 'You will receieve ', ),
                                  TextSpan(text: 'One Time Password ',style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'Click Verify to Continue')
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
