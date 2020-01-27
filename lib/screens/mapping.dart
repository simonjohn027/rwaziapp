import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwazi/components/notification.dart';
import 'package:rwazi/components/app_buttons.dart';
import 'package:rwazi/main.dart';

class Mapping extends StatelessWidget {
  static const String id = 'mapping';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEBD426),
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        leading: AvatarButton(),
        title: Text(
          "Rwazi",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          //TODO Change this widget to return the List only
          Notification(),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 18.0, left: 12.0, right: 12.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF1b1b33)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.shop),
                        hintText: "Enter Shop Name",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0,
                              style: BorderStyle.solid),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      textBaseline: TextBaseline.ideographic,
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: "Click to Get Location",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1.0,
                                  style: BorderStyle.solid),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        )),
                        RaisedButton(
                          shape: CircleBorder(),
                          elevation: 8.0,
                          color: Colors.red,
                          onPressed: () {},
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text("Company Name",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Text("Product Name",
                          style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),),
                      ),
                     Container(
                       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           TextField(
                             decoration: InputDecoration(
                               hintText: "Click to Get Location",
                               hintStyle: TextStyle(
                                 color: Colors.blue,
                               ),
                               border: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Color(0xFF1b1b33),
                                     width: 1.0,
                                     style: BorderStyle.solid),
                               ),
                             ),
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Colors.white,
                             ),
                           ),
                           TextField(
                             decoration: InputDecoration(
                               hintText: "Click to Get Location",
                               hintStyle: TextStyle(
                                 color: Color(0xFF1b1b33),
                               ),
                               border: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Colors.white,
                                     width: 1.0,
                                     style: BorderStyle.solid),
                               ),
                             ),
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Color(0xFF1b1b33),
                             ),
                           ),
                           TextField(
                             decoration: InputDecoration(
                               hintText: "Click to Get Location",
                               hintStyle: TextStyle(
                                 color: Color(0xFF1b1b33),
                               ),
                               border: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Color(0xFF1b1b33),
                                     width: 1.0,
                                     style: BorderStyle.solid),
                               ),
                             ),
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Color(0xFF1b1b33),
                             ),
                           ),
                           TextField(
                             decoration: InputDecoration(
                               hintText: "Click to Get Location",
                               hintStyle: TextStyle(
                                 color: Color(0xFF1b1b33),
                               ),
                               border: UnderlineInputBorder(
                                 borderSide: BorderSide(
                                     color: Color(0xFF1b1b33),
                                     width: 1.0,
                                     style: BorderStyle.solid),
                               ),
                             ),
                             style: TextStyle(
                               fontSize: 20.0,
                               color: Color(0xFF1b1b33),
                             ),
                           ),

                         ],
                       ),
                     ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: (){},
                            color: Color(0xFF1b1b33),
                          ),
                          RaisedButton(
                            onPressed: (){},
                            color: Color(0xFF1b1b33),
                          ),

                        ],
                      )
                    ],
                  ),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications_active),
          onPressed: () {},
        ),
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
