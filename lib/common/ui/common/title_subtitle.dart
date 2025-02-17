import 'package:flutter/material.dart';

/// ✅ 타이틀 크기 (소형, 중형, 대형)
enum TitleSize { small, medium, large }

/// ✅ 타이틀 정렬 (왼쪽, 중앙)
enum TitleAlignment { left, center }

/// ✅ 타이틀 & 서브타이틀 설정 (스타일 및 속성)
class TitleSubtitleConfig {
  final TitleSize titleSize;
  final TitleAlignment alignment;
  final bool isExpanded;

  const TitleSubtitleConfig({
    this.titleSize = TitleSize.medium,
    this.alignment = TitleAlignment.left,
    this.isExpanded = false,
  });

  /// 📌 타이틀 스타일 반환
  TextStyle getTitleStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return switch (titleSize) {
      TitleSize.large => textTheme.titleLarge!,
      TitleSize.medium => textTheme.titleMedium!,
      TitleSize.small => textTheme.titleSmall!,
    };
  }

  /// 📌 서브타이틀 스타일 반환
  TextStyle getSubtitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        );
  }

  /// 📌 정렬 방식 반환
  CrossAxisAlignment getCrossAxisAlignment() {
    return alignment == TitleAlignment.left
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
  }
}

/// ✅ 타이틀 & 서브타이틀 위젯
class TitleSubtitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TitleSubtitleConfig config;
  final TextAlign? textAlign;

  const TitleSubtitleWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.config = const TitleSubtitleConfig(),
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: config.getCrossAxisAlignment(),
      mainAxisSize: config.isExpanded ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Text(
          title,
          style: config.getTitleStyle(context),
          textAlign: textAlign,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (subtitle != null) // ✅ 서브타이틀이 있을 경우만 렌더링
          Text(
            subtitle!,
            style: config.getSubtitleStyle(context),
            textAlign: textAlign,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
      ],
    );
  }
}

/// ✅ 타이틀 & 서브타이틀 프리셋 (미리 정의된 스타일)
class TitleSubtitlePresets {
  /// 📌 모달 팝업용
  static const TitleSubtitleConfig modalPopup = TitleSubtitleConfig(
    titleSize: TitleSize.large,
    alignment: TitleAlignment.center,
    isExpanded: true,
  );

  /// 📌 리스트 아이템용
  static const TitleSubtitleConfig listItem = TitleSubtitleConfig(
    titleSize: TitleSize.small,
    alignment: TitleAlignment.left,
    isExpanded: true,
  );
}

// import 'package:flutter/material.dart';

// enum TitleSize { small, medium, large }

// enum TitleAlignment { left, center }

// class TitleSubtitleConfig {
//   final TitleSize titleSize;
//   final TitleAlignment alignment;
//   final bool isExpanded;

//   const TitleSubtitleConfig({
//     this.titleSize = TitleSize.medium,
//     this.alignment = TitleAlignment.left,
//     this.isExpanded = false,
//   });

//   TextStyle getTitleStyle(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     switch (titleSize) {
//       case TitleSize.large:
//         return textTheme.titleLarge!;
//       case TitleSize.medium:
//         return textTheme.titleMedium!;
//       case TitleSize.small:
//         return textTheme.titleSmall!;
//     }
//   }

//   TextStyle getSubtitleStyle(BuildContext context) {
//     return Theme.of(context).textTheme.bodyMedium!;
//   }

//   Widget getTitleSubtitle(
//     BuildContext context, {
//     required String title,
//     required String subtitle,
//     TextAlign? textAlign,
//   }) {
//     return Column(
//       crossAxisAlignment: alignment == TitleAlignment.left
//           ? CrossAxisAlignment.start
//           : CrossAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           style: getTitleStyle(context),
//           textAlign: textAlign,
//         ),
//         Text(
//           subtitle,
//           style: getSubtitleStyle(context),
//           textAlign: textAlign,
//         ),
//       ],
//     );
//   }
// }

// //타이틀 서브타이틀 위젯
// class TitleSubtitleWidget extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final TitleSubtitleConfig config;
//   final TextAlign? textAlign;

//   const TitleSubtitleWidget({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     this.config = const TitleSubtitleConfig(),
//     this.textAlign,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return config.getTitleSubtitle(
//       context,
//       title: title,
//       subtitle: subtitle,
//       textAlign: textAlign,
//     );
//   }
// }

// //타이틀 서브타이틀 프리셋
// extension TitleSubtitlePresets on TitleSubtitleConfig {
//   // 모달 팝업용 프리셋
//   static const modalPopup = TitleSubtitleConfig(
//     titleSize: TitleSize.large,
//     alignment: TitleAlignment.center,
//     isExpanded: true,
//   );

//   // 리스트 아이템용 프리셋
//   static const listItem = TitleSubtitleConfig(
//     titleSize: TitleSize.medium,
//     alignment: TitleAlignment.left,
//     isExpanded: true,
//   );
// }
