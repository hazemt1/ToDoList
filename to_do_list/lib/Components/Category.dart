import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Category extends StatelessWidget {

  int numberOfTasks;
  String categoryName;
  int completedTasks;
  Color color;
  Category(
      {Key key, this.categoryName, this.numberOfTasks, this.completedTasks,this.color})
      : super(key: key);

  double calc(){
    return completedTasks/numberOfTasks;
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      width: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: HexColor("FFFFFF"),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0 ,left: 12),
            child: Text(
              "$numberOfTasks tasks",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0 ,left: 10),
            child: Text(
              "$categoryName",
              style: TextStyle(fontSize: 16),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:8.0,left: 5),
            child: new LinearPercentIndicator(
              width: 180.0,
              lineHeight: 8.0,
              percent: calc(),
              progressColor: color,
            ),
          ),
        ],
      ),
    );
  }
}
