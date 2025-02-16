import 'package:flutter/material.dart';
import 'package:verymemo/ui/common/title_subtitle.dart';
import 'package:verymemo/ui/components/button/icon_btn.dart';

enum ListItemType {
  image, // 이미지 (프로필, 썸네일 등)
  icon, // 아이콘 (액션 버튼 등)
  checkbox, // 체크박스
  toggle, // 토글
  text, // 텍스트 (카테고리, 숫자 등)
  none, // 아무것도 없음
}

class ListItemConfig {
  final EdgeInsets padding;
  final double itemSpacing;
  final ListItemType leadingType;
  final String? leadingIconKey;
  final TitleSubtitleConfig textConfig; // 타이틀/서브타이틀
  final ListItemType trailingType;
  final String? trailingIconKey;

  // 이미지 관련 설정
  final double imageSize;
  final double imageRadius;

  // 체크박스, 토글 설정
  final bool? checkboxValue;
  final bool? toggleValue;
  final ValueChanged<bool?>? onCheckboxChanged;
  final ValueChanged<bool>? onToggleChanged;

  // 아이콘 관련 설정 추가
  final IconSize leadingIconSize;
  final IconSize trailingIconSize;
  final Color? leadingIconColor;
  final Color? trailingIconColor;

  const ListItemConfig({
    // 레이아웃 관련
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.itemSpacing = 12.0,

    // leading 관련
    this.leadingType = ListItemType.none,
    this.leadingIconKey,

    // 중앙 텍스트 관련
    this.textConfig = const TitleSubtitleConfig(),

    // trailing 관련
    this.trailingType = ListItemType.none,
    this.trailingIconKey,

    // 이미지 관련
    this.imageSize = 56.0,
    this.imageRadius = 8.0,

    // 상호작용 관련 (체크박스, 토글)
    this.checkboxValue,
    this.onCheckboxChanged,
    this.toggleValue,
    this.onToggleChanged,

    // 아이콘 커스터마이징 옵션 수정
    this.leadingIconSize = IconSize.small,
    this.leadingIconColor,
    this.trailingIconColor,
    this.trailingIconSize = IconSize.small,
  });

  static const defaultConfig = ListItemConfig();
}
