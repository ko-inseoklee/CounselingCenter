// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
class _$ChatTearOff {
  const _$ChatTearOff();

  _Chat call(
      {required String matchingID,
      required String messagesID,
      required String ownerNickname,
      required String otherNickname,
      required Map<String, dynamic> messages}) {
    return _Chat(
      matchingID: matchingID,
      messagesID: messagesID,
      ownerNickname: ownerNickname,
      otherNickname: otherNickname,
      messages: messages,
    );
  }

  Chat fromJson(Map<String, Object> json) {
    return Chat.fromJson(json);
  }
}

/// @nodoc
const $Chat = _$ChatTearOff();

/// @nodoc
mixin _$Chat {
  String get matchingID => throw _privateConstructorUsedError;
  String get messagesID => throw _privateConstructorUsedError;
  String get ownerNickname => throw _privateConstructorUsedError;
  String get otherNickname => throw _privateConstructorUsedError;
  Map<String, dynamic> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call(
      {String matchingID,
      String messagesID,
      String ownerNickname,
      String otherNickname,
      Map<String, dynamic> messages});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object? matchingID = freezed,
    Object? messagesID = freezed,
    Object? ownerNickname = freezed,
    Object? otherNickname = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      matchingID: matchingID == freezed
          ? _value.matchingID
          : matchingID // ignore: cast_nullable_to_non_nullable
              as String,
      messagesID: messagesID == freezed
          ? _value.messagesID
          : messagesID // ignore: cast_nullable_to_non_nullable
              as String,
      ownerNickname: ownerNickname == freezed
          ? _value.ownerNickname
          : ownerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      otherNickname: otherNickname == freezed
          ? _value.otherNickname
          : otherNickname // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String matchingID,
      String messagesID,
      String ownerNickname,
      String otherNickname,
      Map<String, dynamic> messages});
}

/// @nodoc
class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object? matchingID = freezed,
    Object? messagesID = freezed,
    Object? ownerNickname = freezed,
    Object? otherNickname = freezed,
    Object? messages = freezed,
  }) {
    return _then(_Chat(
      matchingID: matchingID == freezed
          ? _value.matchingID
          : matchingID // ignore: cast_nullable_to_non_nullable
              as String,
      messagesID: messagesID == freezed
          ? _value.messagesID
          : messagesID // ignore: cast_nullable_to_non_nullable
              as String,
      ownerNickname: ownerNickname == freezed
          ? _value.ownerNickname
          : ownerNickname // ignore: cast_nullable_to_non_nullable
              as String,
      otherNickname: otherNickname == freezed
          ? _value.otherNickname
          : otherNickname // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  _$_Chat(
      {required this.matchingID,
      required this.messagesID,
      required this.ownerNickname,
      required this.otherNickname,
      required this.messages});

  factory _$_Chat.fromJson(Map<String, dynamic> json) =>
      _$_$_ChatFromJson(json);

  @override
  final String matchingID;
  @override
  final String messagesID;
  @override
  final String ownerNickname;
  @override
  final String otherNickname;
  @override
  final Map<String, dynamic> messages;

  @override
  String toString() {
    return 'Chat(matchingID: $matchingID, messagesID: $messagesID, ownerNickname: $ownerNickname, otherNickname: $otherNickname, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.matchingID, matchingID) ||
                const DeepCollectionEquality()
                    .equals(other.matchingID, matchingID)) &&
            (identical(other.messagesID, messagesID) ||
                const DeepCollectionEquality()
                    .equals(other.messagesID, messagesID)) &&
            (identical(other.ownerNickname, ownerNickname) ||
                const DeepCollectionEquality()
                    .equals(other.ownerNickname, ownerNickname)) &&
            (identical(other.otherNickname, otherNickname) ||
                const DeepCollectionEquality()
                    .equals(other.otherNickname, otherNickname)) &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(matchingID) ^
      const DeepCollectionEquality().hash(messagesID) ^
      const DeepCollectionEquality().hash(ownerNickname) ^
      const DeepCollectionEquality().hash(otherNickname) ^
      const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  factory _Chat(
      {required String matchingID,
      required String messagesID,
      required String ownerNickname,
      required String otherNickname,
      required Map<String, dynamic> messages}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get matchingID => throw _privateConstructorUsedError;
  @override
  String get messagesID => throw _privateConstructorUsedError;
  @override
  String get ownerNickname => throw _privateConstructorUsedError;
  @override
  String get otherNickname => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic> get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChatCopyWith<_Chat> get copyWith => throw _privateConstructorUsedError;
}
