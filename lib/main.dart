import 'package:flutter/material.dart';
import 'package:geupsik_flutter_alpha/parser.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('오늘 급식'),
        ),
        body: Home()
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('yyyy년 M월 d일 식단표');

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: FutureBuilder(
          future: initiate(DateTime.now()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator()
                );
              default:
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        formatter.format(DateTime.now()),
                        textScaleFactor: 1.5,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, i) {
                            return Text(
                              snapshot.data[i],
                              textScaleFactor: 1.4,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
            }
          }
        ),
      ),
    );
  }
}