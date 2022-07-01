import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../injection.dart';
import 'errors.dart';

/* NOTE: 
本來想說在document裡面多延伸第二層的coll，
缺點： 
- 路徑要分很多，容易牽一髮動全身
- firebase是根據讀取doc的數量下去計價，如果分開讀的話價格就變高了
// https://firebase.google.com/docs/firestore/pricing#listens
- listen的話，每次增加或更新doc的時候
直接用query從同一個coll裡面用where篩選，query
- 省錢方法，紀錄最後更新的時間lastUpdated，還有最後抓資料更新的時間lastFetchTimestamp
where 的時候篩選
- https://firebase.google.com/docs/firestore/billing-example#see-chats
*/
extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userIdOption = await getIt<IAuthFacade>().getSignedInUserId();
    final userId = userIdOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('userList').doc(userId);
  }

  Future<DocumentReference> groupChatDocument({
    required String fromId,
    required String toId,
  }) async {
    List<String> idList = [fromId, toId];
    idList.sort();
    final groupChatId = idList.join('');
    return FirebaseFirestore.instance.collection('chatList').doc(groupChatId);
  }

  CollectionReference get userListCollection => collection('userList');
  // CollectionReference get messageListCollection => collection('messageList');
}

// NOTE: 隸屬於doc支線以下的，用這個，才不用一直傳遞companyId
extension DocumentReferenceX on DocumentReference {
  CollectionReference get chatListCollection => collection('chatList');
  CollectionReference get messageListCollection => collection('messageList');
}
