import 'package:build/build.dart';
import 'package:glob/glob.dart';

/// the ExportsBuilder will create the file to
/// export all dart files
class ExportsBuilder implements Builder {
  @override
  Map<String, List<String>> get buildExtensions {
    return {
      r'$lib$': ['export.dart']
    };
  }

  static var packageName = "export";
  @override
  Future<void> build(BuildStep buildStep) async {
    final exports = buildStep.findAssets(Glob('**/*.exports'));

    final expList = <String>[];
    final content = ["// GENERATED CODE - DO NOT MODIFY BY HAND", "", ""];
    await for (var exportLibrary in exports) {
      final export_uri = exportLibrary.changeExtension('.dart').uri;
      if (export_uri.toString().substring(0, 5) != "asset") {
        if (export_uri.toString() != 'package:$packageName/$packageName.dart') {
          final expStr = "export '$export_uri';";
          expList.add(expStr);

          if (content[2] == "") {
            packageName = expStr.split("/")[0].split(":")[1];
            content[2] = "// " + packageName;
          }
        }
      }
    }

    content.addAll(expList);
    if (content.isNotEmpty) {
      await buildStep.writeAsString(
          AssetId(buildStep.inputId.package, 'lib/export.dart'),
          content.join('\n'));
    }
  }
}
