import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/common/ui/components/input/inputbox/inputbox.dart';
import 'package:verymemo/common/ui/components/input/inputbox/config_inputbox.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              InputBox(
                hintText: "검색어를 입력하세요",
                type: InputBoxType.singleline,
                size: InputBoxSize.small,
                onChanged: (value) => debugPrint('Search: $value'),
                onSubmitted: () => debugPrint('Search submitted'),
                onClear: () => debugPrint('Search cleared'),
                onSearchTap: () => debugPrint('Search icon tapped'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
