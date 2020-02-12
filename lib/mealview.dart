import 'package:flutter/material.dart';
import 'package:geupsik_flutter_alpha/modules/autodatelisting.dart';
import 'parser.dart';
import 'package:provider/provider.dart';
import 'dateprovider.dart';

class MealView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DateSelector>(context);
    List<DateTime> dateList = AutoDateListing().list(p.selectedDate);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          DateTime date = dateList[index];
          Meals meals = Meals();
          return FutureBuilder(
            future: meals.get(date),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Text(
                          '2020/2/12',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                meals.meal,
                                style: TextStyle(
                                  fontSize: 15
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    meals.kcal,
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 3, left: 1),
                                    child: Text(
                                      'kcal'
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        },
        childCount: dateList.length
      ),
    );
  }
}

// class MealView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var p = Provider.of<DateSelector>(context);
//     EdgeInsets padding = MediaQuery.of(context).padding;
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: double.infinity,
//       height: (size.height) - (110 + padding.top),
//       decoration: BoxDecoration(
//         color: Color.fromRGBO(230, 230, 230, 1),
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40)
//         )
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(right: 17, top: 17, bottom: 11),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             FutureBuilder(
//               future: getMeals(p.selectedDate, 'meals'),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Text(
//                     snapshot.data,
//                     textScaleFactor: 1.5,
//                     textAlign: TextAlign.end,
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//             Spacer(),
//             FutureBuilder(
//               future: getMeals(p.selectedDate, 'kcal'),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         snapshot.data,
//                         style: TextStyle(
//                           fontSize: 36,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 5.0, left: 3),
//                         child: Text(
//                           'kcal',
//                           textScaleFactor: 1.2,
//                         ),
//                       )
//                     ],
//                   );
//                 } else {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               },
//             ),
//             Container(
//               height: padding.bottom,
//             )
//           ],
//         ),
//       )
//     );
//   }
// }