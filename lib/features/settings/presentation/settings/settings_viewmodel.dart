import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>((ref) {
  return SettingsViewModel();
});

class SettingsState {
  final bool isKeypadEnabled;
  // 필요한 다른 설정들...

  SettingsState({
    this.isKeypadEnabled = false,
  });

  SettingsState copyWith({
    bool? isKeypadEnabled,
  }) {
    return SettingsState(
      isKeypadEnabled: isKeypadEnabled ?? this.isKeypadEnabled,
    );
  }
}

class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel() : super(SettingsState());

  void toggleKeypad(bool value) {
    state = state.copyWith(isKeypadEnabled: value);
    // TODO: 필요한 경우 저장 로직 추가
  }
}
