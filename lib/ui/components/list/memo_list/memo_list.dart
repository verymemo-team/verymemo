import 'package:flutter/material.dart';
import 'package:verymemo/ui/components/list/pofile_list/profile_list.dart';
import 'memo_list_model.dart';
import 'molicure/index_memo_list_component.dart';

class MemoList extends StatelessWidget {
  const MemoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: MemoListModel.sampleMemoList.length,
      itemBuilder: (context, index) {
        final memo = MemoListModel.sampleMemoList[index];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            if (!memo.isLocalMemo) //서버에서 받아온 메모만 프로필 표시
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProfileList(
                  profileImageUrl: memo.profileImageUrl,
                  userName: memo.userName ?? '',
                  description: memo.description ?? '',
                ),
              ),
            const SizedBox(height: 4),
            if (memo.memoContent != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MemoContent(text: memo.memoContent!),
              ),
            const SizedBox(height: 4),
            if (memo.imageUrls != null && memo.imageUrls!.isNotEmpty)
              MemoImages(imageUrls: memo.imageUrls!),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MemoFooter(createdAt: memo.date),
            ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
          ],
        );
      },
    );
  }
}
