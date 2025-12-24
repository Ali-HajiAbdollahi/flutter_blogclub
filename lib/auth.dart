import 'package:flutter/material.dart';
import 'package:flutter_blogclub/data.dart';
import 'package:flutter_blogclub/gen/assets.gen.dart';
import 'package:flutter_blogclub/gen/fonts.gen.dart';
import 'package:flutter_blogclub/main.dart';

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
    final tapTextTheme = const TextStyle(
      color: Colors.white,
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
                  borderRadius: const BorderRadius.only(
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
                          borderRadius: const BorderRadius.only(
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

class _Login extends StatefulWidget {
  const _Login({required this.themeData});

  final ThemeData themeData;

  @override
  State<_Login> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final username = _usernameController.text.trim().toUpperCase();
    final password = _passwordController.text.trim();

    // Get login credentials from database
    final loginItems = AppDatabase.loginItems;

    // Check if credentials match
    final isValid = loginItems.any(
      (login) => login.username == username && login.password == password,
    );

    if (isValid) {
      // Navigate to home page
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: const TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "sign in with your account",
          style: widget.themeData.textTheme.titleMedium!.apply(
            fontSizeFactor: 0.85,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: widget.themeData.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.themeData.colorScheme.primary.withValues(
                alpha: 0.3,
              ),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: widget.themeData.colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Demo Credentials",
                      style: TextStyle(
                        fontFamily: FontFamily.avenir,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: widget.themeData.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Username: Ali  |  Password: 1234",
                      style: TextStyle(
                        fontFamily: FontFamily.avenir,
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(label: Text("Username")),
        ),
        _PasswordTextField(controller: _passwordController),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            backgroundColor: WidgetStatePropertyAll(
              widget.themeData.colorScheme.primary,
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: _handleLogin,
          child: Text("login".toUpperCase()),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot your password?"),
            TextButton(onPressed: () {}, child: const Text("Reset here")),
          ],
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            "or sign in with".toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({required this.themeData});

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to Blog Club",
          style: const TextStyle(
            fontFamily: FontFamily.avenir,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Please enter your information",
          style: themeData.textTheme.titleMedium!.apply(fontSizeFactor: 0.85),
        ),
        const SizedBox(height: 16),
        const TextField(decoration: InputDecoration(label: Text("Fullname"))),
        const TextField(decoration: InputDecoration(label: Text("Username"))),

        const _PasswordTextField(),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            backgroundColor: WidgetStatePropertyAll(
              themeData.colorScheme.primary,
            ),
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: () {},
          child: Text("sign up".toUpperCase()),
        ),
        const SizedBox(height: 32),
        Center(
          child: Text(
            "or sign up with".toUpperCase(),
            style: const TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.facebook.image(width: 36, height: 36),
            const SizedBox(width: 24),
            Assets.img.icons.twitter.image(width: 36, height: 36),
          ],
        ),
      ],
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  const _PasswordTextField({this.controller});

  final TextEditingController? controller;

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,

      decoration: InputDecoration(
        label: const Text("Password"),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child:
              obscureText
                  ? const Text("Show", style: TextStyle(fontSize: 14))
                  : const Text("Hide", style: TextStyle(fontSize: 14)),
        ),
      ),
    );
  }
}
