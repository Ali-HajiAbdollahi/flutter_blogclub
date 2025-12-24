import 'package:flutter/material.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/onBording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const OnBordingScreen();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.cover),
            ),
            Center(child: Assets.img.icons.logo.svg()),
          ],
        ),
      ),
    );
  }
}
