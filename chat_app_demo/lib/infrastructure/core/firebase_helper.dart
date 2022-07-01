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

  // Future<DocumentReference> companyDocument() async {
  //   final userDoc = await userDocument();
  //   final user = await userDoc.get().then(
  //         (doc) => UserDto.fromFirestore(doc).toDomain(),
  //       );
  //   final companyId = user.companyId;
  //   return companyListCollection.doc(companyId);
  // }

  CollectionReference get userListCollection =>
      collection('userList'); // companyUserList/{userId}
  // CollectionReference get companyListCollection =>
  //     collection('companyList'); // comapanyList/{companyId}

  // CollectionReference get userPermissionListCollection => collection(
  //     'userPermissionList'); // comapanyDataList/{companyId}/userPermissionList/{userId}

  // CollectionReference get watchHistoryListCollection =>
  //     collection('watchHistoryList'); // watchHistoryList/{}
  // // fromId : candidateUserId or companyUserId
  // // toId : jobId/caseId/candidateUserId
  // // timestamp : int
  // // historyType : 'job' 'case'
}

// NOTE: 隸屬於doc支線以下的，用這個，才不用一直傳遞companyId
extension DocumentReferenceX on DocumentReference {
  // CollectionReference get userListCollection =>
  //     collection('userList'); // jobOpeningList/{jobId}

  // CollectionReference get jobOpeningListCollection =>
  //     collection('jobOpeningList'); // jobOpeningList/{jobId}

  // CollectionReference get jobApplyListCollection => collection('jobApplyList');

  // CollectionReference get companyDataListCollection =>
  //     collection('companyDataList');

  // CollectionReference get tenderListCollection => collection('tenderList');

  // CollectionReference get tenderApplyListCollection => collection('tenderApplyList');

}
