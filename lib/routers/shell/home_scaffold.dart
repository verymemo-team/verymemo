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
  bool _isWritingVisible = false;

  void _showWritingModal(BuildContext context) {
    debugPrint("Opening writing modal...");
    debugPrint("Current _isWritingVisible: $_isWritingVisible");
    setState(() {
      _isWritingVisible = !_isWritingVisible;
    });
    debugPrint("New _isWritingVisible: $_isWritingVisible");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            top: false,
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
              onFloatingButtonTap: () {
                debugPrint("Floating button tapped!");
                _showWritingModal(context);
              },
            ),
          ),
        ),
        if (_isWritingVisible)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: const WritingView(),
          ),
      ],
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
