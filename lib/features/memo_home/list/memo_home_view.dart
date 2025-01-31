import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:verymemo/features/memo_home/component/memo_header.dart';
import 'package:verymemo/features/memo_home/component/memo_keypad.dart';

import '../../../core/providers/memo_filter_provider.dart';
import '../component/memo_bottom_sheet.dart';
import '../component/memo_list_item.dart';
import 'memo_detail_screen.dart';

class MemoHomeView extends ConsumerWidget {
  const MemoHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String memoFilter = ref.watch(memoFilterProvider);
    // 질문 필터를 리스트로
    List<Map<String, dynamic>> memoItems = [
      {
        'memo':
        '엔터치면 줄바꿈이 되고\n업로드 버튼을 누르면 데이터가 바로 뿌려진다\n업로드와 동시에 키패드는 닫힌다\n사진은 첨부하는 즉시 서버에 업로드된다.\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다',
        'imgList': [
          'sample_26.png',
          'sample_27.png',
          'sample_28.png',
          'sample_29.png',
          'sample_30.png',
          'sample_31.png',
        ],
        'date': DateTime.now(),
        'type': ['북마크', '이미지'],
        'tags': [
          '해시태그',
          '해시태그',
          '해시태그',
          '해시태그',
        ]
      },
      {
        'memo': '',
        'imgList': [
          'sample_26.png',
          'sample_27.png',
          'sample_28.png',
          'sample_29.png',
          'sample_30.png',
          'sample_31.png',
        ],
        'date': DateTime.now(),
        'type': ['이미지'],
        'tags': [
          '해시태그',
          '해시태그',
          '해시태그',
          '해시태그',
        ]
      },
      {
        'memo':
        '엔터치면 줄바꿈이 되고\n업로드 버튼을 누르면 데이터가 바로 뿌려진다\n업로드와 동시에 키패드는 닫힌다\n사진은 첨부하는 즉시 서버에 업로드된다.\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다',
        'imgList': [
          'sample_29.png',
          'sample_30.png',
          'sample_31.png',
        ],
        'date': DateTime.now(),
        'type': ['북마크'],
      },
      {
        'memo':
        '엔터치면 줄바꿈이 되고\n업로드 버튼을 누르면 데이터가 바로 뿌려진다\n업로드와 동시에 키패드는 닫힌다\n사진은 첨부하는 즉시 서버에 업로드된다.\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다\n텍스트 패드는 제스쳐로 닫을 수 있다',
        'imgList': [
          'sample_29.png',
          'sample_30.png',
          'sample_31.png',
        ],
        'date': DateTime.now(),
        'type': [''],
      },
    ];

    return Scaffold(
        body: Column(children: [
          MemoHeader(selectedButton: memoFilter,onChanged: (String? value) {

            ref.read(memoFilterProvider.notifier).setType(value!);
          }),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // ref.read(appBarVisibilityProvider.notifier).state = false;
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  builder: (BuildContext context) {
                    return Container(
                      width: 1000,
                      padding: EdgeInsets.only(
                          top: 10.0, left: 12.0, right: 12.0, bottom: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: MemoKeypad()),
                        ],
                      ),
                    );
                  },
                ).then((_) {
                  // ref.read(appBarVisibilityProvider.notifier).state = true;
                });

                await Future.delayed(Duration(seconds: 2)); // 새로고침 시간 시뮬레이션
              },
              child: ListView.builder(
                itemCount: memoItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      memoBottomSheet(context, false);
                    },
                    onDoubleTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const MemoDetailScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10.0),
                      child: (() {
                        switch (memoFilter) {
                          case 'ALL':
                            return MemoListItem(
                              memo: memoItems[index]['memo'],
                              date: DateTime.now(),
                              imgList: memoItems[index]['imgList'],
                              hashtags: memoItems[index]['tags'],
                            );
                          case 'BOOKMARK':
                            return MemoListItem(
                              memo: memoItems[index]['memo'],
                              date: DateTime.now(),
                              imgList: memoItems[index]['imgList'],
                              hashtags: memoItems[index]['tags'],
                            ); // 북마크에 대한 위젯
                          case 'LINK':
                            return Container(); // 링크에 대한 위젯
                          case 'IMG':
                            return Container(); // 이미지에 대한 위젯
                          default:
                            return Container(); // 기본 위젯 (필요시)
                        }
                      })(),
                    ),
                  );
                },
              ),
            ),
          ),
        ]));
  }
}
