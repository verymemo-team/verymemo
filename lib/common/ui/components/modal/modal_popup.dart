import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/button/round_btn.dart';
import 'package:verymemo/common/ui/common/title_subtitle.dart';
import 'package:verymemo/common/ui/components/button/icon_btn.dart';

class ModalPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ModalPopup({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 아이콘 섹션
            IconCircleBtn(iconKey: 'check', onTap: () {}),
            const SizedBox(height: 12),

            // 텍스트 섹션
            TitleSubtitleWidget(
              title: title,
              subtitle: subtitle,
              config: TitleSubtitlePresets.modalPopup,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // 버튼 섹션
            RoundBtnCombination.vertical(
              primaryText: "확인",
              onPrimaryPressed: onConfirm,
              secondaryText: "취소",
              onSecondaryPressed: onCancel,
            ),
          ],
        ),
      ),
    );
  }
}
