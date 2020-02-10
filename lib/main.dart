import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geupsik_flutter_alpha/modules/animatedbutton.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'dateprovider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DateSelector(),)
      ],
      child: Consumer<DateSelector>(
        builder: (context, date, _) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: "SFDisplay"
            ),
            darkTheme: ThemeData.dark(),
            home: Scaffold(
              body: Home(),
              floatingActionButton: AnimatedButton(),
            ),
          );
        },
      ),
    );
  }
}