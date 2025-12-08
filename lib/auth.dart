import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/gen/fonts.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool screenTarget = true; // true = login --- false = sign up

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tapTextTheme = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.w700,
      fontFamily: FontFamily.avenir,
      fontSize: 18,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Assets.img.icons.logo.svg(width: 120, height: 60),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                screenTarget = true;
                              });
                            },
                            child: Text(
                              "Login".toUpperCase(),
                              style:
                                  screenTarget
                                      ? tapTextTheme
                                      : tapTextTheme.apply(
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                screenTarget = false;
                              });
                            },
                            child: Text(
                              "Sign up".toUpperCase(),
                              style:
                                  screenTarget
                                      ? tapTextTheme.apply(
                                        color: Colors.white.withValues(
                                          alpha: 0.5,
                                        ),
                                      )
                                      : tapTextTheme,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.surface,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(32, 48, 32, 32),
                            child:
                                screenTarget
                                    ? _Login(themeData: themeData)
                                    : _SignUp(themeData: themeData),
                          ),
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

class _Login extends StatelessWidget {
  const _Login({super.key, required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "sign in with your account",
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.85),
        ),
        SizedBox(height: 16),
        TextField(decoration: InputDecoration(label: Text("Username"))),

        _PasswordTextField(),
        SizedBox(height: 32),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            backgroundColor: WidgetStatePropertyAll(
              themeData.colorScheme.primary,
            ),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: () {},
          child: Text("login".toUpperCase()),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot your password?"),
            TextButton(onPressed: () {}, child: Text("Reset here")),
          ],
        ),
        SizedBox(height: 16),
        Center(
          child: Text(
            "or sign in with".toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
        
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({super.key, required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Blog Club",
          style: TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Please enter your information",
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.85),
        ),
        SizedBox(height: 16),
        TextField(decoration: InputDecoration(label: Text("Fullname"))),
        TextField(decoration: InputDecoration(label: Text("Username"))),

        _PasswordTextField(),
        SizedBox(height: 32),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            backgroundColor: WidgetStatePropertyAll(
              themeData.colorScheme.primary,
            ),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: () {},
          child: Text("sign up".toUpperCase()),
        ),
        SizedBox(height: 32),
        Center(
          child: Text(
            "or sign up with".toUpperCase(),
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({super.key});

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,

      decoration: InputDecoration(
        label: Text("Password"),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child:
              obscureText
                  ? Text(
                    "Show",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                  : Text(
                    "Hide",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
        ),
      ),
    );
  }
}
