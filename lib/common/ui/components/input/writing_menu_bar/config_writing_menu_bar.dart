/// ✅ Leading 아이콘 타입
enum LeadingIcon {
  camera,
  gallery,
  link,
  privacy,
}

/// ✅ Trailing 아이콘 타입
enum TrailingIcon {
  tag,
  upload,
}

/// ✅ WritingMenuBar 설정
class WritingMenuBarConfig {
  /// 📌 왼쪽 아이콘 목록
  static const List<LeadingIcon> leadingIcons = [
    LeadingIcon.camera,
    LeadingIcon.gallery,
    LeadingIcon.link,
    // LeadingIcon.privacy,
  ];

  /// 📌 오른쪽 아이콘 목록
  static const List<TrailingIcon> trailingIcons = [
    // TrailingIcon.tag,
    TrailingIcon.upload,
  ];
}
