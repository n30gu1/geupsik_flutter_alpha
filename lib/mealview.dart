import 'package:flutter/material.dart';
import 'parser.dart';

class MealView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EdgeInsets padding = MediaQuery.of(context).padding;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: (size.height) - (110 + padding.top),
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40)
        )
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 17, top: 25, bottom: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: getMeals(DateTime.now(), 'meals'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Spacer(),
            FutureBuilder(
              future: getMeals(DateTime.now(), 'kcal'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        snapshot.data,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          'kcal',
                          textScaleFactor: 1.15,
                        ),
                      )
                    ],
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              height: padding.bottom,
            )
          ],
        ),
      )
    );
  }
}