import 'package:flutter/material.dart';
import 'package:geupsik_flutter_alpha/parser.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy년 M월 d일');
    return SafeArea(
      top: false,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 100 + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40)
              )
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        print('tapped');
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              formatter.format(DateTime.now()),
                              textScaleFactor: 1.8,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              ' ▾',
                              textScaleFactor: 2,
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}