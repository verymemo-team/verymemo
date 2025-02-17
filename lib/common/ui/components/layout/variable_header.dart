import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/button/icon_btn.dart';

enum HeaderType { date, logo, content, searchBar, imageviewer }

class HeaderConfig {
  final bool showBackArrow;
  final bool showSearch;
  final bool showSort;
  final bool showMore;
  final bool showDelete;
  final bool showDownload;

  const HeaderConfig({
    this.showBackArrow = false,
    this.showSearch = false,
    this.showSort = false,
    this.showMore = false,
    this.showDelete = false,
    this.showDownload = false,
  });

  static const Map<HeaderType, HeaderConfig> styles = {
    HeaderType.date: HeaderConfig(
      showSort: true,
      showSearch: true,
      showMore: true,
    ),
    HeaderType.logo: HeaderConfig(),
    HeaderType.content: HeaderConfig(showBackArrow: true),
    HeaderType.searchBar: HeaderConfig(showBackArrow: true, showSearch: true),
    HeaderType.imageviewer: HeaderConfig(
      showBackArrow: true,
      showSearch: true,
      showMore: true,
    ),
  };
}

//변수 헤더 위젯
class VariableHeader extends StatelessWidget {
  final HeaderType type;
  final VoidCallback? onBack;
  final VoidCallback? onSearch;
  final VoidCallback? onSort;
  final VoidCallback? onMore;
  final VoidCallback? onDelete;
  final VoidCallback? onDownload;

  const VariableHeader({
    super.key,
    required this.type,
    this.onBack,
    this.onSearch,
    this.onSort,
    this.onMore,
    this.onDelete,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final HeaderConfig config = HeaderConfig.styles[type]!;
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = type == HeaderType.imageviewer
        ? colorScheme.surfaceContainerHighest
        : colorScheme.surface;

    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 56,
        color: backgroundColor,
        child: _buildHeaderContent(config, context),
      ),
    );
  }

  Widget _buildHeaderContent(HeaderConfig config, BuildContext context) {
    switch (type) {
      case HeaderType.date:
        return _dateHeader(config, context);
      case HeaderType.logo:
        return _logoHeader();
      case HeaderType.content:
        return _contentHeader(config, context);
      case HeaderType.searchBar:
        return _searchBarHeader(config, context);
      case HeaderType.imageviewer:
        return _imageViewerHeader(config, context);
    }
  }

  Widget _dateHeader(HeaderConfig config, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "2023.06",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
        ),
        Row(
          children: [
            if (config.showSort)
              IconBtn(
                  iconKey: "sort",
                  onTap: onSort,
                  color: Theme.of(context).colorScheme.onSurface),
            if (config.showSearch)
              IconBtn(
                  iconKey: "search",
                  onTap: onSearch,
                  color: Theme.of(context).colorScheme.onSurface),
            if (config.showMore)
              IconBtn(
                  iconKey: "more",
                  onTap: onMore,
                  color: Theme.of(context).colorScheme.onSurface),
          ],
        ),
      ],
    );
  }

  Widget _logoHeader() {
    return const Center(
      child: Text(
        "VERY MEMO",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _contentHeader(HeaderConfig config, BuildContext context) {
    return Row(
      children: [
        if (config.showBackArrow) IconBtn(iconKey: "back", onTap: onBack),
      ],
    );
  }

  Widget _searchBarHeader(HeaderConfig config, BuildContext context) {
    return Row(
      children: [
        if (config.showBackArrow) IconBtn(iconKey: "back", onTap: onBack),
        Expanded(
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "검색",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconBtn(iconKey: "search", onTap: onSearch),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageViewerHeader(HeaderConfig config, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (config.showDownload)
              IconBtn(iconKey: "download", onTap: onDownload),
            if (config.showDelete) IconBtn(iconKey: "delete", onTap: onDelete),
          ],
        ),
        IconBtn(iconKey: "close", onTap: () {}),
      ],
    );
  }
}
