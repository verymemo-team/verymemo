
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
