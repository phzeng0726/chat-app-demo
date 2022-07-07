import 'package:flutter/material.dart';

const double kDefaultPadding = 20.0;
const double kDefaultHeightSize = 20.0;

const String defaultUserProfileImage =
    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png';

const List<Map<String, dynamic>> localeMapList = [
  {
    'id': 'zh_TW',
    'title': '繁體中文 (台灣)',
    'locale': Locale('zh', 'TW'),
  },
  {
    'id': 'en_US',
    'title': 'English (US)',
    'locale': Locale('en', 'US'),
  }
];

const String introductionDataMD = """
# 聊天APP 簡介
---
## ==關於我==
我是 Rita，我是個喜歡動腦、探索新知、學習新事物的科技夢想家，細心、勤奮、擁有良好的自學習慣與快速學習的能力是我的優點。我畢業於東吳大學巨量資料管理學院，主修數據分析。在學期間學會爬蟲、資料正規化、建成資料庫、資料視覺化與資料分析...等技能。因為對前後端有濃厚的興趣，自學了 GCP 與 Flutter，試做的過程中發現自己熱衷於 APP 領域，並從此一腳踏入該領域。

## ==關於這個作品==
這個 APP 是用來展現我所做過的專案的精簡版，比起以往的作品，這個作品的架構相對簡單，不過可以展現一些我的基本功，**開發總時間為 5 天**。

### 主要開發工具
- 前端：Flutter
- 後端：Cloud Firestore | Cloud Storage

### 特點
- 使用 Bloc 狀態管理\n
  很好地將狀態拆分為小元件，高效能且易於維護
- DDD design pattern\n
  乾淨簡潔的程式碼，易於維護擴充

### 功能
- 基本資料驗證
- 用戶註冊
- 即時傳訊
- 主題切換
- 多國語言切換
- 圖片上傳...等。

## ==其他作品==
除此之外我還做過
- 實驗平台APP（開發工具為 Python、Flutter、Cloud Firestore、Cloud Stroage、Cloud Function）
- 找人才APP（開發工具為 Flutter、Cloud Firestore、Cloud Stroage、Cloud Function）
- 免廣告視覺化記帳APP（開發工具為 Flutter、SQLite）
""";
