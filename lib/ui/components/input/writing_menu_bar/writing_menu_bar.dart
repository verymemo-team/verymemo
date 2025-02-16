import 'package:flutter/material.dart';
import 'package:verymemo/ui/components/button/icon_btn.dart';
import 'package:verymemo/ui/components/input/writing_menu_bar/config_writing_menu_bar.dart';

class WritingMenuBar extends StatelessWidget {
  final VoidCallback? onCameraTap;
  final VoidCallback? onGalleryTap;
  final VoidCallback? onLinkTap;
  final VoidCallback? onPrivacyTap;
  final VoidCallback? onTagTap;
  final VoidCallback? onUploadTap;

  const WritingMenuBar({
    super.key,
    this.onCameraTap,
    this.onGalleryTap,
    this.onLinkTap,
    this.onPrivacyTap,
    this.onTagTap,
    this.onUploadTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ), // ✅ 전체 패딩
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// ✅ 왼쪽 아이콘 그룹 (Expanded 적용)
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  WritingMenuBarConfig.leadingIcons
                      .map((icon) => _buildLeadingIcon(icon, context))
                      .toList(),
            ),
          ),

          /// ✅ 오른쪽 아이콘 그룹
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
                WritingMenuBarConfig.trailingIcons
                    .map((icon) => _buildTrailingIcon(icon, context))
                    .toList(),
          ),
        ],
      ),
    );
  }

  /// ✅ 리딩 아이콘 빌드 (카메라, 갤러리, 링크, 비공개)
  Widget _buildLeadingIcon(LeadingIcon icon, BuildContext context) {
    switch (icon) {
      case LeadingIcon.camera:
        return _buildIconBtn("camera", onCameraTap);
      case LeadingIcon.gallery:
        return _buildIconBtn("gallery", onGalleryTap);
      case LeadingIcon.link:
        return _buildIconBtn("link", onLinkTap);
      case LeadingIcon.privacy:
        return _textButton("비공개", onPrivacyTap, context);
    }
  }

  /// ✅ 트레일링 아이콘 빌드 (태그, 업로드)
  Widget _buildTrailingIcon(TrailingIcon icon, BuildContext context) {
    switch (icon) {
      case TrailingIcon.tag:
        return _buildIconBtn("tag", onTagTap);
      case TrailingIcon.upload:
        return _floatingButton("upload", onUploadTap);
    }
  }

  /// ✅ 기본 아이콘 버튼
  Widget _buildIconBtn(String iconKey, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: IconBtn(iconKey: iconKey, onTap: onTap),
    );
  }

  /// ✅ 텍스트 버튼 (비공개 버튼)
  Widget _textButton(String text, VoidCallback? onTap, BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }

  /// ✅ 아이콘 버튼 (업로드 버튼 → `IconCircleBtn` 사용)
  Widget _floatingButton(String iconKey, VoidCallback? onTap) {
    return IconCircleBtn(iconKey: iconKey, onTap: onTap);
  }
}
