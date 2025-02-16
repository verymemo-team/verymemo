part of '../router.dart';

class DetailScaffold extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final GoRouterState state;
  const DetailScaffold({
    super.key,
    required this.navigationShell,
    required this.state,
  });

  @override
  State<DetailScaffold> createState() => _DetailScaffoldState();
}

class _DetailScaffoldState extends State<DetailScaffold> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(true),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: SafeArea(
        child: widget.navigationShell,
      ),
    );
  }
}
