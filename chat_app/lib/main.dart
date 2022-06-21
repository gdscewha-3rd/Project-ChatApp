import 'package:chat_app/screens/chats.dart';
import 'package:chat_app/screens/people.dart';
import 'package:chat_app/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomePage(),
      //color 변경
      theme: CupertinoThemeData(brightness: Brightness.light, primaryColor: Color(0xFF44a1ff)),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var screens=[People(),Chats(),Settings()];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: "People",
            icon: Icon(CupertinoIcons.person_alt_circle),
          ),
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
          ),

          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(CupertinoIcons.settings_solid),
          ),

        ],
      ),
      tabBuilder: (BuildContext context, int index){
        return screens[index];
      },
    ));
  }
}

