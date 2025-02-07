import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:hydro_sdk/swid/backend/dart/dartVmManagedClassDeclaration.dart';
import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/swars/cachingPipeline.dart';
import 'package:hydro_sdk/swid/swars/pipelineNoopCacheMgr.dart';

void main() {
  LiveTestWidgetsFlutterBinding();
  testWidgets('', (WidgetTester tester) async {
    var diagnosticPropertiesBuilderClass = SwidClass.fromJson(json.decode(
        File("test/swid/res/DiagnosticPropertiesBuilder.json")
            .readAsStringSync()));

    expect(
        CachingPipeline(
          cacheMgr: const PipelineNoopCacheMgr(),
        ).reduceFromTerm(
          DartVMManagedClassDeclaration(
              swidClass: diagnosticPropertiesBuilderClass),
        ),
        """
class VMManagedDiagnosticPropertiesBuilder
    extends VMManagedBox<DiagnosticPropertiesBuilder> {
  VMManagedDiagnosticPropertiesBuilder(
      {required this.table, required this.vmObject, required this.hydroState})
      : super(
          table: table,
          vmObject: vmObject,
          hydroState: hydroState,
        ) {
    table[\'properties\'] = maybeBoxObject<List<dynamic>>(
        object: vmObject.properties,
        hydroState: hydroState,
        table: HydroTable());
    table[\'defaultDiagnosticsTreeStyle\'] =
        DiagnosticsTreeStyle.values.indexWhere((x) {
      return x == vmObject.defaultDiagnosticsTreeStyle;
    });
    table[\'emptyBodyDescription\'] = vmObject.emptyBodyDescription;
    table[\'add\'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
      vmObject.add(maybeUnBoxAndBuildArgument<DiagnosticsNode, dynamic>(
          luaCallerArguments[1],
          parentState: hydroState));
      return [];
    });
  }

  final HydroTable table;

  final HydroState hydroState;

  final DiagnosticPropertiesBuilder vmObject;
}
""");
  }, tags: "swid");
}
