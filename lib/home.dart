import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geupsik_flutter_alpha/topbar.dart';
import 'mealview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            title: Text('급식'),
          ),
          expandedHeight: 130,
        ),
        MealView()
      ],
    );
  }
}