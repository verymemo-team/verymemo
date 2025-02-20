// import 'package:flutter/material.dart';
// import 'package:verymemo/common/ui/common/app_theme.dart';
// import 'package:verymemo/common/ui/components/list/memo_list/link_list.dart';
// import 'package:verymemo/common/ui/components/list/memo_list/memo_list.dart';
// import 'package:verymemo/common/ui/components/layout/variable_header.dart';
// import 'package:verymemo/common/ui/components/layout/variable_nevbar.dart';
// import 'package:verymemo/common/ui/components/tab/tab_menu.dart';
// import 'package:verymemo/common/ui/components/modal/modal_select.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter UI Test',
//       theme: ThemeData(
//         textTheme: textTheme(context),
//         colorScheme: lightThemeColors(context),
//         useMaterial3: true,
//       ),
//       darkTheme: ThemeData(
//         textTheme: textTheme(context),
//         colorScheme: darkThemeColors(context),
//         useMaterial3: true,
//       ),
//       themeMode: ThemeMode.system,
//       home: const HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               ModalSelect.show(
//                 context: context,
//                 options: const ['옵션 1', '옵션 2', '옵션 3', '옵션 4'],
//                 onSelect: (value) {
//                   debugPrint('선택된 값: $value');
//                 },
//                 isLarge: true,
//               );
//             },
//             child: const Text('모달 셀렉트 테스트'),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _TabMenuDelegate extends SliverPersistentHeaderDelegate {
//   final Function(int)? onTabChanged;

//   _TabMenuDelegate({this.onTabChanged});

//   @override
//   double get minExtent => 40;
//   @override
//   double get maxExtent => 40;

//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     return Container(
//       height: maxExtent,
//       color: Theme.of(context).colorScheme.surface,
//       alignment: Alignment.center,
//       child: TabMenu(onTabChanged: onTabChanged),
//     );
//   }

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }
