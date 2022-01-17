
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat{
  factory Chat({
    required String matchingID,
    required String messagesID,
    required String ownerNickname,
    required String otherNickname,
    required Map<String,dynamic> messages,
  }) = _Chat;

  factory Chat.fromJson(Map<String,dynamic> json) => _$ChatFromJson(json);
}

class Messages{
  final String messagesID;
  List<Message> messages;

  Messages({required this.messagesID, required this.messages});


}

List<Map<String,dynamic>> messageToJson({required Messages messages}){
  List<Map<String, dynamic>> result = [];
  messages.messages.forEach((element) {
    Map<String,dynamic> t = {
      'nickname' : element.nickname,
      'timeStamp' : element.t,
      'text' : element.message
    };
    result.add(t);
  });

  return result;
}

class Message{
  final String nickname;
  final DateTime t;
  final String message;

  Message({required this.nickname, required this.t, required this.message});
}