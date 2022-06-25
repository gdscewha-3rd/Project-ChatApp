import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../chatting_page/chatting_page.dart';
import '../chatting_page/local_utils/ChattingProvider.dart';

class EntrancePage extends StatefulWidget {
  @override
  _EntrancePageState createState() => _EntrancePageState();

}

class _EntrancePageState extends State<EntrancePage> {
  late TextEditingController _controller;

  void initState(){
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),

              //닉네임 입력칸
              child: TextField(
                controller: _controller,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  hintText: '아이디를 입력하세요.',
                  hintStyle: TextStyle(color: Colors.grey)
                ),
              ),
            ),

            //버튼 클릭
            GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              //chatting page로 이동
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                      create: (context) => ChattingProvider(Uuid().v1(),_controller.text),
                      child: ChattingPage(),
                  )
              ));
            },

            //버튼 모양
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(width:2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Text(
                  '방 입장',
                  style: TextStyle(
                      fontSize: 23,
                      color: Colors.black
                  ),
                )
            ),
          ),
          ],
        ),
      ),
    );
  }
}