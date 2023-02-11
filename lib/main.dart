import 'package:flutter/cupertino.dart';

import 'cart.dart';
import 'home.dart';
import 'search.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.white,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.inactiveGray.withOpacity(0.2),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.search)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart)),
          ],
        ),
        tabBuilder: (context, i) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                  backgroundColor: CupertinoColors.white,
                  child: (i == 0)
                      ? HomePage()
                      : (i == 1)
                          ? Search()
                          : Cart());
            },
          );
        },
      ),
    );
  }
}
