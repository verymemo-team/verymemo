import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/common/ui/components/layout/variable_header.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: VariableHeader(
          type: HeaderType.searchBar,
          onBack: () => Navigator.pop(context),
          onSearch: () => debugPrint('Search tapped'),
        ),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('검색 결과가 여기에 표시됩니다'),
        ),
      ),
    );
  }
}
