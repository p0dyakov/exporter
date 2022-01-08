import 'dart:async';

import 'package:build/build.dart';
import 'package:glob/glob.dart';

// ignore: public_member_api_docs
class ExportsBuilder implements Builder {
  @override
  // ignore: type_annotate_public_apis
  final buildExtensions = const {
    r'$lib$': ['.dart']
  };
  var packageName = "main";
  @override
  Future<void> build(BuildStep buildStep) async {
    final exports = buildStep.findAssets(Glob('**/*.exports'));

    final expList = <String>[];
    final content = ["// GENERATED CODE - DO NOT MODIFY BY HAND", "", ""];
    await for (var exportLibrary in exports) {
      final expStr = "export '${exportLibrary.changeExtension('.dart').uri}';";
      expList.add(expStr);
      if (content[2] == "") {
        packageName = expStr.split("/")[0].split(":")[1];
        content[2] = "// " + packageName;
      }
    }

    content.addAll(expList);
    if (content.isNotEmpty) {
      await buildStep.writeAsString(
          AssetId(buildStep.inputId.package, 'lib/$packageName.dart'),
          content.join('\n'));
    }
  }
}
