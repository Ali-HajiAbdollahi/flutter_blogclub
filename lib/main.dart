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
const int searchScreen = 2;
const int menuScreen = 3;
final double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: bottomNavigationHeight,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                const HomeScreen(),
                const ArticleScreen(),
                const SearchScreen(),
                const ProfileScreen(),
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
                });
              },
              selectedScreenIndex: selectedScreenIndex,
            ),
          ),
        ],
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
                          onTap(searchScreen);
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
                          onTap(menuScreen);
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

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "SearchScreen",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
