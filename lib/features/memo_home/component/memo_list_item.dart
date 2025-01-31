import 'package:flutter/material.dart';

class MemoListItem extends StatefulWidget {
  final String memo;
  final DateTime date;
  final List<String>? imgList;
  final List<String>? hashtags;

  MemoListItem({
    required this.memo,
    required this.date,
    required this.imgList,
    required this.hashtags,
  });

  @override
  State<MemoListItem> createState() => _MemoListItemState();
}

class _MemoListItemState extends State<MemoListItem> {
  bool isExpanded = false; // 텍스트 확장 여부
  int islinesCount() {
    int lines = widget.memo.split('\n').length;
    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              // color: Color(0xffF2F2F2),
              color: Color(0xffB9B9B9),
              width: 0.4,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.memo == ''
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.memo, maxLines: isExpanded ? null : 5,
                        // 펼쳐졌을 때는 제한 없음, 아니면 5줄
                        overflow: isExpanded
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      islinesCount() > 5
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded =
                                      !isExpanded; // 버튼을 누를 때 확장 상태를 반전
                                });
                              },
                              child: Text(
                                isExpanded ? '접기' : '더보기',
                                style: const TextStyle(
                                  color: Color(0xffB9B9B9),
                                ),
                              ))
                          : Container(),
                      const SizedBox(height: 4),
                    ],
                  ),
            SizedBox(
              height: 65, // 이미지가 표시될 컨테이너 높이
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.imgList?.length,
                itemBuilder: (context, imageIndex) {
                  return Container(
                    padding: const EdgeInsets.only(right: 10.0), // 이미지 간 간격
                    child: Image.asset(
                      'assets/images/sample/${widget.imgList?[imageIndex]}',
                      width: 65,
                      height: 65,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            widget.hashtags == null || widget.hashtags!.isEmpty
                ? Container()
                : Wrap(
                    spacing: 10.0, // 해시태그 사이 간격
                    runSpacing: 4.0, // 줄 간 간격
                    children: widget.hashtags!.map((hashtag) {
                      return GestureDetector(
                        onTap: () {
                          // 클릭 시 발생하는 이벤트
                          print(hashtag);
                        },
                        child: Text(
                          '#$hashtag',
                          style: TextStyle(
                            color: Color(0xffFF6D75),
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      );
                    }).toList(),
                  ),
            const SizedBox(height: 4),
            Text(
              "${DateTime.now()}",
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xffB9B9B9),
              ),
            ),
          ],
        ));
  }
}
