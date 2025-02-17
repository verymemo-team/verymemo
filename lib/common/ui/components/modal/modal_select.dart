import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ModalSelect extends StatelessWidget {
  final List<String> options;
  final void Function(String) onSelect;
  final bool isLarge; // 스몰/라지 모드 구분

  const ModalSelect({
    super.key,
    required this.options,
    required this.onSelect,
    this.isLarge = false, // 기본값: 스몰 모드
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600 && !kIsWeb;

    if (isMobile) {
      // 모바일: 모달로 표시
      return Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        child: Container(
          constraints: BoxConstraints(maxHeight: isLarge ? 600 : 400),
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            itemCount: options.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  onSelect(options[index]);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
      );
    } else {
      // PC: 드롭다운으로 표시
      return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 280),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map(
                  (option) => InkWell(
                    onTap: () => onSelect(option),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text(option),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:verymemo/components/atom/title_subtitle.dart';
// import 'package:verymemo/components/buttons/index_buttons.dart';
// import 'package:verymemo/styles/index_styles.dart';

// class ModalPopup extends StatelessWidget with ModalStyle {
//   final String title;
//   final String subtitle;
//   final VoidCallback onConfirm;
//   final VoidCallback onCancel;

//   const ModalPopup({
//     Key? key,
//     required this.title,
//     required this.subtitle,
//     required this.onConfirm,
//     required this.onCancel,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final config = getModalConfig(ModalType.popupSelect);

//     return createModalContainer(
//       type: ModalType.popupSelect,
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // 아이콘 섹션
//           Container(
//             width: 56,
//             height: 56,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//             ),
//             child: Icon(
//               Icons.check_circle,
//               color: Theme.of(context).colorScheme.primary,
//               size: 32,
//             ),
//           ),
//           SizedBox(height: config.verticalSpacing),

//           // 텍스트 섹션
//           TitleSubtitle(
//             title: title,
//             subtitle: subtitle,
//             titleSize: TitleSize.medium,
//             alignment: TitleAlignment.center,
//           ),
//           SizedBox(height: config.verticalSpacing),

//           // 버튼 섹션
//           Column(
//             children: [
//               RoundButton(
//                 text: "확인",
//                 size: BoxSize.medium,
//                 state: RoundButtonState.primary,
//                 onPressed: onConfirm,
//                 isExpanded: true,
//               ),
//               Spacing.vXS,
//               RoundButton(
//                 text: "취소",
//                 size: BoxSize.medium,
//                 onPressed: onCancel,
//                 isExpanded: true,
//                 state: RoundButtonState.secondary,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
