import 'package:flutter/material.dart';

class ChattingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
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

              ],
            )),

            //경계선
            Divider(
              thickness: 1,
              height: 1,
              color: Colors.grey[400],
            ),

            //메시지 입력칸
            Row(
              children: [
                //입력
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                    child: TextField(
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
            )
        ]
        ),
      )
    );
  }
}
