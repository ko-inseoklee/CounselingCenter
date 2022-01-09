import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {

  //TODO: 게시글 리스트, 내 댓글 리스트
  factory User(
      {
        required String ID,
        required String password,
        required String uID,
        required String age,
        required bool sex,
        required bool phoneVerified,
        required String nickname}) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}