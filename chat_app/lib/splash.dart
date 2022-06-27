import 'package:flutter/material.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    _navigateHome();
  }
  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 2000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          child: Text(
              'Chat App 💭',
              style: TextStyle(
                color: Colors.blue[400],
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              )
          )
    )

      )
    );
  }
}
