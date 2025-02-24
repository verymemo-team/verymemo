import 'package:flutter/material.dart';

/// ✅ 인풋 박스 타입 정의
enum InputBoxType { normal, validation, search }

/// ✅ 인풋 박스 상태 정의
enum InputBoxState { defaultState, success, error, disabled }

/// ✅ 인풋 박스 사이즈 정의
enum InputBoxSize { medium, large }

class InputBoxConfig {
  /// 📌 인풋 박스 테두리 스타일
  static OutlineInputBorder borderStyle(
    BuildContext context,
    InputBoxState state,
  ) {
    // 기본 테두리 스타일
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.transparent),
    );

    // 상태에 따른 테두리 스타일 오버라이드
    switch (state) {
      case InputBoxState.error:
        return defaultBorder.copyWith(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        );
      default:
        return defaultBorder;
    }
  }

  /// 📌 텍스트 스타일 설정
  static TextStyle getTextStyle(
    BuildContext context,
    InputBoxState state,
  ) {
    // 기본 텍스트 스타일
    final defaultStyle = Theme.of(context).textTheme.labelMedium!;

    // 상태에 따른 텍스트 스타일 오버라이드
    switch (state) {
      case InputBoxState.disabled:
        return defaultStyle.copyWith(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        );
      default:
        return defaultStyle;
    }
  }

  /// 📌 인풋 박스 테두리 스타일
  static InputDecoration getDecoration({
    required BuildContext context,
    required InputBoxState state,
    required InputBoxType type,
    String? hintText,
    required InputBoxSize size,
    VoidCallback? onClear,
  }) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      // disabled 상태일 때 배경색 처리
      fillColor: state == InputBoxState.disabled
          ? Theme.of(context).disabledColor.withOpacity(0.1)
          : Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      // 테두리 스타일 직접 정의
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: state == InputBoxState.error
              ? Theme.of(context).colorScheme.error
              : Colors.transparent,
          width: state == InputBoxState.error ? 2 : 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: state == InputBoxState.error
              ? Theme.of(context).colorScheme.error
              : Colors.transparent,
          width: state == InputBoxState.error ? 2 : 1,
        ),
      ),
      suffixIcon: _buildSuffixIcon(state, type, onClear),
      // 힌트 텍스트 스타일
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: state == InputBoxState.disabled
                ? Theme.of(context).disabledColor
                : Theme.of(context).hintColor,
          ),
    );
  }

  /// 📌 인풋 박스 오른쪽 아이콘 (검색 / 유효성 체크)
  static Widget? _buildSuffixIcon(
      InputBoxState state, InputBoxType type, VoidCallback? onClear) {
    if (state == InputBoxState.error) {
      return const Icon(Icons.close, color: Colors.red);
    } else if (state == InputBoxState.success) {
      return const Icon(Icons.check, color: Colors.red);
    } else if (type == InputBoxType.search) {
      return const Icon(Icons.search, color: Colors.black);
    }
    return onClear != null
        ? GestureDetector(
            onTap: onClear,
            child: const Icon(Icons.clear, color: Colors.grey),
          )
        : null;
  }

  /// 📌 사이즈별 높이 값 반환
  static double getHeight(InputBoxSize size) {
    switch (size) {
      case InputBoxSize.medium:
        return 48.0;
      case InputBoxSize.large:
        return 56.0;
    }
  }

  /// 📌 텍스트필드 설정
  static Map<String, dynamic> getTextFieldConfig({
    required InputBoxState state,
    required InputBoxType type,
  }) {
    return {
      'maxLines': type == InputBoxType.normal ? null : 1,
      'keyboardType': _getKeyboardType(type),
      'textInputAction': _getTextInputAction(type),
      'enabled': state != InputBoxState.disabled,
    };
  }

  /// 📌 키보드 타입 설정
  static TextInputType _getKeyboardType(InputBoxType type) {
    switch (type) {
      case InputBoxType.search:
        return TextInputType.text;
      case InputBoxType.normal:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }

  /// 📌 텍스트 입력 액션 설정
  static TextInputAction _getTextInputAction(InputBoxType type) {
    switch (type) {
      case InputBoxType.search:
        return TextInputAction.search;
      case InputBoxType.normal:
        return TextInputAction.newline;
      default:
        return TextInputAction.done;
    }
  }
}
