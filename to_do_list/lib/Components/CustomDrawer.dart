import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Components/AppDrawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HexColor("0E1F54"),
      child: SafeArea(
        child: Theme(
          data: ThemeData(
            brightness: Brightness.dark,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/max/2800/0*XQguzaOFiqd6fwUc"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 75.0),
                      child: MaterialButton(
                        onPressed: () {
                          AppDrawer.of(context).close();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: Text(
                    "Hazem\nTarek",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.bookmark,
                    color: Colors.grey,
                  ),
                  title: Text("Templates"),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.rectangle_grid_2x2,
                    color: Colors.grey,
                  ),
                  title: Text("Categories"),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.chart_pie,
                    color: Colors.grey,
                  ),
                  title: Text("Analytics"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: Text("Setting"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
