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
      {required String currentUserId,
      required String otherUserId,
      required List<ChatMessage> messageList,
      required Option<ChatFailure> failureOption,
      required LoadStatus loadStatus,
      required ChatMessage chatMessage,
      required bool isSubmitting,
      required String sendedMessageId}) {
    return _ChatState(
      currentUserId: currentUserId,
      otherUserId: otherUserId,
      messageList: messageList,
      failureOption: failureOption,
      loadStatus: loadStatus,
      chatMessage: chatMessage,
      isSubmitting: isSubmitting,
      sendedMessageId: sendedMessageId,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
// init
  String get currentUserId => throw _privateConstructorUsedError;
  String get otherUserId => throw _privateConstructorUsedError; // overview
  List<ChatMessage> get messageList => throw _privateConstructorUsedError;
  Option<ChatFailure> get failureOption => throw _privateConstructorUsedError;
  LoadStatus get loadStatus => throw _privateConstructorUsedError; // writing
  ChatMessage get chatMessage => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String get sendedMessageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {String currentUserId,
      String otherUserId,
      List<ChatMessage> messageList,
      Option<ChatFailure> failureOption,
      LoadStatus loadStatus,
      ChatMessage chatMessage,
      bool isSubmitting,
      String sendedMessageId});

  $LoadStatusCopyWith<$Res> get loadStatus;
  $ChatMessageCopyWith<$Res> get chatMessage;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? currentUserId = freezed,
    Object? otherUserId = freezed,
    Object? messageList = freezed,
    Object? failureOption = freezed,
    Object? loadStatus = freezed,
    Object? chatMessage = freezed,
    Object? isSubmitting = freezed,
    Object? sendedMessageId = freezed,
  }) {
    return _then(_value.copyWith(
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: otherUserId == freezed
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      messageList: messageList == freezed
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
      loadStatus: loadStatus == freezed
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      sendedMessageId: sendedMessageId == freezed
          ? _value.sendedMessageId
          : sendedMessageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $LoadStatusCopyWith<$Res> get loadStatus {
    return $LoadStatusCopyWith<$Res>(_value.loadStatus, (value) {
      return _then(_value.copyWith(loadStatus: value));
    });
  }

  @override
  $ChatMessageCopyWith<$Res> get chatMessage {
    return $ChatMessageCopyWith<$Res>(_value.chatMessage, (value) {
      return _then(_value.copyWith(chatMessage: value));
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
      {String currentUserId,
      String otherUserId,
      List<ChatMessage> messageList,
      Option<ChatFailure> failureOption,
      LoadStatus loadStatus,
      ChatMessage chatMessage,
      bool isSubmitting,
      String sendedMessageId});

  @override
  $LoadStatusCopyWith<$Res> get loadStatus;
  @override
  $ChatMessageCopyWith<$Res> get chatMessage;
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
    Object? currentUserId = freezed,
    Object? otherUserId = freezed,
    Object? messageList = freezed,
    Object? failureOption = freezed,
    Object? loadStatus = freezed,
    Object? chatMessage = freezed,
    Object? isSubmitting = freezed,
    Object? sendedMessageId = freezed,
  }) {
    return _then(_ChatState(
      currentUserId: currentUserId == freezed
          ? _value.currentUserId
          : currentUserId // ignore: cast_nullable_to_non_nullable
              as String,
      otherUserId: otherUserId == freezed
          ? _value.otherUserId
          : otherUserId // ignore: cast_nullable_to_non_nullable
              as String,
      messageList: messageList == freezed
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      failureOption: failureOption == freezed
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<ChatFailure>,
      loadStatus: loadStatus == freezed
          ? _value.loadStatus
          : loadStatus // ignore: cast_nullable_to_non_nullable
              as LoadStatus,
      chatMessage: chatMessage == freezed
          ? _value.chatMessage
          : chatMessage // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      sendedMessageId: sendedMessageId == freezed
          ? _value.sendedMessageId
          : sendedMessageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ChatState extends _ChatState {
  const _$_ChatState(
      {required this.currentUserId,
      required this.otherUserId,
      required this.messageList,
      required this.failureOption,
      required this.loadStatus,
      required this.chatMessage,
      required this.isSubmitting,
      required this.sendedMessageId})
      : super._();

  @override // init
  final String currentUserId;
  @override
  final String otherUserId;
  @override // overview
  final List<ChatMessage> messageList;
  @override
  final Option<ChatFailure> failureOption;
  @override
  final LoadStatus loadStatus;
  @override // writing
  final ChatMessage chatMessage;
  @override
  final bool isSubmitting;
  @override
  final String sendedMessageId;

  @override
  String toString() {
    return 'ChatState(currentUserId: $currentUserId, otherUserId: $otherUserId, messageList: $messageList, failureOption: $failureOption, loadStatus: $loadStatus, chatMessage: $chatMessage, isSubmitting: $isSubmitting, sendedMessageId: $sendedMessageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality()
                .equals(other.currentUserId, currentUserId) &&
            const DeepCollectionEquality()
                .equals(other.otherUserId, otherUserId) &&
            const DeepCollectionEquality()
                .equals(other.messageList, messageList) &&
            const DeepCollectionEquality()
                .equals(other.failureOption, failureOption) &&
            const DeepCollectionEquality()
                .equals(other.loadStatus, loadStatus) &&
            const DeepCollectionEquality()
                .equals(other.chatMessage, chatMessage) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.sendedMessageId, sendedMessageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentUserId),
      const DeepCollectionEquality().hash(otherUserId),
      const DeepCollectionEquality().hash(messageList),
      const DeepCollectionEquality().hash(failureOption),
      const DeepCollectionEquality().hash(loadStatus),
      const DeepCollectionEquality().hash(chatMessage),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(sendedMessageId));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState extends ChatState {
  const factory _ChatState(
      {required String currentUserId,
      required String otherUserId,
      required List<ChatMessage> messageList,
      required Option<ChatFailure> failureOption,
      required LoadStatus loadStatus,
      required ChatMessage chatMessage,
      required bool isSubmitting,
      required String sendedMessageId}) = _$_ChatState;
  const _ChatState._() : super._();

  @override // init
  String get currentUserId;
  @override
  String get otherUserId;
  @override // overview
  List<ChatMessage> get messageList;
  @override
  Option<ChatFailure> get failureOption;
  @override
  LoadStatus get loadStatus;
  @override // writing
  ChatMessage get chatMessage;
  @override
  bool get isSubmitting;
  @override
  String get sendedMessageId;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
