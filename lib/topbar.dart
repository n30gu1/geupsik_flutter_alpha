import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dateprovider.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  Future<Null> _selectDate(BuildContext context) async {
    var p = Provider.of<DateSelector>(context, listen: false);
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: p.selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != p.selectedDate)
      p.setDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DateSelector>(context);
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
                _selectDate(context);
              },
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      formatter.format(p.selectedDate),
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