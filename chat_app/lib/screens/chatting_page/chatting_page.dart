import 'dart:async';

import 'package:chat_app/models/ChattingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'local_utils/ChattingProvider.dart';
import 'local_widgets/chatting_item.dart';

class ChattingPage extends StatefulWidget {
  @override
  _ChattingPageState createState() => _ChattingPageState();

}

class _ChattingPageState extends State<ChattingPage> {
  late TextEditingController _controller;
  late StreamSubscription _streamSubscription;

  bool firstLoad=true;


  void initState(){
    _controller = TextEditingController();
    var p=Provider.of<ChattingProvider>(context, listen: false);

    _streamSubscription=p.getSnapshot().listen((event){
      if(firstLoad){
        firstLoad=false;
        return;
      }
      p.addOne(ChattingModel.fromJson(event.docs[0].data()));
    });


    Future.microtask(() {
      p.load();
    });
    super.initState();
  }

  void dispose(){
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var p=Provider.of<ChattingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        //뒤로가기 버튼
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        )
      ),

      body: SafeArea(
        child: Column(
          children: [
            //메시지 표현
            Expanded(
              child: ListView(
                reverse: true, //아래부터 채우기
              children: p.chattingList.map((e)=>ChattingItem(chattingModel: e)).toList(),
            )),

            //경계선
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey[400],
            ),

            //메시지 입력칸
            Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height*.3
                ),
              child: Row(
                children: [
                  //입력
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                      child: TextField(
                        controller: _controller,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(fontSize: 25),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '메시지 입력',
                            hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                    ),
                  ),

                  //send 버튼
                  GestureDetector(
                    onTap: (){
                      var text=_controller.text;
                      _controller.text='';
                      p.send(text);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      child: Icon(
                        Icons.send,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            )
        ]
        ),
      )
    );
  }
}
