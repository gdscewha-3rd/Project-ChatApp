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
        child: Container(
          color: Colors.blue[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),

                //닉네임 입력칸
                child: TextField(
                  controller: _controller,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    filled:true,
                    fillColor: Colors.blue[100],
                    hintText: '아이디를 입력하세요.',
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              //버튼 클릭
              GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                var u=Uuid().v1();
                print('u>$u');
                //chatting page로 이동
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                        create: (context) => ChattingProvider(u,_controller.text),
                        child: ChattingPage(),
                    )
                ));
              },

              //버튼 모양
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset: Offset(4, 4), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    '입장하기',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}