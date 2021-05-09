import 'package:flutter/material.dart';
import 'package:to_do_list/Components/AppDrawer.dart';
import 'package:to_do_list/Home.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Builder(builder: (BuildContext appBarContext) {
        return IconButton(
          onPressed: () {
            AppDrawer.of(appBarContext).toggle();
          },
          icon: Icon(
            CupertinoIcons.bars,
            color: Colors.grey,
          ),
        );
      }),
      actions: [
        Icon(
          CupertinoIcons.search,
          color: Colors.grey,
        ),
        Padding(
          padding: const EdgeInsets.only(left:20.0,right: 15.0),
          child: Icon(
            CupertinoIcons.bell,
            color: Colors.grey,
          ),
        ),
      ],
    );
    return MaterialApp(
      home: AppDrawer(
        child: Home(
          appBar: appBar,
        ),
      ),
    );
  }
}
