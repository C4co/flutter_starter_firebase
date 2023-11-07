import 'package:shared_preferences/shared_preferences.dart';
import '/imports/app.dart';

class _SharedPrefs {
  late final SharedPreferences prefs;

  loadPreferences() async {
    prefs = await SharedPreferences.getInstance();

    //get from shared preferences
    final bool? lightTheme = prefs.getBool('lightTheme');
    final bool? welcome = prefs.getBool('welcome');

    if (welcome == null) {
      prefs.setBool('welcome', true);
    }

    // set theme to the theme notifier
    if (lightTheme != null) {
      themeNotifier.lightTheme.value = lightTheme;
    }
  }
}

final sharedPrefs = _SharedPrefs();
