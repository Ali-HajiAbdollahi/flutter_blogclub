import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      floatingActionButton: Container(
        width: 111,
        height: 48,
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.primary.withValues(alpha: 0.5),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            snackBarMassage(context, "Like button is clicked");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(width: 6),
              Text(
                "2.1k",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: themeData.colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  title: const Text("Articles"),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),

                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        "Four Things Every Woman Needs To Know",
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.img.stories.story9.image(
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Richard Gervain",
                                  style: themeData.textTheme.bodyLarge!
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 4),
                                const Text("2m ago"),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              snackBarMassage(
                                context,
                                "Bookmark button is clicked",
                              );
                            },
                            color: themeData.colorScheme.primary,
                            icon: const Icon(CupertinoIcons.bookmark),
                          ),
                          IconButton(
                            onPressed: () {
                              snackBarMassage(
                                context,
                                "Share button is clicked",
                              );
                            },
                            color: themeData.colorScheme.primary,
                            icon: const Icon(CupertinoIcons.share),
                          ),
                        ],
                      ),
                    ),

                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                      child: Assets.img.background.singlePost.image(),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        "A man’s sexuality is never your mind responsibility.",
                        style: themeData.textTheme.headlineSmall,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: Text(
                        "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex. This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                        style: themeData.textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.sizeOf(context).width,
                height: 116,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      themeData.colorScheme.surface,
                      themeData.colorScheme.surface.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void snackBarMassage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
