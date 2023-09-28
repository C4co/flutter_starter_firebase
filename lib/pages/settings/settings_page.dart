import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports/app.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _lightTheme = true;

  final ThemeNotifier _themeNotifier = ThemeNotifier();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _lightTheme = _themeNotifier.lightTheme.value;
  }

  leaveApplication(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) {
                context.go('/');
              }
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text(_lightTheme ? 'Light Theme' : 'Dark Theme'),
            trailing: Switch(
              value: _lightTheme,
              thumbIcon: MaterialStateProperty.all(
                Icon(
                  _lightTheme ? Icons.light_mode : Icons.dark_mode,
                  color: _lightTheme
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              onChanged: (bool value) {
                setState(() {
                  _themeNotifier.setLightTheme(value);
                  _lightTheme = value;
                });
              },
            ),
          ),
          const Divider(height: 1),
          ListTile(
            title: const Text('Sign Out'),
            subtitle: Text(user!.email!),
            onTap: () => leaveApplication(context),
            trailing: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
