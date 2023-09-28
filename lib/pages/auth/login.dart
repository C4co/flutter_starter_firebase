import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '/imports/app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  continueWithGoogle() async {
    final result = await AuthService.signInWithGoogle();

    if (context.mounted) {
      if (result == 'Welcome!') {
        context.go('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            action: SnackBarAction(
              label: "😧",
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                children: [
                  Lottie.asset(
                    Assets.rocket,
                    width: 250,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Start with Firebase',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This project starts with Firebase Authentication and Firestore',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            //google button
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(
                  size: 18,
                  FontAwesomeIcons.google,
                ),
                label: const Text(
                  'Sign in with Google',
                ),
                onPressed: () {
                  continueWithGoogle();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
