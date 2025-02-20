import 'package:flutter/material.dart';

class WritingViewModel extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
