import 'package:flutter/material.dart';
import 'package:geupsik_flutter_alpha/topbar.dart';
import 'mealview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBar(),
        Spacer(),
        MealView()
      ],
    );
  }
}