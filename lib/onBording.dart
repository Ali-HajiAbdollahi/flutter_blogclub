import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blogclub/data.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surfaceContainer,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      color: Colors.black.withValues(alpha: 0.1),
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 48,
                              right: 48,
                              top: 32,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: themeData.textTheme.headlineSmall,
                                ),
                                SizedBox(height: 24),
                                Text(
                                  items[index].description,
                                  style: themeData.textTheme.titleMedium!.apply(
                                    fontSizeFactor: 0.8,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 48, right: 48),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                dotWidth: 8,
                                dotHeight: 8,
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary
                                    .withValues(alpha: 0.1),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (page == items.length - 1) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomeScreen();
                                      },
                                    ),
                                  );
                                } else {
                                  _pageController.animateToPage(
                                    page + 1,
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.decelerate,
                                  );
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  themeData.colorScheme.primary,
                                ),
                                iconColor: WidgetStateProperty.all(
                                  themeData.colorScheme.onPrimary,
                                ),
                                minimumSize: WidgetStateProperty.all(
                                  Size(88, 60),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              child: Icon(
                                page == items.length - 1
                                    ? CupertinoIcons.check_mark
                                    : CupertinoIcons.arrow_right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
