import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routers/routers.dart';

@RoutePage()
class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;
    return AutoTabsRouter(
      routes: const [HomeRoute(), UserRoute()],
      builder: (context, child) => Scaffold(
        body: isWideScreen
            ? Row(mainAxisSize: MainAxisSize.max, children: [
                NavigationDrawer(
                  selectedIndex: context.tabsRouter.activeIndex,
                  onDestinationSelected: context.tabsRouter.setActiveIndex,
                  children: const [
                    NavigationDrawerDestination(
                      label: Text('Home'),
                      icon: Icon(Icons.home),
                    ),
                    NavigationDrawerDestination(
                      label: Text('Users'),
                      icon: Icon(Icons.person),
                    ),
                  ],
                ),
                Flexible(child: child)
              ])
            : child,
        bottomNavigationBar: !isWideScreen
            ? NavigationBar(
                selectedIndex: context.tabsRouter.activeIndex,
                onDestinationSelected: context.tabsRouter.setActiveIndex,
                destinations: const [
                  NavigationDestination(
                    label: 'Home',
                    icon: Icon(Icons.home),
                  ),
                  NavigationDestination(
                    label: 'Users',
                    icon: Icon(Icons.person),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
