import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config_inputbox.dart';

/// ✅ 인풋 박스 상태 관리 (Riverpod StateNotifier)
class InputBoxNotifier extends StateNotifier<String> {
  InputBoxNotifier() : super('');

  void update(String value) => state = value;
  void clear() => state = '';
}

/// ✅ 프로바이더 선언
final inputBoxProvider = StateNotifierProvider<InputBoxNotifier, String>(
  (ref) => InputBoxNotifier(),
);

/// ✅ `InputBox` 위젯
class InputBox extends ConsumerWidget {
  final String? label; // 라벨
  final String hintText; // 힌트 텍스트
  final InputBoxType type; // 인풋 타입
  final InputBoxSize size; // 인풋 사이즈
  final InputBoxState state; // 인풋 상태
  final TextEditingController? controller; // 컨트롤러 (옵션)
  final void Function(String)? onChanged; // 변경 이벤트 (옵션)
  final VoidCallback? onSubmitted; // 완료 이벤트 (옵션)
  final VoidCallback? onClear; // 클리어 버튼 이벤트
  final VoidCallback? onSearchTap; // 검색 아이콘 클릭 이벤트
  final bool expanded; // 너비 확장 여부를 위한 새로운 속성 추가

  const InputBox({
    super.key,
    this.label,
    required this.hintText,
    this.type = InputBoxType.singleline,
    this.size = InputBoxSize.large,
    this.state = InputBoxState.defaultState,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onSearchTap,
    this.expanded = false, // 너비 확장 여부를 위한 새로운 속성 추가
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // label이 없는 경우 Column 대신 단일 TextField 반환
    if (label == null) {
      return SizedBox(
        height: InputBoxConfig.getHeight(size),
        width: expanded ? double.infinity : null,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: (value) {
            if (type == InputBoxType.singleline) {
              onSearchTap?.call();
            } else {
              onSubmitted?.call();
            }
          },
          decoration:
              InputBoxConfig.getInputDecoration(context, state).copyWith(
            hintText: hintText,
            suffixIcon: type == InputBoxType.singleline
                ? GestureDetector(
                    onTap: onSearchTap,
                    child: InputBoxConfig.buildSuffixIcon(context, state, type),
                  )
                : InputBoxConfig.buildSuffixIcon(context, state, type,
                    onClear: onClear),
          ),
          style: InputBoxConfig.getTextStyle(context, state),
          keyboardType: InputBoxConfig.getTextFieldConfig(
              state: state, type: type)['keyboardType'],
          textInputAction: InputBoxConfig.getTextFieldConfig(
              state: state, type: type)['textInputAction'],
          maxLines: InputBoxConfig.getTextFieldConfig(
              state: state, type: type)['maxLines'],
          enabled: InputBoxConfig.getTextFieldConfig(
              state: state, type: type)['enabled'],
        ),
      );
    }

    // Riverpod 상태 제거하고 컨트롤러만 사용
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: InputBoxConfig.getHeight(size),
          width: expanded ? double.infinity : null,
          child: TextField(
            controller: controller,
            onChanged: onChanged, // 직접 onChanged 호출
            onSubmitted: (value) {
              if (type == InputBoxType.singleline) {
                onSearchTap?.call();
              } else {
                onSubmitted?.call();
              }
            },
            decoration:
                InputBoxConfig.getInputDecoration(context, state).copyWith(
              hintText: hintText,
              suffixIcon: type == InputBoxType.singleline
                  ? GestureDetector(
                      // 수정
                      onTap: onSearchTap, // 검색 아이콘 클릭 이벤트
                      child:
                          InputBoxConfig.buildSuffixIcon(context, state, type),
                    )
                  : InputBoxConfig.buildSuffixIcon(context, state, type,
                      onClear: onClear),
            ),
            style: InputBoxConfig.getTextStyle(context, state),
            keyboardType: InputBoxConfig.getTextFieldConfig(
                state: state, type: type)['keyboardType'],
            textInputAction: InputBoxConfig.getTextFieldConfig(
                state: state, type: type)['textInputAction'],
            maxLines: InputBoxConfig.getTextFieldConfig(
                state: state, type: type)['maxLines'],
            enabled: InputBoxConfig.getTextFieldConfig(
                state: state, type: type)['enabled'],
          ),
        ),
      ],
    );
  }
}
