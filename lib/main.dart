import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:verymemo/common/ui/common/app_theme.dart';
import 'package:verymemo/common/ui/components/list/memo_list/link_list.dart';
import 'package:verymemo/common/ui/components/list/memo_list/memo_list_model.dart';
import 'package:verymemo/common/ui/components/list/memo_list/memo_list.dart';
import 'package:verymemo/common/ui/components/layout/variable_header.dart';
import 'package:verymemo/common/ui/components/layout/variable_nevbar.dart';
import 'package:verymemo/common/ui/components/tab/tab_menu.dart';
=======
import 'package:verymemo/ui/common/app_theme.dart';
import 'package:verymemo/ui/components/list/memo_list/link_list.dart';
import 'package:verymemo/ui/components/list/memo_list/memo_list.dart';
import 'package:verymemo/ui/components/layout/variable_header.dart';
import 'package:verymemo/ui/components/layout/variable_nevbar.dart';
import 'package:verymemo/ui/components/tab/tab_menu.dart';
>>>>>>> 0f8d0c5 (버튼 스테이트 분리, 리스트 뷰 모델 분리)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Test',
      theme: ThemeData(
        textTheme: textTheme(context),
        colorScheme: lightThemeColors(context),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: textTheme(context),
        colorScheme: darkThemeColors(context),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationBarType _currentNavBar = NavigationBarType.home;
  int _selectedIndex = 0;
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: VariableHeader(
                type: HeaderType.date,
                onSort: () => debugPrint("정렬 클릭"),
                onSearch: () => debugPrint("검색 클릭"),
                onMore: () => debugPrint("더보기 클릭"),
                onBack: () => debugPrint("뒤로 가기 클릭"),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabMenuDelegate(
                onTabChanged: (index) {
                  setState(() {
                    _currentTabIndex = index;
                  });
                },
              ),
            ),
            const SliverToBoxAdapter(child: Divider(height: 1)),
            SliverFillRemaining(
              child:
                  _currentTabIndex == 3 ? const LinkList() : const MemoList(),
            ),
          ],
        ),
      ),

      // ✅ UI 테스트용 네비게이션 바 (라우터 없이 UI만 변경)
      bottomNavigationBar: SafeArea(
        top: false, // 상단은 SafeArea 적용 안 함
        child: VariableNavigationBar(
          type: _currentNavBar,
          selectedIndex: _selectedIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
              debugPrint("선택된 네비게이션 아이콘 인덱스: $_selectedIndex");
            });
          },
        ),
      ),
    );
  }
}

class _TabMenuDelegate extends SliverPersistentHeaderDelegate {
  final Function(int)? onTabChanged;

  _TabMenuDelegate({this.onTabChanged});

  @override
  double get minExtent => 40;
  @override
  double get maxExtent => 40;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: maxExtent,
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      child: TabMenu(onTabChanged: onTabChanged),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
