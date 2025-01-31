import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: Text('검색 화면'),);
  }
}
