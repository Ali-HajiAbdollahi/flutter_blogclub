import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blogclub/article.dart';
import 'package:flutter_blogclub/gen/fonts.gen.dart';
import 'package:flutter_blogclub/splash.dart';

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
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
          surfaceTintColor: Colors.white
        ),
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Color(0xffFBFCFF),
          onSurface: primaryTextColor,
          surfaceContainer: Colors.white,
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
      /* home: Stack(
        children: [
          Positioned.fill(child: HomeScreen()),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: SafeArea(child: _ButtonNavigation()),
          ),
        ],
      ), */
      home: const ArticleScreen(),
    );
  }
}

class _ButtonNavigation extends StatelessWidget {
  /*   final String buttonIconFileName;
  final String buttonText; */

  const _ButtonNavigation(
    /*{super.key, required this.buttonIconFileName, required this.buttonText}*/
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  _ButtonNavigationItem(
                    iconFileName: "Home.png",
                    title: "Home",
                    activeIconFileName: "",
                  ),
                  _ButtonNavigationItem(
                    iconFileName: "Articles.png",
                    title: "Article",
                    activeIconFileName: "",
                  ),
                  SizedBox(width: 8),
                  _ButtonNavigationItem(
                    iconFileName: "Search.png",
                    title: "Search",
                    activeIconFileName: "",
                  ),
                  _ButtonNavigationItem(
                    iconFileName: "Menu.png",
                    title: "Menu",
                    activeIconFileName: "",
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
    );
  }
}

class _ButtonNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const _ButtonNavigationItem({
    required this.iconFileName,
    required this.title,
    required this.activeIconFileName,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/img/icons/$iconFileName", height: 20, width: 20),
        SizedBox(height: 4),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
