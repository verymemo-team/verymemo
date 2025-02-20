import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/input/writing_menu_bar/writing_menu_bar.dart';
import 'package:verymemo/features/memo/presentation/memo_writing_viewmodel.dart';

class WritingView extends StatefulWidget {
  const WritingView({super.key});

  @override
  State<WritingView> createState() => _WritingViewState();
}

class _WritingViewState extends State<WritingView> {
  late final WritingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = WritingViewModel();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
              width: 1.0,
            ),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: viewModel.textController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "내용을 입력하세요...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: const WritingMenuBar(),
            ),
          ],
        ),
      ),
    );
  }
}
