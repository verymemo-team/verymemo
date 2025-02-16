class ProfileListModel {
  final String? profileImageUrl;
  final String userName;
  final String? description;

  ProfileListModel({
    this.profileImageUrl,
    required this.userName,
    this.description,
  });
}

/// 링크 데이터 모델
class LinkData {
  final String url;
  final String? thumbnail;
  final String? metaTitle;
  final String? metaDescription;

  LinkData({
    required this.url,
    this.thumbnail,
    this.metaTitle,
    this.metaDescription,
  });
}

class MemoListModel {
  final String? profileImageUrl;
  final String? userName;
  final String? description;
  final String? memoContent;
  final List<String>? imageUrls;
  final List<LinkData>? links;
  final DateTime date;
  final bool isLocalMemo;

  MemoListModel({
    this.profileImageUrl,
    this.userName,
    this.description,
    this.memoContent,
    this.imageUrls,
    this.links,
    required this.date,
    this.isLocalMemo = false,
  });

  // 테스트용 샘플 데이터
  static final List<MemoListModel> sampleMemoList = [
    MemoListModel(
      userName: '하누리',
      description: '우리집 귀요미',
      memoContent: 'StatefulWidget으로 변경하여 접기/펼치기 상태를 관리합니다.',
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
    ),
  ];
}
