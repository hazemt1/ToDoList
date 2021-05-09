import 'package:to_do_list/Components/Task.dart';

class TaskList{
  static List<Task> tasks = [
    Task(
      toDo: "Daily Meeting",
      category: 0,
    ),
    Task(
      toDo: "Check emails",
      category: 1,
    ),
    Task(
      toDo: "Business lunch",
      category: 0,
    ),

  ];
}