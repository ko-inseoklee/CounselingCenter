// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String ID,
      required String password,
      required String uID,
      required String age,
      required String sex,
      required bool phoneVerified,
      required String nickname}) {
    return _User(
      ID: ID,
      password: password,
      uID: uID,
      age: age,
      sex: sex,
      phoneVerified: phoneVerified,
      nickname: nickname,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get ID => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get uID => throw _privateConstructorUsedError;
  String get age => throw _privateConstructorUsedError;
  String get sex => throw _privateConstructorUsedError;
  bool get phoneVerified => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String ID,
      String password,
      String uID,
      String age,
      String sex,
      bool phoneVerified,
      String nickname});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? ID = freezed,
    Object? password = freezed,
    Object? uID = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? phoneVerified = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_value.copyWith(
      ID: ID == freezed
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      uID: uID == freezed
          ? _value.uID
          : uID // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerified: phoneVerified == freezed
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String ID,
      String password,
      String uID,
      String age,
      String sex,
      bool phoneVerified,
      String nickname});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? ID = freezed,
    Object? password = freezed,
    Object? uID = freezed,
    Object? age = freezed,
    Object? sex = freezed,
    Object? phoneVerified = freezed,
    Object? nickname = freezed,
  }) {
    return _then(_User(
      ID: ID == freezed
          ? _value.ID
          : ID // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      uID: uID == freezed
          ? _value.uID
          : uID // ignore: cast_nullable_to_non_nullable
              as String,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String,
      sex: sex == freezed
          ? _value.sex
          : sex // ignore: cast_nullable_to_non_nullable
              as String,
      phoneVerified: phoneVerified == freezed
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      nickname: nickname == freezed
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.ID,
      required this.password,
      required this.uID,
      required this.age,
      required this.sex,
      required this.phoneVerified,
      required this.nickname});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String ID;
  @override
  final String password;
  @override
  final String uID;
  @override
  final String age;
  @override
  final String sex;
  @override
  final bool phoneVerified;
  @override
  final String nickname;

  @override
  String toString() {
    return 'User(ID: $ID, password: $password, uID: $uID, age: $age, sex: $sex, phoneVerified: $phoneVerified, nickname: $nickname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.ID, ID) ||
                const DeepCollectionEquality().equals(other.ID, ID)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.uID, uID) ||
                const DeepCollectionEquality().equals(other.uID, uID)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.sex, sex) ||
                const DeepCollectionEquality().equals(other.sex, sex)) &&
            (identical(other.phoneVerified, phoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.phoneVerified, phoneVerified)) &&
            (identical(other.nickname, nickname) ||
                const DeepCollectionEquality()
                    .equals(other.nickname, nickname)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ID) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(uID) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(sex) ^
      const DeepCollectionEquality().hash(phoneVerified) ^
      const DeepCollectionEquality().hash(nickname);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required String ID,
      required String password,
      required String uID,
      required String age,
      required String sex,
      required bool phoneVerified,
      required String nickname}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get ID => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  String get uID => throw _privateConstructorUsedError;
  @override
  String get age => throw _privateConstructorUsedError;
  @override
  String get sex => throw _privateConstructorUsedError;
  @override
  bool get phoneVerified => throw _privateConstructorUsedError;
  @override
  String get nickname => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
