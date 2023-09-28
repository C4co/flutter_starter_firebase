import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import '/imports/app.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginPage();
      },
      redirect: (context, state) {
        try {
          User? user = FirebaseAuth.instance.currentUser;
          user?.reload();

          if (user == null) {
            return '/';
          }

          return '/home';
        } catch (e) {
          return '/';
        }
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
