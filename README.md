# TikTok

一个仿TikTok刷视频的应用

## 运行环境

**************************************************************************************

    [✓] Flutter (Channel stable, 3.22.0, on macOS 14.4.1 23E224 darwin-x64, locale zh-Hans-CN)
        • Flutter version 3.22.0 on channel stable at /Users/xxx/flutter
        • Upstream repository https://github.com/flutter/flutter.git
        • Framework revision 5dcb86f68f (9 days ago), 2024-05-09 07:39:20 -0500
        • Engine revision f6344b75dc
        • Dart version 3.4.0
        • DevTools version 2.34.3
        • Pub download mirror https://pub.flutter-io.cn

    [✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
        • Android SDK at /Users/xxx/Library/Android/sdk
        • Platform android-34, build-tools 34.0.0
        • ANDROID_HOME = /Users/xxx/Library/Android/sdk
        • Java binary at: /Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/java
        • Java version OpenJDK Runtime Environment (build 17.0.9+0-17.0.9b1087.7-11185874)
        • All Android licenses accepted.

    [✓] Xcode - develop for iOS and macOS (Xcode 15.4)
        • Xcode at /Applications/Xcode.app/Contents/Developer
        • Build 15F31d
        • CocoaPods version 1.15.2

    [✓] Chrome - develop for the web
        • Chrome at /Applications/Google Chrome.app/Contents/MacOS/Google Chrome

    [✓] Android Studio (version 2023.2)
        • Android Studio at /Applications/Android Studio.app/Contents
        • Flutter plugin can be installed from:
            🔨 https://plugins.jetbrains.com/plugin/9212-flutter
        • Dart plugin can be installed from:
            🔨 https://plugins.jetbrains.com/plugin/6351-dart
        • Java version OpenJDK Runtime Environment (build 17.0.9+0-17.0.9b1087.7-11185874)

    [✓] VS Code (version 1.85.1)
        • VS Code at /Applications/Visual Studio Code.app/Contents
        • Flutter extension can be installed from:
            🔨 https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

    [✓] Connected device (2 available)
        • macOS (desktop)   • macos    • darwin-x64     • macOS 14.4.1 23E224 darwin-x64
        • Chrome (web)      • chrome   • web-javascript • Google Chrome 125.0.6422.60

    [✓] HTTP Host Availability
        • All required HTTP hosts are available

**************************************************************************************

## Android 包名

    com.example.tiktok

## 打包

- Android

```bash
  flutter clean
  flutter pub get
  flutter build apk --release --no-tree-shake-icons --verbose
```

- iOS

```bash
  flutter clean
  flutter pub get
  flutter build ios --release --no-tree-shake-icons --verbose
```
