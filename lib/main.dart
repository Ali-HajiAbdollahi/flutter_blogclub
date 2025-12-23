import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blogclub/article.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/gen/fonts.gen.dart';
import 'package:flutter_blogclub/home.dart';
import 'package:flutter_blogclub/profile.dart';
import 'package:flutter_blogclub/splash.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(backgroundColor: primaryColor),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          surfaceTintColor: Colors.white,
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Color(0xffFBFCFF),
          onSurface: primaryTextColor,
          surfaceContainer: Color(0xffE6EAF1),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
              ),
            ),
          ),
        ),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondaryTextColor,
            fontSize: 18,
          ),
          titleLarge: TextStyle(
            color: primaryTextColor,
            fontFamily: FontFamily.avenir,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: primaryTextColor,
            fontFamily: FontFamily.avenir,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: primaryTextColor,
            fontSize: 24,
          ),
          headlineLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 24,
          ),
          bodyLarge: TextStyle(
            fontFamily: FontFamily.avenir,
            color: primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: FontFamily.avenir,
            color: secondaryTextColor,
            fontSize: 12,
          ),
          headlineSmall: TextStyle(
            fontFamily: FontFamily.avenir,
            fontSize: 20,
            color: primaryTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
final double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  List<int> mainNavigatorState = [0];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onWillPop() async {
    final NavigatorState currentSelectedTap =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTap.canPop()) {
      currentSelectedTap.pop();
      return false;
    }
    if (mainNavigatorState.isNotEmpty) {
      setState(() {
        mainNavigatorState.removeLast();
        selectedScreenIndex = mainNavigatorState.last;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(_homeKey, homeIndex, HomeScreen()),
                  _navigator(_articleKey, articleIndex, ArticleScreen()),
                  _navigator(_searchKey, searchIndex, SimpleScreen()),
                  _navigator(_menuKey, menuIndex, ProfileScreen()),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _ButtonNavigation(
                onTap: (int index) {
                  setState(() {
                    selectedScreenIndex = index;
                    mainNavigatorState.remove(index);
                    mainNavigatorState.add(index);
                  });
                },
                selectedScreenIndex: selectedScreenIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(GlobalKey key, int index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
          key: key,
          onGenerateRoute:
              (settings) => MaterialPageRoute(
                builder:
                    (context) => Offstage(
                      offstage: selectedScreenIndex != index,
                      child: child,
                    ),
              ),
        );
  }
}

class _ButtonNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedScreenIndex;
  const _ButtonNavigation({
    super.key,
    required this.onTap,
    required this.selectedScreenIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 85,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0xff2D2D2D).withValues(alpha: 0.14),
                    ),
                    BoxShadow(
                      blurRadius: 20,
                      color: Color(0xff775E62).withValues(alpha: 0.3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(homeIndex);
                        },
                        child: _ButtonNavigationItem(
                          iconFileName:
                              selectedScreenIndex == 0
                                  ? "HomeActive.png"
                                  : "Home.png",
                          title: "Home",
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(articleIndex);
                        },
                        child: _ButtonNavigationItem(
                          iconFileName:
                              selectedScreenIndex == 1
                                  ? "ArticlesActive.png"
                                  : "Articles.png",
                          title: "Article",
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox(width: 8)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(searchIndex);
                        },
                        child: _ButtonNavigationItem(
                          iconFileName:
                              selectedScreenIndex == 2
                                  ? "SearchActive.png"
                                  : "Search.png",
                          title: "Search",
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          onTap(menuIndex);
                        },
                        child: _ButtonNavigationItem(
                          iconFileName:
                              selectedScreenIndex == 3
                                  ? "MenuActive.png"
                                  : "Menu.png",
                          title: "Menu",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.topCenter,
                width: 65,
                height: 85,
                child: Container(
                  height: 65,
                  decoration: BoxDecoration(
                    color: Color(0xff376AED),
                    borderRadius: BorderRadius.circular(32.5),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Image.asset("assets/img/icons/plus.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String title;

  const _ButtonNavigationItem({
    required this.iconFileName,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/icons/$iconFileName", height: 24, width: 24),
        SizedBox(height: 4),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key, this.screenNumber = 1});
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Screen #$screenNumber",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              foregroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.surface,
              ),
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => SimpleScreen(screenNumber: screenNumber + 1),
                ),
              );
            },
            child: Text("Add screen"),
          ),
        ],
      ),
    );
  }
}
