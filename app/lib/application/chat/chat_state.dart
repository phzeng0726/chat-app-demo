part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState({
    // init
    required String currentUserId,
    required String otherUserId,
    // overview
    required List<ChatMessage> messageList,
    required Option<ChatFailure> failureOption,
    required LoadStatus loadStatus,
    // writing
    required ChatMessage chatMessage,
    required bool isSubmitting,
    required String sendedMessageId,
  }) = _ChatState;

  factory ChatState.initial() => ChatState(
        currentUserId: '',
        otherUserId: '',
        messageList: <ChatMessage>[],
        loadStatus: const LoadStatus.initial(),
        failureOption: none(),
        chatMessage: ChatMessage.empty(),
        isSubmitting: false,
        sendedMessageId: '',
      );
}
