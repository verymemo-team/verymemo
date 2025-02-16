import 'package:flutter/material.dart';
import 'package:verymemo/ui/components/list/memo_list/memo_list_model.dart';
import 'package:verymemo/ui/components/list/list/list_item.dart';
import 'package:verymemo/ui/components/list/list/config_list_item.dart';
import 'package:verymemo/ui/common/title_subtitle.dart';
import 'package:verymemo/ui/components/button/icon_btn.dart';

class LinkList extends StatelessWidget {
  final List<MemoListModel> memos;
  final Function(String url)? onLinkTap;

  const LinkList({super.key, required this.memos, this.onLinkTap});

  List<LinkData> _extractLinks() {
    List<LinkData> allLinks = [];
    for (var memo in memos) {
      if (memo.links != null) {
        allLinks.addAll(memo.links!);
      }
    }
    return allLinks;
  }

  @override
  Widget build(BuildContext context) {
    final links = _extractLinks();

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
