library auto_exporter;

import 'package:build/build.dart';

import 'src/ExporterGeneratorBuilder.dart';
import 'src/ExportsBuilder.dart';

/// return the ExporterGeneratorBuilder
Builder exporterGeneratorBuilder(BuilderOptions options) {
  return ExporterGeneratorBuilder();
}

/// return the ExportsBuilder
Builder exportsBuilder(BuilderOptions options) {
  return ExportsBuilder();
}
