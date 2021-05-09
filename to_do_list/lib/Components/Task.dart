import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_list/Components/Category.dart';
import 'package:to_do_list/Components/CategoryList.dart';

class Task extends StatefulWidget {
  int category;
  String toDo;
  bool done =false;
   Task({
     Key key,
     this.category,
     this.toDo,

   }) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      width: 290,
      margin: EdgeInsets.only(bottom:10),
      decoration: BoxDecoration(
          color: HexColor("FFFFFF"),
          borderRadius: BorderRadius.all(Radius.circular(20),
          )
      ),
      child: ListTile(
        title:  Text(widget.toDo,
        style:TextStyle(
            decoration:  (widget.done? TextDecoration.lineThrough:TextDecoration.none)
        ),
        ),
        leading: Checkbox(
          activeColor: CategoryList.categories[widget.category].color,
          value: widget.done,
          onChanged: (value) {
            setState(() {
              widget.done=value;
              if(widget.done){
                CategoryList.categories[widget.category].completedTasks++;
              }
              else{
                CategoryList.categories[widget.category].completedTasks--;
              }
              print(CategoryList.categories[widget.category].completedTasks);
            });
          },
        ),
      ),
    );
  }
}


