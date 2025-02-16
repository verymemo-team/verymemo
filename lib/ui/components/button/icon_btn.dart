import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  /// 📌 기본 온 서페이스
  static Color getIconColor(BuildContext context, {Color? overrideColor}) {
    return overrideColor ?? Theme.of(context).colorScheme.onSurface;
  }

  /// 📌 아이콘 크기 가져오기 (기본값 medium)
  static double getIconSize(IconSize size) {
    return iconSizes[size] ?? iconSizes[IconSize.medium]!;
  }

  /// 📌 아이콘 경로 가져오기 (기본 아이콘 설정)
  static String getIconPath(String iconKey) {
    return icons[iconKey] ?? "assets/icons/memo.svg"; // 기본 아이콘 지정 - 수정해야함
  }
}

/// ✅ 아이콘 버튼 위젯
class IconBtn extends StatelessWidget {
  final String iconKey; // svg 경로
  final VoidCallback? onTap; // 클릭 이벤트
  final EdgeInsets padding; // 아이콘 내부 패딩
  final IconSize size; // 아이콘 크기
  final Color? color; // 아이콘 색상

  const IconBtn({
    super.key,
    required this.iconKey,
    this.onTap,
    this.padding = const EdgeInsets.all(8.0),
    this.size = IconSize.medium,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = IconConfig.getIconSize(size); // 아이콘 크기
    final String assetPath = IconConfig.getIconPath(iconKey); // 아이콘 경로
    final Color iconColor = color ?? IconConfig.getIconColor(context); // 색상

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque, // 투명 영역도 터치 가능하도록 처리
      child: SizedBox(
        width:
            math.max(iconSize + padding.horizontal, 44.0), // 최소 44x44 터치 영역 보장
        height: math.max(iconSize + padding.vertical, 44.0),
        child: Center(
          child: Padding(
            padding: padding,
            child: SvgPicture.asset(
              assetPath,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}

/// 원형 아이콘 스타일 설정
class CircleIconConfig {
  static const double buttonSize = 56.0;
  static const double iconSize = 32.0;

  /// 기본 원형 배경 데코레이션
  static BoxDecoration getBaseDecoration(
    BuildContext context, {
    double opacity = 0.1,
    Color? backgroundColor,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: (backgroundColor ?? Theme.of(context).colorScheme.primary)
          .withOpacity(opacity),
    );
  }

  /// 플로팅 액션 버튼용 데코레이션
  static BoxDecoration getFloatingDecoration(BuildContext context) {
    return getBaseDecoration(
      context,
      opacity: 1.0,
    );
  }

  /// 일반 원형 배경용 데코레이션
  static BoxDecoration getDecoration(BuildContext context) {
    return getBaseDecoration(context);
  }

  /// 아이콘 색상 필터
  static ColorFilter getIconColor(BuildContext context, {Color? iconColor}) {
    return ColorFilter.mode(
      iconColor ?? Theme.of(context).colorScheme.primary,
      BlendMode.srcIn,
    );
  }
}

/// ✅ 원형 배경이 있는 아이콘 버튼 위젯
class IconCircleBtn extends StatelessWidget {
  final String iconKey;
  final VoidCallback? onTap;

  const IconCircleBtn({
    super.key,
    required this.iconKey,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
        child: Center(
          child: SvgPicture.asset(
            IconConfig.getIconPath(iconKey),
            width: 32,
            height: 32,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
