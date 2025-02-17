part of '../router.dart';

class HomeScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GoRouterState state;
  const HomeScaffold({
    super.key,
    required this.navigationShell,
    required this.state,
  });

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  final NavigationBarType _currentNavBar = NavigationBarType.home;
  int _selectedIndex = 0;
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: VariableHeader(
                type: widget.navigationShell.currentIndex == 0
                    ? HeaderType.date
                    : HeaderType.logo,
                onSort: () => debugPrint("정렬 클릭"),
                onSearch: () => debugPrint("검색 클릭"),
                onMore: () => debugPrint("더보기 클릭"),
                onBack: () => debugPrint("뒤로 가기 클릭"),
              ),
            ),
            if (widget.navigationShell.currentIndex == 0) ...[
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabMenuDelegate(
                  onTabChanged: (index) {
                    setState(() {
                      _currentTabIndex = index;
                      log("---> _currentTabIndex: $_currentTabIndex");
                      log("---> _selectedIntex: $_selectedIndex");
                    });
                  },
                  // onTabChanged: _goBranch,
                ),
              ),
            ],
            const SliverToBoxAdapter(child: Divider(height: 1)),
            SliverFillRemaining(
              child: _currentTabIndex == 3 &&
                      widget.navigationShell.currentIndex == 0
                  ? const LinkList()
                  : widget.navigationShell,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false, // 상단은 SafeArea 적용 안 함
        child: VariableNavigationBar(
          type: _currentNavBar,
          selectedIndex: widget.navigationShell.currentIndex,
          onItemSelected: (index) {
            setState(() {
              _selectedIndex = index;
              _goBranch(_selectedIndex);
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
