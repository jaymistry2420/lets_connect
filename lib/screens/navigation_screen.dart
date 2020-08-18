import 'package:flutter/material.dart';
import 'package:lets_connect/data/data.dart';
import 'package:lets_connect/screens/screens.dart';
import 'package:lets_connect/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        appBar: Responsive.isDesktop(context)
            ? (PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                    currentUser: currentUser,
                    icon: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => {
                          setState(() => {_selectedIndex = index}),
                        }),
              ))
            : null,
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CustomTabBar(
                    icons: _icons,
                    selectedIndex: _selectedIndex,
                    onTap: (index) => {
                          setState(() => {_selectedIndex = index}),
                        }),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
