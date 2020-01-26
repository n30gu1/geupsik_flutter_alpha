import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy년 M월 d일');
    return Container(
      width: double.infinity,
      height: 100 + MediaQuery.of(context).padding.top,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40)
        )
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Text(
              '급식',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
            GestureDetector(
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
                        color: Colors.white
                      ),
                    ),
                    Text(
                      ' ▾',
                      textScaleFactor: 2,
                      style: TextStyle(
                        color: Color.fromRGBO(230, 230, 230, 1)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}