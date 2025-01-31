import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemoFilterNotifier extends StateNotifier<String> {
  MemoFilterNotifier() : super('ALL');  // 초기 상태는 'ALL'

  // 타입을 변경하는 메소드
  void setType(String newType) {
    state = newType;  // 상태를 새로운 타입 값으로 변경
  }
}

// StateNotifierProvider를 통해 상태를 관리
final memoFilterProvider = StateNotifierProvider<MemoFilterNotifier, String>((ref) {
  return MemoFilterNotifier();  // MemoFilterNotifier 인스턴스를 생성
});