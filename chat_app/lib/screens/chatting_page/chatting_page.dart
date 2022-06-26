import 'package:chat_app/models/ChattingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'local_widgets/chatting_item.dart';

class ChattingPage extends StatefulWidget {
  @override
  _ChattingPageState createState() => _ChattingPageState();

}

class _ChattingPageState extends State<ChattingPage> {
  late TextEditingController _controller;

  void initState(){
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              children: [
                ChattingItem(chattingModel: ChattingModel('','abc','hihihihih',1)),
                ChattingItem(chattingModel: ChattingModel('','abc','hihihih',1)),
                ChattingItem(chattingModel: ChattingModel('','abc','hihihi',1)),
              ],
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                    child: Icon(
                      Icons.send,
                      size: 30,
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
