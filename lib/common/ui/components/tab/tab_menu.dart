import 'package:flutter/material.dart';
import 'package:verymemo/common/ui/components/button/round_btn.dart';
import 'package:verymemo/common/ui/common/config/config_box_style.dart';

class TabMenu extends StatefulWidget {
  final Function(int)? onTabChanged;

  const TabMenu({super.key, this.onTabChanged});

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  final List<String> _tabs = const ['전체', '북마크', '이미지', '링크'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      color: Theme.of(context).colorScheme.surface,
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            _tabs.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 0 : 8.0,
                right: index == _tabs.length - 1 ? 0 : 0,
              ),
              child: RoundBtn(
                text: _tabs[index],
                size: BoxSize.extraSmall,
                state: _selectedIndex == index
                    ? RoundBtnState.black
                    : RoundBtnState.tertiary,
                onPressed: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onTabChanged?.call(_selectedIndex);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
