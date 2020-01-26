import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "SFDisplay"
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Home()
      ),
    );
  }
}

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     DateFormat formatter = DateFormat('yyyy년 M월 d일');

//     return Padding(
//       padding: EdgeInsets.all(5.0),
//       child: Card(
//         child: FutureBuilder(
//           future: initiate(DateTime.now()),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done)
//             return Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       formatter.format(DateTime.now()),
//                       textScaleFactor: 1.5,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: snapshot.data.length,
//                         itemBuilder: (context, i) {
//                           return Text(
//                             snapshot.data[i],
//                             textScaleFactor: 1.4,
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//               else
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//           }
//         ),
//       ),
//     );
//   }
// }