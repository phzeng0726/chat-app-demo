import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/chat/chat_message.dart';
import '../../domain/core/device_time_stamp.dart';

part 'chat_message_dtos.freezed.dart';
part 'chat_message_dtos.g.dart';

@freezed
class ChatMessageListDto with _$ChatMessageListDto {
  const ChatMessageListDto._();
  const factory ChatMessageListDto({
    required List<ChatMessageDto> list,
  }) = _ChatMessageListDto;

  factory ChatMessageListDto.fromDomain(List<ChatMessage> chatMessageList) {
    return ChatMessageListDto(
        list: chatMessageList
            .map((chatMessage) => ChatMessageDto.fromDomain(chatMessage))
            .toList());
  }

  List<ChatMessage> toDomain() {
    return list.map((dto) => dto.toDomain()).toList();
  }

  factory ChatMessageListDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageListDtoFromJson(json);

  factory ChatMessageListDto.fromFirestore(QuerySnapshot snapshot) {
    final list = snapshot.docs.map((doc) => doc.data()).toList();
    return ChatMessageListDto.fromJson({'list': list});
  }
}

@freezed
class ChatMessageDto with _$ChatMessageDto {
  const ChatMessageDto._();
  const factory ChatMessageDto({
    required String fromId,
    required String toId,
    required String content,
    required int createdTimeStamp,
    required int type,
  }) = _ChatMessageDto;

  factory ChatMessageDto.fromDomain(ChatMessage chatMessage) {
    return ChatMessageDto(
      fromId: chatMessage.fromId,
      toId: chatMessage.toId,
      content: chatMessage.content,
      createdTimeStamp:
          chatMessage.createdTimeStamp.value.microsecondsSinceEpoch,
      type: chatMessage.type,
    );
  }

  ChatMessage toDomain() => ChatMessage(
        fromId: fromId,
        toId: toId,
        content: content,
        createdTimeStamp: DeviceTimeStamp.fromInt(createdTimeStamp),
        type: type,
      );
  // lastSignInTimeStamp: DeviceTimeStamp.fromInt(lastSignInTimeStamp),

  factory ChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageDtoFromJson(json);

  factory ChatMessageDto.fromFirestore(DocumentSnapshot doc) {
    return ChatMessageDto.fromJson(doc.data()! as Map<String, dynamic>);
  }
}
