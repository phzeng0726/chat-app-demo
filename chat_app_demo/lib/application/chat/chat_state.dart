part of 'chat_cubit.dart';

// 登入之後獲取company跟user之類的都在這
@freezed
class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState({
    required String groupChatId,
    // required String toUserId,
    required ChatMessage chatMessage,
    required List<ChatMessage> messageList,
    required LoadStatus loadStatus,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        groupChatId: '',
        // toUserId: '',
        chatMessage: ChatMessage.empty(),
        messageList: <ChatMessage>[],
        loadStatus: const LoadStatus.initial(),
      );
}
