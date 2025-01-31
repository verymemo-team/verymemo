import 'package:flutter/material.dart';

void memoBottomSheet(BuildContext context, bool isPublic) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // 수정 로직
                Navigator.pop(context); // 모달 닫기
              },
              child: Text('수정',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 삭제 로직
                Navigator.pop(context);
              },
              child: Text('삭제',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 북마크 로직
                Navigator.pop(context);
              },
              child: Text('북마크',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 공유 로직
                Navigator.pop(context);
              },
              child: Text('공유',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // 공개/비공개 전환 로직
                Navigator.pop(context);
              },
              child: Text(isPublic ? '나만 보기' : '공개',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      );
    },
  );
}
