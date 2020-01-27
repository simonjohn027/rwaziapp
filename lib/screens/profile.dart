import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwazi/components/app_bar.dart';
import 'package:rwazi/components/text_widgets.dart';
import 'package:rwazi/components/app_buttons.dart';
import 'package:rwazi/config/constants.dart';

class ProfilePage extends StatefulWidget {
  static const String ID = 'profilepage';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = "App Developer";

  String _selectedGender;

  double _height, _width, _topPadding, _avatorRadius;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _topPadding = MediaQuery.of(context).size.height;
    _avatorRadius = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBarStyle(),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: _topPadding * 0.00005,
                ),
                child: Card(
                  color: Color(0xFF100F0F),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: SizedBox(
                    height: _height * 0.8,
                    width: _width * 0.9,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Welcome $username",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 4.0),
                                    constraints:
                                        BoxConstraints.tightFor(width: 8.0),
                                    child: InkWell(
                                      radius: 8.0,
                                      onTap: () {},
                                      child: Text(
                                        'This is the future',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 4.0),
                                    constraints:
                                        BoxConstraints.tightFor(width: 8.0),
                                    child: InkWell(
                                      radius: 8.0,
                                      child: Theme(
                                        data: Theme.of(context).copyWith(
                                          canvasColor: kaccentColor,
                                        ),
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            'Select Gender',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          isExpanded: true,
                                          value: _selectedGender,
                                          elevation: 16,
                                          focusColor: Colors.white,
                                          style:
                                              TextStyle(color: Colors.deepPurple),
                                          underline: Container(
                                            height: 2,
                                            color: Colors.white,
                                          ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              _selectedGender = newValue;
                                            });
                                          },
                                          items: <String>[
                                            'Male',
                                            'Female',
                                            'Others',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                              TextField(
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                decoration: kSignInInputDecoration.copyWith(
                                    hintText: 'Phone Number'),
                              ),
                              RowTextInputTwo(
                                hinttext1: 'Region',
                                hinttext2: 'Country',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF55589d),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          constraints: BoxConstraints.tightFor(
                            width: _width * 0.85,
                            height: _height * 0.38,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'How you want to be paid',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.5,
                                    color: Colors.white),
                              ),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    AppRaisedButton(
                                      label: "Start Working",
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    void getDates() {}
  }
}

class RowTextInputTwo extends StatelessWidget {
  final String hinttext1, hinttext2;

  RowTextInputTwo({this.hinttext1, this.hinttext2});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          padding: EdgeInsets.only(right: 4.0),
          constraints: BoxConstraints.tightFor(width: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            decoration: kSignInInputDecoration.copyWith(hintText: hinttext1),
          ),
        ),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 4.0),
          constraints: BoxConstraints.tightFor(width: 8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            decoration: kSignInInputDecoration.copyWith(hintText: hinttext2),
          ),
        ),
      ),
    ]);
  }
}

