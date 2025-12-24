import 'package:flutter/material.dart';
import 'package:flutter_blogclub/data.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      backgroundColor: themeData.colorScheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.surfaceContainer.withValues(
          alpha: 0,
        ),
        title: Text("Profile", style: themeData.textTheme.headlineSmall),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: themeData.colorScheme.onSurface.withValues(
                            alpha: 0.1,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8.image(
                                  width: 84,
                                  height: 84,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("@joviedan"),
                                    Text(
                                      "Jovi Daniel",
                                      style: themeData.textTheme.bodyLarge,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "UX Designer",
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                            color:
                                                themeData.colorScheme.primary,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "About me",
                            style: themeData.textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                            style: themeData.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: 32),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 64,
                    left: 64,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          right: 32,
                          left: 32,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 24),
                                  blurRadius: 30,
                                  color: themeData.colorScheme.onSurface
                                      .withValues(alpha: 0.3),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: themeData.colorScheme.primary,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff2151CD),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "52",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        "Post",
                                        style: themeData.textTheme.bodyLarge!
                                            .copyWith(
                                              color:
                                                  themeData
                                                      .colorScheme
                                                      .onPrimary,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "250",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "Following",
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w300,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.5K",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "Follower",
                                      style: themeData.textTheme.bodyLarge!
                                          .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "My Posts",
                              style: themeData.textTheme.headlineSmall,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.grid.svg(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.img.icons.table.svg(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
