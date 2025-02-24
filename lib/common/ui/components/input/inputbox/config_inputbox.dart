import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/button/icon_btn.dart';

/// ✅ 인풋 박스 타입 정의
enum InputBoxType { singleline, multiline }

/// ✅ 인풋 박스 상태 정의
enum InputBoxState { defaultState, success, error, done, disabled }

/// ✅ 인풋 박스 사이즈 정의
enum InputBoxSize { small, large }

class InputBoxConfig {
  /// 📌 인풋 박스 높이 반환 (small: 48, large: 56)
  static double getHeight(InputBoxSize size) {
    return size == InputBoxSize.large ? 56.0 : 48.0;
  }

  /// 📌 인풋 박스 테두리 스타일 (`inputDecorationTheme` 활용)
  static OutlineInputBorder borderStyle(
      BuildContext context, InputBoxState state) {
    final theme = Theme.of(context).inputDecorationTheme;
    return state == InputBoxState.error
        ? theme.errorBorder as OutlineInputBorder // ✅ 전역 설정 재사용
        : theme.enabledBorder as OutlineInputBorder;
  }

  /// 📌 텍스트 스타일 설정
  static TextStyle getTextStyle(BuildContext context, InputBoxState state) {
    return Theme.of(context).textTheme.labelLarge?.copyWith(
              color: state == InputBoxState.disabled
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).colorScheme.onSurface,
            ) ??
        const TextStyle(); // null일 경우 기본 스타일 제공
  }

  /// 📌 테마 기반으로 `InputDecoration` 설정
  static InputDecoration getInputDecoration(
      BuildContext context, InputBoxState state) {
    final theme = Theme.of(context).inputDecorationTheme;
    return InputDecoration(
      // theme의 속성들을 복사
      fillColor: state == InputBoxState.disabled
          ? Theme.of(context).disabledColor.withOpacity(0.1)
          : theme.fillColor,
      border: theme.border,
      enabledBorder: theme.enabledBorder,
      errorBorder: theme.errorBorder,
      hintStyle: theme.hintStyle,
      contentPadding: theme.contentPadding,
    );
  }

  /// 📌 오른쪽 아이콘 설정
  static Widget? buildSuffixIcon(
      BuildContext context, InputBoxState state, InputBoxType type,
      {VoidCallback? onClear}) {
    final theme = Theme.of(context);
    switch (state) {
      case InputBoxState.error:
        return IconBtn(iconKey: "close", color: theme.colorScheme.error);
      case InputBoxState.success:
        return IconBtn(iconKey: "check", color: theme.colorScheme.primary);
      default:
        return type == InputBoxType.singleline
            ? IconBtn(iconKey: "search", color: theme.colorScheme.onSurface)
            : onClear != null
                ? IconBtn(
                    iconKey: "close",
                    color: theme.colorScheme.onSurface,
                    onTap: onClear,
                  )
                : null;
    }
  }

  /// 📌 `TextField` 기본 설정
  static Map<String, dynamic> getTextFieldConfig({
    required InputBoxState state,
    required InputBoxType type,
  }) {
    return {
      'maxLines': type == InputBoxType.singleline ? 2 : null,
      'keyboardType': type == InputBoxType.singleline
          ? TextInputType.text
          : TextInputType.multiline,
      'textInputAction': type == InputBoxType.singleline
          ? TextInputAction.search
          : TextInputAction.newline,
      'enabled': state != InputBoxState.disabled,
    };
  }
}
