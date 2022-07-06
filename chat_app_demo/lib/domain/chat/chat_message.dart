import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/device_time_stamp.dart';

part 'chat_message.freezed.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String fromId,
    required String toId,
    required String content,
    required DeviceTimeStamp createdTimeStamp,
    required int type,
  }) = _ChatMessage;

  factory ChatMessage.empty() {
    return ChatMessage(
      fromId: '',
      toId: '',
      content: '',
      createdTimeStamp: DeviceTimeStamp.now(),
      type: -1,
    );
  }
}
