import 'package:flutter/material.dart';

import '../../search/screens/search_screen.dart';


class MemoHeader extends StatefulWidget {
  final String? date;
  final String? selectedButton;
  final ValueChanged<String?> onChanged;

  const MemoHeader({super.key, this.date, this.selectedButton, required this.onChanged});

  @override
  State<MemoHeader> createState() => _MemoHeaderState();
}

class _MemoHeaderState extends State<MemoHeader> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> buttonList = {
      '전체': 'ALL',
      '북마크': 'BOOKMARK',
      '링크': 'LINK',
      '이미지': 'IMG'
    };
    List<String> buttonColor = [
      '0xffE8E8E8',
      '0xffFFF1F1',
      '0xffF3F1FF',
      '0xffFFF5EA'
    ];

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${DateTime.now()}",
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  IconButton(
                    onPressed: () {},
        icon:const Icon(Icons.abc)
                  ),
                  IconButton(
                    onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const SearchScreen()));},
                      icon:const Icon(Icons.abc)
                  ),
                  IconButton(
                    onPressed: () {},
                      icon:const Icon(Icons.abc)
                  )
                ])
              ]),
          Row(
            children: buttonList.entries.toList().asMap().entries.map((entry) {
              int idx = entry.key; // 현재 인덱스
              String key = entry.value.key; // 버튼 이름
              String value = entry.value.value; // 버튼에 해당하는 값

              return Container(
                padding: EdgeInsets.only(right: 6.0),
                child: FilterChip(
                  label: Text(
                    key, // 버튼 이름으로 수정
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: widget.selectedButton == value
                          ? Colors.white // 선택된 경우 하얀색
                          : const Color(0xff353535), // 기본 글자 색
                    ),
                  ),
                  backgroundColor: Color(int.parse(buttonColor[idx])),
                  selectedColor: Colors.black,
                  selected: widget.selectedButton == value,
                  // 선택된 값에 따라 변경
                  onSelected: (bool selected) {
                    String filter = selected ? value : 'ALL'; // 필터 업데이트
                    widget.onChanged(filter); // onChanged에 필터 전달
                  },
                  side: BorderSide.none,
                  showCheckmark: false,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
