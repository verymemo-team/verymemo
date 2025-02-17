import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/common/ui/components/list/memo_list/memo_list.dart';

class MemoHomeView extends ConsumerStatefulWidget {
  const MemoHomeView({super.key});

  @override
  ConsumerState<MemoHomeView> createState() => _MemoHomeViewState();
}

class _MemoHomeViewState extends ConsumerState<MemoHomeView> {
  @override
  Widget build(BuildContext context) {
    return MemoList();
  }
}
