import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_list/Components/AppDrawer.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:to_do_list/Components/Category.dart';
import 'package:to_do_list/Components/CategoryList.dart';
import 'package:to_do_list/Components/Task.dart';
import 'package:to_do_list/Components/TaskList.dart';
import '../Home.dart';

class AddTask extends StatefulWidget {
  AppBar appBar;
  AddTask({Key key, this.appBar}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskToDo;
  String category;
  List<String> categoryList = <String>["Business", "Personal"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("FFFFFF"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                MaterialButton(
                  child: Container(
                    margin: EdgeInsets.only(right: 15, top: 40),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Icon(Icons.close),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          transitionsBuilder:
                              (context, animation, animationTime, child) {
                            return ScaleTransition(
                              alignment: Alignment.topRight,
                              scale: animation,
                              child: child,
                            );
                          },
                          pageBuilder: (context, animation, animationTime) {
                            return AppDrawer(
                              child: Home(
                                appBar: widget.appBar,
                              ),
                            );
                          }),
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: 300,
              height: 150,
              child: TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter new task",
                ),
                onChanged: (input) {
                  taskToDo = input;
                },
              ),
            ),
            DropdownButton(
              items: categoryList.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              value: category,
              onChanged: (newCategory) {
                category = newCategory;
                print(category);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 130),
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "New task",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_up),

                    ],
                  ),
                ),
                onPressed: () {
                  if(category==categoryList[0]&&taskToDo!=null){
                    TaskList.tasks.add(Task(toDo: taskToDo,category: 0,));
                    CategoryList.categories[0].numberOfTasks++;
                  }
                  else if(taskToDo!= null){
                    TaskList.tasks.add(Task(toDo: taskToDo,category: 1,));
                    CategoryList.categories[1].numberOfTasks++;
                  }
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        transitionsBuilder: (context, animation, animationTime, child) {
                          return ScaleTransition(
                            alignment: Alignment.bottomRight,
                            scale: animation,
                            child: child,
                          );
                        },
                        pageBuilder: (context, animation, animationTime) {
                          return AppDrawer(child:Home(appBar: widget.appBar,));
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}
