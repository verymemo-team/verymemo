import 'dart:io';
import 'package:verymemo/common/ui/components/list/memo_list/memo_list_model.dart';
import 'package:flutter/foundation.dart';

class MemoListViewModel extends ChangeNotifier {
// 데이터와 로직 관리

  List<MemoListModel> memoList = [
    MemoListModel(
      userName: '하누리',
      description: '우리집 귀요미',
      memoContent:
          'StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다.StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다.StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다.StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다. StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다.',
      links: [
        LinkData(
          url: 'https://flutter.dev',
          thumbnail:
              'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
          metaTitle:
              '여기는 링크 메타데이터 타이틀입니다. 몇 줄로 제한할지 고민이 됩니다. 몇 줄까지 나오는 걸까요????',
          metaDescription: '서브스크린션 영역입니다',
        ),
      ],
      date: DateTime.now().subtract(const Duration(days: 1)),
      imageUrls: [
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
      ],
      isLocalMemo: true,
    ),
    MemoListModel(
      userName: '장보기 메모',
      description: null,
      memoContent: '사과, 바나나, 우유, 계란, 치즈',
      links: [
        LinkData(
          url: 'https://pub.dev',
          thumbnail:
              'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
          metaTitle: 'Pub.dev - Flutter packages',
          metaDescription:
              'Pub is the package manager for the Dart programming language.',
        ),
      ],
      date: DateTime.now().subtract(const Duration(days: 2)),
      imageUrls: [],
    ),
    MemoListModel(
      userName: '이미지 많아요',
      description: '여기 영역 제한해야 돼요',
      memoContent: null,
      date: DateTime.now().subtract(const Duration(days: 2)),
      imageUrls: [
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
        'https://blog.kakaocdn.net/dn/cGbz7k/btsD1mY2YBd/LkWiVVFa4fwyHiCkSW0Ru0/img.png',
      ],
    )
  ];

  List<LinkData> extractLinks() {
    // 이 메모 리스트를 기존에 파일에서
    //생성한 리스트를 가져오기에 이렇게 파라미터로 받아와서 사용했습니다.
    List<LinkData> allLinks = [];
    for (var memo in memoList) {
      if (memo.links != null) {
        allLinks.addAll(memo.links!);
      }
    }
    return allLinks;
  }

  // 이미지 관련 로직 추가
  bool get isDesktopPlatform =>
      kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS;

  int getRemainingCount(List<String>? imageUrls) =>
      (imageUrls?.length ?? 0) > 5 ? (imageUrls?.length ?? 0) - 5 : 0;

  int getDisplayCount(List<String>? imageUrls) =>
      (imageUrls?.take(5).length ?? 0);

  bool isUseFixedSize(List<String>? imageUrls) =>
      getDisplayCount(imageUrls) <= 2;

  List<String> getDisplayImages(List<String>? imageUrls) =>
      imageUrls?.take(5).toList() ?? [];

  bool shouldShowRemainingCount(List<String>? imageUrls, int index) =>
      index == 4 && getRemainingCount(imageUrls) > 0;
}
