import 'package:flutter/material.dart';
import 'package:to_do_list/Components/CustomDrawer.dart';

class AppDrawer extends StatefulWidget {
  final Widget child;
  AppDrawer({key,this.child});
  static _AppDrawerState  of(BuildContext context) =>context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {
  static Duration duration =Duration(milliseconds: 200);
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this ,duration: _AppDrawerState.duration);
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle(){
    if(_controller.isCompleted){
      close();
    }else{
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    double maxSlide = 290;
    return GestureDetector(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context ,_){
          double animationValue = _controller.value;
          double translateValue = maxSlide * animationValue;
          double scaleValue =1 -(0.3*animationValue);
          return Stack(
            children: [
              CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateValue)
                  ..scale(scaleValue),
                child: GestureDetector(
                    onTap: (){
                      close();
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}
