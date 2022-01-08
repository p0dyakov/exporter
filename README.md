[![pub package](https://img.shields.io/pub/v/flutter_auto_export.svg)](https://pub.dev/packages/flutter_auto_export)
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


help me if you can:

i`m fork it from https://pub.dev/packages/flutter_auto_export
thanks, but I want to set the file name same to package name(do not use main.dart or auto_export.dart), because that is the reght way to create a package.