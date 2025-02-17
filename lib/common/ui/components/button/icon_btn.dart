import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verymemo/ui/components/button/button_state.dart';
import 'dart:math' as math;

/// ✅ 아이콘 크기 (소형, 중형, 대형)
enum IconSize { small, medium, large }

/// ✅ 아이콘 설정 (경로, 크기, 색상)
class IconConfig {
  /// 📌 크기별 아이콘 사이즈 정의
  static const Map<IconSize, double> iconSizes = {
    IconSize.small: 20.0,
    IconSize.medium: 24.0,
    IconSize.large: 28.0,
  };

  /// 📌 SVG 아이콘 파일 경로 정의
  static const Map<String, String> icons = {
    "search": "assets/icons/search.svg",
    "sort": "assets/icons/sort.svg",
    "more": "assets/icons/more.svg",
    "back": "assets/icons/back.svg",
    "close": "assets/icons/close.svg",
    "delete": "assets/icons/delete.svg",
    "download": "assets/icons/download.svg",
    "memo": "assets/icons/memo.svg",
    "feed": "assets/icons/feed.svg",
    "copy": "assets/icons/copy.svg",
    "bookmark": "assets/icons/bookmark.svg",
    "upload": "assets/icons/upload.svg",
    "edit": "assets/icons/edit.svg",
  };

  /// 📌 아이콘 크기 가져오기 (기본값 medium)
  static double getIconSize(IconSize size) {
    return iconSizes[size] ?? iconSizes[IconSize.medium]!;
  }

  /// 📌 아이콘 경로 가져오기 (기본 아이콘 설정)
  static String getIconPath(String iconKey) {
    return icons[iconKey] ?? "assets/icons/memo.svg";
  }
}

/// ✅ 아이콘 버튼 위젯
class IconBtn extends StatelessWidget {
  final String? iconKey;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final IconSize size;
  final Color? color;
  final ButtonState state;
  final bool autoDisable;

  const IconBtn({
    super.key,
    required this.iconKey,
    this.onTap,
    this.padding = const EdgeInsets.all(8.0),
    this.size = IconSize.medium,
    this.color,
    this.state = ButtonState.primary,
    this.autoDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveState = ButtonStateConfig.getEffectiveState(
      currentState: state,
      autoDisable: autoDisable,
      hasRequiredData: iconKey != null,
      hasOnPressed: onTap != null,
    );

    final (_, foregroundColor) = ButtonStateConfig.getButtonColors(
      Theme.of(context).colorScheme,
      effectiveState,
    );

    final double iconSize = IconConfig.getIconSize(size);
    final String assetPath = IconConfig.getIconPath(iconKey ?? '');

    return GestureDetector(
      onTap: effectiveState == ButtonState.disabled ? null : onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: math.max(iconSize + padding.horizontal, 44.0),
        height: math.max(iconSize + padding.vertical, 44.0),
        child: Center(
          child: Padding(
            padding: padding,
            child: SvgPicture.asset(
              assetPath,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                color ?? foregroundColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ✅ 원형 배경이 있는 아이콘 버튼 위젯
class IconCircleBtn extends StatelessWidget {
  final String? iconKey;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? opacity;
  final double size;
  final ButtonState state;
  final bool autoDisable;

  const IconCircleBtn({
    super.key,
    required this.iconKey,
    this.onTap,
    this.backgroundColor,
    this.opacity,
    this.size = 56.0,
    this.state = ButtonState.primary,
    this.autoDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveState = ButtonStateConfig.getEffectiveState(
      currentState: state,
      autoDisable: autoDisable,
      hasRequiredData: iconKey != null,
      hasOnPressed: onTap != null,
    );

    final (bgColor, fgColor) = ButtonStateConfig.getButtonColors(
      Theme.of(context).colorScheme,
      effectiveState,
    );

    final Color effectiveBackground = backgroundColor ?? bgColor;
    final Color finalBackground = opacity != null
        ? effectiveBackground.withOpacity(opacity!)
        : effectiveBackground;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: finalBackground,
      ),
      child: IconBtn(
        iconKey: iconKey,
        padding: EdgeInsets.zero,
        size: IconSize.medium,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
