import 'dart:async';

import 'package:auto_exporter/src/exports_builder.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

/// visit all files to remember they path
class ExporterGeneratorBuilder implements Builder {
  @override
  final buildExtensions = const {
    '.dart': ['.exports']
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final resolver = buildStep.resolver;
    if (!await resolver.isLibrary(buildStep.inputId)) return;
    final lib = LibraryReader(await buildStep.inputLibrary);
    // final exportAnnotation = TypeChecker.fromRuntime(AutoExporter);
    final annotated = [
      for (var member in lib.allElements) {member.name},
    ];
    if (annotated.isNotEmpty) {
      ExportsBuilder.packageName = buildStep.inputId.package;
      await buildStep.writeAsString(
          buildStep.inputId.changeExtension('.exports'), annotated.join(','));
    }
  }
}
