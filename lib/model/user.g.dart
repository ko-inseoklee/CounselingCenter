// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    ID: json['ID'] as String,
    password: json['password'] as String,
    uID: json['uID'] as String,
    age: json['age'] as String,
    sex: json['sex'] as String,
    phoneVerified: json['phoneVerified'] as bool,
    nickname: json['nickname'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'ID': instance.ID,
      'password': instance.password,
      'uID': instance.uID,
      'age': instance.age,
      'sex': instance.sex,
      'phoneVerified': instance.phoneVerified,
      'nickname': instance.nickname,
    };
