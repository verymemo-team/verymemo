import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/common/ui/components/list/memo_list/link_list.dart
import 'package:verymemo/common/ui/components/list/memo_list/memo_list_model.dart';
import 'package:verymemo/common/ui/components/list/list/list_item.dart';
import 'package:verymemo/common/ui/components/list/list/config_list_item.dart';
import 'package:verymemo/common/ui/common/title_subtitle.dart';
import 'package:verymemo/common/ui/components/button/icon_btn.dart';
=======
import 'package:verymemo/ui/components/list/list/list_item.dart';
import 'package:verymemo/ui/components/list/list/config_list_item.dart';
import 'package:verymemo/ui/common/title_subtitle.dart';
import 'package:verymemo/ui/components/button/icon_btn.dart';
import 'package:verymemo/ui/components/list/memo_list/memo_list_view_model.dart';
>>>>>>> 0f8d0c5 (버튼 스테이트 분리, 리스트 뷰 모델 분리):lib/ui/components/list/memo_list/link_list.dart

class LinkList extends StatelessWidget {
  // final List<MemoListModel> memos;
  final Function(String url)? onLinkTap;

  const LinkList({super.key, this.onLinkTap});

  // List<LinkData> _extractLinks() {
  //   List<LinkData> allLinks = [];
  //   for (var memo in memos) {
  //     if (memo.links != null) {
  //       allLinks.addAll(memo.links!);
  //     }
  //   }
  //   return allLinks;
  // } // 뷰모델로 보냅니다

  @override
  Widget build(BuildContext context) {
    var viewModel = MemoListViewModel();
    final links = viewModel.extractLinks();

    return ListView.builder(
      // padding: const EdgeInsets.symmetric(vertical: 4),
      itemCount: links.length + 2,
      itemBuilder: (context, index) {
        if (index == 0 || index == links.length + 1) {
          return const SizedBox(height: 8);
        }
        final link = links[index - 1];
        return ListItem(
          leadingImageUrl: link.thumbnail,
          title: link.metaTitle ?? link.url,
          subtitle: link.metaDescription ?? '',
          config: const ListItemConfig(
            leadingType: ListItemType.image,
            imageSize: 56,
            imageRadius: 8,
            trailingType: ListItemType.icon,
            trailingIconKey: 'memo',
            trailingIconSize: IconSize.small,
            textConfig: TitleSubtitlePresets.listItem,
          ),
          onTap: () => onLinkTap?.call(link.url),
        );
      },
    );
  }
}
