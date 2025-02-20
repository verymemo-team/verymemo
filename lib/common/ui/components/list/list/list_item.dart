import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/button/icon_btn.dart';
import 'package:verymemo/common/ui/common/title_subtitle.dart';
import 'package:verymemo/common/ui/components/list/list/config_list_item.dart';

class ListItem extends StatelessWidget {
  final ListItemConfig config;
  final String title;
  final String? subtitle;
  final String? leadingImageUrl;
  final VoidCallback? onTap;

  const ListItem({
    super.key,
    required this.config,
    required this.title,
    this.subtitle,
    this.leadingImageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: config.padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (config.leadingType != ListItemType.none) _buildLeading(context),
          if (config.leadingType != ListItemType.none)
            SizedBox(width: config.itemSpacing),
          Expanded(child: _buildTitleSubtitle(context)),
          if (config.trailingType != ListItemType.none) _buildTrailing(context),
        ],
      ),
    );
  }

  /// ✅ 리딩 아이템 빌드 (아이콘 버튼, 이미지, 체크박스 등)
  Widget _buildLeading(BuildContext context) {
    switch (config.leadingType) {
      case ListItemType.image:
        return GestureDetector(
          onTap: () => debugPrint("이미지 클릭!"),
          child: _buildImage(),
        );
      case ListItemType.icon:
        return config.leadingIconKey != null
            ? IconBtn(
                iconKey: config.leadingIconKey!,
                onTap: onTap,
                size: config.leadingIconSize,
                color: config.leadingIconColor,
              )
            : const SizedBox();
      case ListItemType.checkbox:
        return _buildCheckbox();
      case ListItemType.toggle:
        return _buildToggle();
      default:
        return const SizedBox();
    }
  }

  /// ✅ 타이틀 & 서브타이틀 빌드
  Widget _buildTitleSubtitle(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: TitleSubtitleWidget(
        title: title,
        subtitle: subtitle,
        config: TitleSubtitlePresets.listItem,
      ),
    );
  }

  /// ✅ 트레일링 아이템 빌드 (아이콘 버튼, 토글 등)
  Widget _buildTrailing(BuildContext context) {
    switch (config.trailingType) {
      case ListItemType.icon:
        return config.trailingIconKey != null
            ? IconBtn(
                iconKey: config.trailingIconKey!,
                onTap: () => debugPrint("메모 아이콘 클릭!"),
                size: IconSize.small,
                color: config.trailingIconColor,
              )
            : const SizedBox();
      case ListItemType.toggle:
        return _buildToggle();
      default:
        return const SizedBox();
    }
  }

  /// ✅ 리딩 이미지 빌드 (클립된 썸네일)
  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(config.imageRadius),
      child: SizedBox.square(
        dimension: config.imageSize,
        child: leadingImageUrl != null
            ? Image.network(leadingImageUrl!, fit: BoxFit.cover)
            : Container(color: Colors.grey[300]),
      ),
    );
  }

  /// ✅ 체크박스 빌드
  Widget _buildCheckbox() {
    return Checkbox(
      value: config.checkboxValue ?? false,
      onChanged: config.onCheckboxChanged,
    );
  }

  /// ✅ 토글 스위치 빌드
  Widget _buildToggle() {
    return Switch(
      value: config.toggleValue ?? false,
      onChanged: config.onToggleChanged,
      inactiveTrackColor: Colors.grey[300],
      inactiveThumbColor: Colors.white,
    );
  }
}
