class ChattingModel{
  ChattingModel(this.id,this.name,this.text, this.uploadTime);
  late final String id;
  late final String name;
  late final String text;
  late final int uploadTime;

  //json 형태로 들어오는 것을 ChattingModel로 바꿔줌
  factory ChattingModel.fromJson(Map<String,dynamic> json){
    return ChattingModel(json['id'], json['name'], json['text'], json['uploadTime']);
  }

  Map<String,dynamic> toJson(){
      return <String,dynamic>{
        'id':id,
        'name':name,
        'text':text,
        'uploadTime': uploadTime,
      };
  }

  }