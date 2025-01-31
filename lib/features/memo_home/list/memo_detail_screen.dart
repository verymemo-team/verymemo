import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../component/memo_detail_body.dart';

class MemoDetailScreen extends ConsumerWidget {
  const MemoDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        print("Did Pop: $didPop");
        print("Returned Result: $result");
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(''),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.abc)
                )
            ],
          ),
          body: Center(
            child: MemoDetailBody()
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon:const Icon(Icons.abc)
                ),
                IconButton(
                  onPressed: () {},
                    icon:const Icon(Icons.abc)
                ),
                IconButton(
                  onPressed: () {},
                    icon:const Icon(Icons.abc)
                ),
                IconButton(
                  onPressed: () {},
                    icon:const Icon(Icons.abc)
                ),
              ],
            ),
          )),
    );
  }
}
