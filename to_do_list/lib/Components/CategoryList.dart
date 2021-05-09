import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/Components/Category.dart';

class CategoryList {
  static List<Category> categories = [
    Category(
      categoryName: "Business",
      numberOfTasks: 40,
      completedTasks: 13,
      color: Colors.deepPurple,
    ),
    Category(
      categoryName: "Personal",
      numberOfTasks: 18,
      completedTasks: 6,
      color: Colors.blue,
    )
  ];
}
