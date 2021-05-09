import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:to_do_list/Components/AddTask.dart';
import 'package:to_do_list/Components/Category.dart';
import 'package:to_do_list/Components/CategoryList.dart';
import 'package:to_do_list/Components/Task.dart';
import 'package:to_do_list/Components/TaskList.dart';

class Home extends StatefulWidget {
  final AppBar appBar;
  Home({Key key, this.appBar}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  callback() {
    setState(() {
      ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: CategoryList.categories.length,
        itemBuilder: (BuildContext context, int index) =>
            CategoryList.categories[index].build(context),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("DFE0E6"),
      appBar: widget.appBar,
      body: Padding(
        padding: EdgeInsets.only(left: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's up, joy!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "CATEGORIES",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryList.categories.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CategoryList.categories[index].build(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 10),
                child: Text(
                  "TODAY'S TASKS",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                width: 310,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: TaskList.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: ObjectKey(TaskList.tasks[index]),
                        child: TaskList.tasks[index],
                        onDismissed: (direction) {
                          setState(() {
                            CategoryList.categories[TaskList.tasks[index].category].numberOfTasks--;
                            if(TaskList.tasks[index].done){
                              CategoryList.categories[TaskList.tasks[index].category].completedTasks--;
                            }
                            TaskList.tasks.removeAt(index);
                          });
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
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
                  return AddTask(
                    appBar: widget.appBar,
                  );
                }),
          );
        },
      ),
    );
  }
}
