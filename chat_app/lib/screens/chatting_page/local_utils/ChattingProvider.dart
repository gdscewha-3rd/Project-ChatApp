import 'package:chat_app/models/ChattingModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChattingProvider extends ChangeNotifier {

  static const String CHATTING_ROOM='CHATTING_ROOM';

  ChattingProvider(this.id, this.name);
  late final String id;
  late final String name;

  var chattingList=<ChattingModel>[];

  Stream<QuerySnapshot> getSnapshot(){
    final f=FirebaseFirestore.instance;
    return f.collection(CHATTING_ROOM).limit(1).orderBy('uploadTime',descending: true).snapshots();
  }

  void addOne(ChattingModel model){
    chattingList.insert(0,model);
    notifyListeners();
  }

  Future load() async{
    //현재 시간 이후의 것들은 모두 들어옴
    var now=DateTime.now().millisecondsSinceEpoch;
    final f=FirebaseFirestore.instance;
    var result=await f.collection(CHATTING_ROOM).where('uploadTime',isGreaterThan: now).orderBy('uploadTime',descending: true).get();
    var l=result.docs.map((e)=>ChattingModel.fromJson(e.data())).toList();
    chattingList.addAll(l);
    notifyListeners();

  }

  Future send(String text) async{
    var now=DateTime.now().millisecondsSinceEpoch;
    final f=FirebaseFirestore.instance;
    await f.collection(CHATTING_ROOM).doc(now.toString()).set(ChattingModel(id,name,text,now).toJson());


  }

}