import 'package:flutter/material.dart';
import 'package:verymemo/ui/common/config/config_box_style.dart';

/// ✅ 버튼 상태 정의 (Primary, Secondary, Tertiary 등)
enum RoundBtnState {
  primary,
  secondary,
  tertiary,
  transparent,
  black,
  disabled,
}

/// ✅ 버튼 스타일 컨피그 (색상, 폰트 스타일 등)
class RoundBtnConfig {
  /// 📌 버튼 상태별 색상 매핑
  static (Color, Color) getButtonColors(
    ColorScheme colorScheme,
    RoundBtnState state,
  ) {
    switch (state) {
      case RoundBtnState.secondary:
        return (colorScheme.primaryContainer, colorScheme.onPrimaryContainer);
      case RoundBtnState.tertiary:
        return (colorScheme.tertiary, colorScheme.onSurface);
      case RoundBtnState.disabled:
        return (
          colorScheme.onErrorContainer,
          colorScheme.onSurface.withOpacity(0.5),
        );
      case RoundBtnState.transparent:
        return (Colors.transparent, colorScheme.onSurface);
      case RoundBtnState.black:
        return (colorScheme.inverseSurface, colorScheme.onInverseSurface);
      case RoundBtnState.primary:
      default:
        return (colorScheme.primary, colorScheme.onPrimary);
    }
  }

  /// 📌 버튼 크기별 텍스트 스타일 매핑
  static TextStyle getTextStyle(
    TextTheme textTheme,
    BoxSize size,
    Color color,
  ) {
    switch (size) {
      case BoxSize.extraSmall:
        return textTheme.labelSmall!.copyWith(color: color);
      case BoxSize.small:
        return textTheme.labelMedium!.copyWith(color: color);
      case BoxSize.large:
        return textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: color,
        );
      default:
        return textTheme.labelLarge!.copyWith(
          color: color,
          letterSpacing: -0.5,
        );
    }
  }
}

/// ✅ 라운드 버튼 위젯
class RoundBtn extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final BoxSize size;
  final RoundBtnState state;
  final bool autoDisable;
  final bool isExpanded;

  const RoundBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.size = BoxSize.medium,
    this.state = RoundBtnState.primary,
    this.autoDisable = false,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final RoundBtnState effectiveState = _getEffectiveState();
    final (
      Color backgroundColor,
      Color textColor,
    ) = RoundBtnConfig.getButtonColors(colorScheme, effectiveState);

    final TextStyle textStyle = RoundBtnConfig.getTextStyle(
      textTheme,
      size,
      textColor,
    );

    Widget buttonContent = BoxConfig.createContainer(
      size: size,
      backgroundColor: backgroundColor,
      child: Center(
        child: Text(text ?? "", style: textStyle, textAlign: TextAlign.center),
      ),
    );

    return GestureDetector(
      onTap: effectiveState == RoundBtnState.disabled ? null : onPressed,
      child: isExpanded
          ? SizedBox(width: double.infinity, child: buttonContent)
          : IntrinsicWidth(child: buttonContent),
    );
  }

  /// ✅ 버튼이 자동으로 비활성화되어야 하는 경우를 체크
  RoundBtnState _getEffectiveState() {
    return autoDisable && (text == null || text!.isEmpty || onPressed == null)
        ? RoundBtnState.disabled
        : state;
  }
}

/// ✅ RoundBtn 조합 익스텐션 - 모달 팝업에 사용됨
extension RoundBtnCombination on RoundBtn {
  /// 수직으로 배치된 주요/보조 버튼 조합
  static Column vertical({
    required String primaryText,
    required VoidCallback? onPrimaryPressed,
    required String secondaryText,
    required VoidCallback? onSecondaryPressed,
    double spacing = 8,
  }) {
    return Column(
      children: [
        RoundBtn(
          text: primaryText,
          onPressed: onPrimaryPressed,
          size: BoxSize.medium,
          state: RoundBtnState.primary,
          isExpanded: true,
        ),
        SizedBox(height: spacing),
        RoundBtn(
          text: secondaryText,
          onPressed: onSecondaryPressed,
          size: BoxSize.small,
          state: RoundBtnState.transparent,
          isExpanded: true,
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:verymemo/ui/common/config/config_box_style.dart';

// enum RoundBtnState {
//   primary,
//   secondary,
//   tertiary,
//   transparent,
//   black,
//   disabled
// }

// class RoundBtn extends StatelessWidget {
//   final String? text;
//   final VoidCallback? onPressed;
//   final BoxSize size;
//   final RoundBtnState state;
//   final bool autoDisable;
//   final bool isExpanded;

//   const RoundBtn({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.size = BoxSize.medium,
//     this.state = RoundBtnState.primary,
//     this.autoDisable = false,
//     this.isExpanded = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ColorScheme colorScheme = Theme.of(context).colorScheme;
//     final TextTheme textTheme = Theme.of(context).textTheme;

//     final RoundBtnState effectiveState = _getEffectiveState();
//     final (Color backgroundColor, Color textColor) = _getButtonColors(
//       colorScheme,
//       effectiveState,
//     );

//     final TextStyle textStyle = _getTextStyle(textTheme, textColor);

//     Widget buttonContent = BoxConfig.createContainer(
//       size: size,
//       backgroundColor: backgroundColor,
//       child: Center(
//         child: Text(
//           text ?? "",
//           style: textStyle,
//           textAlign: TextAlign.center,
//         ),
//       ),
//     );

//     return GestureDetector(
//       onTap: effectiveState == RoundBtnState.disabled ? null : onPressed,
//       child: isExpanded
//           ? SizedBox(width: double.infinity, child: buttonContent)
//           : IntrinsicWidth(child: buttonContent),
//     );
//   }

//   RoundBtnState _getEffectiveState() {
//     return autoDisable && (text == null || text!.isEmpty || onPressed == null)
//         ? RoundBtnState.disabled
//         : state;
//   }

//   (Color, Color) _getButtonColors(
//     ColorScheme colorScheme,
//     RoundBtnState effectiveState,
//   ) {
//     switch (effectiveState) {
//       case RoundBtnState.secondary:
//         return (
//           colorScheme.primaryContainer,
//           colorScheme.onPrimaryContainer,
//         );
//       case RoundBtnState.tertiary:
//         return (
//           colorScheme.tertiary,
//           colorScheme.onSurface,
//         );
//       case RoundBtnState.disabled:
//         return (
//           colorScheme.onErrorContainer,
//           colorScheme.onSurface.withOpacity(0.5),
//         );
//       case RoundBtnState.transparent:
//         return (
//           Colors.transparent,
//           colorScheme.onSurface,
//         );
//       case RoundBtnState.black:
//         return (
//           colorScheme.inverseSurface,
//           colorScheme.onInverseSurface,
//         );
//       case RoundBtnState.primary:
//         return (
//           colorScheme.primary,
//           colorScheme.onPrimary,
//         );
//     }
//   }

//   TextStyle _getTextStyle(TextTheme textTheme, Color textColor) {
//     switch (size) {
//       case BoxSize.extraSmall:
//         return textTheme.labelSmall!.copyWith(color: textColor);
//       case BoxSize.small:
//         return textTheme.labelMedium!.copyWith(color: textColor);
//       case BoxSize.large:
//         return textTheme.titleMedium!.copyWith(
//           fontWeight: FontWeight.w500,
//           color: textColor,
//         );
//       default:
//         return textTheme.labelLarge!.copyWith(
//           color: textColor,
//           letterSpacing: -0.5,
//         );
//     }
//   }
// }
