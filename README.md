# Flutter Starter Firebase

>Base for Flutter + Firebase projects

[![Flutter Starter](https://github.com/C4co/flutter_starter/actions/workflows/dart.yml/badge.svg)](https://github.com/C4co/flutter_starter/actions/workflows/dart.yml)

## Clone

```
gh repo clone C4co/flutter_starter_firebase app_name
```

## Configure Firebase
```
flutterfire configure
```

## Layers

- **components**: shared widgets
- **core**: routes, themes, extras, preferences
- **domain**: entities, contracts
- **notifiers**: global states
- **pages**: apo pages
- **test**: units and widget tests
- **imports**: all imports

## What's inside

- go routes
- json serialize
- shared preferences
- font_awesome_flutter
- intl
- firebase auth

## Commands

Build runner
```
flutter pub run build_runner build --delete-conflicting-outputs
```

Launcher icon
```
flutter pub run flutter_launcher_icons
```

Spash
```
dart run flutter_native_splash:create
```

## Firebase settings

[Authenticating Your Client](https://developers.google.com/android/guides/client-auth)


## License

MIT © [Carlos Costa](https://github.com/C4co)
