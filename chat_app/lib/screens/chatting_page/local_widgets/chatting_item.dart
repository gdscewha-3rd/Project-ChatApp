import 'package:chat_app/models/ChattingModel.dart';
import 'package:chat_app/screens/chatting_page/local_utils/ChattingProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChattingItem extends StatelessWidget {
  const ChattingItem({Key? key, required this.chattingModel}): super(key:key);
  final ChattingModel chattingModel;

  @override
  Widget build(BuildContext context) {
    var p=Provider.of<ChattingProvider>(context);
    //내가 보낸 메시지인 경우
    var isMe=chattingModel.id==p.id;
    return Container(
      margin: isMe? EdgeInsets.fromLTRB(0,5,15,15): EdgeInsets.fromLTRB(15,5,0,15),
      child: Row(
        //메시지 정렬
        mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              //아이디
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      chattingModel.name,
                      style: TextStyle(
                          color: Colors.indigo[600],
                          fontSize:18
                      ),
                  )
              ),
              //말풍선
              Container(
                margin: EdgeInsets.fromLTRB(0,5,0,0),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(isMe?30:0),
                      bottomRight: Radius.circular(isMe?0:30)),
                  color: isMe? Colors.deepPurple[200]: Colors.blue[300],
                ),
                //텍스트
                child: Text(
                  chattingModel.text,
                  style: TextStyle(
                      color: Colors.white,
                    fontSize: 19
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
