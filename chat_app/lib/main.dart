import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //버튼처럼 클릭할 수 있게
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            final f=FirebaseFirestore.instance;
            //key-value 설정
            await f.collection('PROFILE').doc('abc').set({'abc??':'def'});
            print('ok');
            },
          //버튼
          child: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(border: Border.all(width:2)),
            child: Text(
              'Send',
              style: TextStyle(fontSize: 25),
            )
          ),
        ),
      ),
    );
  }
}
