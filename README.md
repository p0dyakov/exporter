[![pub package](https://img.shields.io/pub/v/auto_exporter.svg)](https://pub.dev/packages/auto_exporter)
# Auto Exporter

A new Flutter package that allows you to auto export types globally.

## Getting Started

To use auto export feature, you just need to add the `@AutoExporter()` annotation to your class that you want to be automatically exported in the `lib/main.dart` file.

Then in your other files, you just need to import the `main.dart` file to have access to all auto exported files

## how to use it ?

first:
```
dev_dependencies:
  build_runner: ^2.1.0
  build_test: ^2.1.0
```

second run:
```
 dart run build_runner build  # Dart SDK
 flutter pub run build_runner build  # Flutter SDK
```
