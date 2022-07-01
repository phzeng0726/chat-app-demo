// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

  _ChatState call(
      {required String groupChatId,
      required ChatMessage chatMessage,
      required List<ChatMessage> messageList,
      required LoadStatus loadStatus}) {
    return _ChatState(
      groupChatId: groupChatId,
      chatMessage: chatMessage,
      messageList: messageList,
      loadStatus: loadStatus,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  String get groupChatId =>
      throw _privateConstructorUsedError; // required String toUserId,
  ChatMessage get chatMessage => throw _privateConstructorUsedError;
  List<ChatMessage> get messageList => throw _privateConstructorUsedError;
  LoadStatus get loadStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {String groupChatId,
      ChatMessage chatMessage,
      List<ChatMessage> messageList,
      LoadStatus loadStatus});

  $ChatMessageCopyWith<$Res> get chatMessage;
  $LoadStatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? groupChatId = freezed,
    Object? chatMessage = freezed,
    Object? messageList = freezed,
    Object? loadStatus = freezed,
  }) {
    return _then(_value.copyWith(
      groupChatId: groupChatId == freezed
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      messageList: messageList == freezed
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      loadStatus: loadStatus == freezed
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ));
  }

  @override
  $ChatMessageCopyWith<$Res> get chatMessage {
    return $ChatMessageCopyWith<$Res>(_value.chatMessage, (value) {
      return _then(_value.copyWith(chatMessage: value));
    });
  }

  @override
  $LoadStatusCopyWith<$Res> get loadStatus {
    return $LoadStatusCopyWith<$Res>(_value.loadStatus, (value) {
      return _then(_value.copyWith(loadStatus: value));
    });
  }
}

/// @nodoc
abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String groupChatId,
      ChatMessage chatMessage,
      List<ChatMessage> messageList,
      LoadStatus loadStatus});

  @override
  $ChatMessageCopyWith<$Res> get chatMessage;
  @override
  $LoadStatusCopyWith<$Res> get loadStatus;
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object? groupChatId = freezed,
    Object? chatMessage = freezed,
    Object? messageList = freezed,
    Object? loadStatus = freezed,
  }) {
    return _then(_ChatState(
      groupChatId: groupChatId == freezed
          ? _value.groupChatId
          : groupChatId // ignore: cast_nullable_to_non_nullable
              as String,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      messageList: messageList == freezed
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      loadStatus: loadStatus == freezed
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
    ));
  }
}

/// @nodoc

class _$_ChatState extends _ChatState {
  const _$_ChatState(
      {required this.groupChatId,
      required this.chatMessage,
      required this.messageList,
      required this.loadStatus})
      : super._();

  @override
  final String groupChatId;
  @override // required String toUserId,
  final ChatMessage chatMessage;
  @override
  final List<ChatMessage> messageList;
  @override
  final LoadStatus loadStatus;

  @override
  String toString() {
    return 'ChatState(groupChatId: $groupChatId, chatMessage: $chatMessage, messageList: $messageList, loadStatus: $loadStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality()
                .equals(other.groupChatId, groupChatId) &&
            const DeepCollectionEquality()
                .equals(other.chatMessage, chatMessage) &&
            const DeepCollectionEquality()
                .equals(other.messageList, messageList) &&
            const DeepCollectionEquality()
                .equals(other.loadStatus, loadStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(groupChatId),
      const DeepCollectionEquality().hash(chatMessage),
      const DeepCollectionEquality().hash(messageList),
      const DeepCollectionEquality().hash(loadStatus));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
      {required String groupChatId,
      required ChatMessage chatMessage,
      required List<ChatMessage> messageList,
      required LoadStatus loadStatus}) = _$_ChatState;
  const _ChatState._() : super._();

  @override
  String get groupChatId;
  @override // required String toUserId,
  ChatMessage get chatMessage;
  @override
  List<ChatMessage> get messageList;
  @override
  LoadStatus get loadStatus;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
