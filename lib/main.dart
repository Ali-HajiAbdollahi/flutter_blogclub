// ignore_for_file: non_constant_identifier_names

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blogclub/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defualtFontFamilly = "Avenir";
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: defualtFontFamilly,
            color: secondaryTextColor,
            fontSize: 18,
          ),
          headlineLarge: TextStyle(
            fontFamily: defualtFontFamilly,
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 24,
          ),
          bodyMedium: TextStyle(
            fontFamily: defualtFontFamilly,
            color: secondaryTextColor,
            fontSize: 12,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).textTheme;
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hi, Jonothon!", style: themeData.titleMedium),
                  Image.asset(
                    "assets/img/icons/notification.png",
                    width: 32,
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text("Explore today’s", style: themeData.headlineLarge),
            ),
            _StoryList(stories: stories, themeData: themeData),
          ],
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({required this.stories, required this.themeData});

  final List<StoryData> stories;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 92,
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(32, 2, 32, 0),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final story = stories[index];
          return (_Story(story: story, themeData: themeData));
        },
      ),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({required this.story, required this.themeData});

  final StoryData story;
  final TextTheme themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(children: [story.isViewed?_unViewedStory():_ViewedStory()]),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/img/icons/${story.iconFileName}",
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(story.name, style: themeData.bodyMedium),
      ],
    );
  }

  Container _unViewedStory() {
    return Container(
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: _StoryProfileImage(),
      ),
    );
  }

  Widget _ViewedStory() {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      width: 68,
      height: 68,
      child: DottedBorder(
        strokeWidth: 2,
        radius: Radius.circular(24),
        borderType: BorderType.RRect,
        color: Color(0xff7B8BB2),
        dashPattern: [8,3],
        padding: EdgeInsets.all(7),
        child: _StoryProfileImage()
      ),
    );
  }

  Widget _StoryProfileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset(
        "assets/img/stories/${story.imageFileName}",
        width: 54,
        height: 54,
      ),
    );
  }
}
