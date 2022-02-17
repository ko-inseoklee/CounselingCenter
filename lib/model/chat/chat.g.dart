// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map<String, dynamic> json) {
  return _$_Chat(
    matchingID: json['matchingID'] as String,
    messagesID: json['messagesID'] as String,
    ownerNickname: json['ownerNickname'] as String,
    otherNickname: json['otherNickname'] as String,
    messages: json['messages'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'matchingID': instance.matchingID,
      'messagesID': instance.messagesID,
      'ownerNickname': instance.ownerNickname,
      'otherNickname': instance.otherNickname,
      'messages': instance.messages,
    };
