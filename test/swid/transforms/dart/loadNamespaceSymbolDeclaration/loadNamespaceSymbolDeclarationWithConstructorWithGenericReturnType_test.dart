import 'package:flutter_test/flutter_test.dart';

import 'package:hydro_sdk/swid/backend/dart/dartLoadNamespaceSymbolDeclaration.dart';
import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/ir/swidDeclarationModifiers.dart';
import 'package:hydro_sdk/swid/ir/swidFunctionType.dart';
import 'package:hydro_sdk/swid/ir/swidInterface.dart';
import 'package:hydro_sdk/swid/ir/swidNullabilitySuffix.dart';
import 'package:hydro_sdk/swid/ir/swidReferenceDeclarationKind.dart';
import 'package:hydro_sdk/swid/ir/swidType.dart';
import 'package:hydro_sdk/swid/ir/swidTypeFormal.dart';
import 'package:hydro_sdk/swid/swars/cachingPipeline.dart';
import 'package:hydro_sdk/swid/swars/pipelineNoopCacheMgr.dart';

void main() {
  LiveTestWidgetsFlutterBinding();
  testWidgets('', (WidgetTester tester) async {
    final ir = SwidClass(
      name: "MapView",
      nullabilitySuffix: SwidNullabilitySuffix.none,
      originalPackagePath: "dart:collection",
      constructorType: SwidFunctionType(
        name: "",
        nullabilitySuffix: SwidNullabilitySuffix.none,
        originalPackagePath: "",
        namedParameterTypes: {},
        namedDefaults: {},
        normalParameterNames: ["map"],
        normalParameterTypes: [
          SwidType.fromSwidInterface(
            swidInterface: SwidInterface(
              name: "Map",
              nullabilitySuffix: SwidNullabilitySuffix.none,
              originalPackagePath: "dart:core",
              typeArguments: [
                SwidType.fromSwidInterface(
                  swidInterface: SwidInterface(
                    name: "K",
                    declarationModifiers: SwidDeclarationModifiers.empty(),
                    nullabilitySuffix: SwidNullabilitySuffix.none,
                    originalPackagePath: "",
                    referenceDeclarationKind:
                        SwidReferenceDeclarationKind.typeParameterType,
                    typeArguments: [],
                  ),
                ),
                SwidType.fromSwidInterface(
                  swidInterface: SwidInterface(
                    name: "V",
                    declarationModifiers: SwidDeclarationModifiers.empty(),
                    nullabilitySuffix: SwidNullabilitySuffix.none,
                    originalPackagePath: "",
                    referenceDeclarationKind:
                        SwidReferenceDeclarationKind.typeParameterType,
                    typeArguments: [],
                  ),
                ),
              ],
              referenceDeclarationKind:
                  SwidReferenceDeclarationKind.classElement,
              declarationModifiers: SwidDeclarationModifiers.empty(),
            ),
          ),
        ],
        optionalParameterNames: [],
        optionalParameterTypes: [],
        returnType: SwidType.fromSwidInterface(
          swidInterface: SwidInterface(
            name: "MapView<K, V>",
            nullabilitySuffix: SwidNullabilitySuffix.none,
            originalPackagePath: "dart:collection",
            typeArguments: [
              SwidType.fromSwidInterface(
                swidInterface: SwidInterface(
                  name: "K",
                  nullabilitySuffix: SwidNullabilitySuffix.none,
                  originalPackagePath: "dart:collection",
                  typeArguments: [],
                  referenceDeclarationKind:
                      SwidReferenceDeclarationKind.typeParameterType,
                  declarationModifiers: SwidDeclarationModifiers.empty(),
                ),
              ),
              SwidType.fromSwidInterface(
                swidInterface: SwidInterface(
                  name: "V",
                  nullabilitySuffix: SwidNullabilitySuffix.none,
                  originalPackagePath: "dart:collection",
                  typeArguments: [],
                  referenceDeclarationKind:
                      SwidReferenceDeclarationKind.typeParameterType,
                  declarationModifiers: SwidDeclarationModifiers.empty(),
                ),
              ),
            ],
            referenceDeclarationKind: SwidReferenceDeclarationKind.classElement,
            declarationModifiers: SwidDeclarationModifiers.empty(),
          ),
        ),
        isFactory: false,
        typeFormals: [],
        declarationModifiers: SwidDeclarationModifiers.empty(),
      ),
      factoryConstructors: [],
      staticMethods: [],
      methods: [],
      staticConstFieldDeclarations: [],
      instanceFieldDeclarations: {},
      declarationModifiers: SwidDeclarationModifiers.empty(),
      mixedInClasses: [],
      implementedClasses: [],
      isMixin: false,
      typeFormals: [
        SwidTypeFormal(
          value: SwidTypeFormalValue.fromString(
            string: "K",
          ),
          swidReferenceDeclarationKind:
              SwidReferenceDeclarationKind.typeParameterType,
        ),
        SwidTypeFormal(
          value: SwidTypeFormalValue.fromString(
            string: "V",
          ),
          swidReferenceDeclarationKind:
              SwidReferenceDeclarationKind.typeParameterType,
        ),
      ],
    );

    final res = CachingPipeline(
      cacheMgr: const PipelineNoopCacheMgr(),
    ).reduceFromTerm(
      DartLoadNamespaceSymbolDeclaration(
        swidClass: ir,
      ),
    );

    expect(res, """
void loadMapView({required HydroState hydroState, required HydroTable table}) {
  table['mapView'] = makeLuaDartFunc(func: (List<dynamic> luaCallerArguments) {
    return [
      RTManagedMapView(
          maybeUnBoxAndBuildArgument<Map<dynamic, dynamic>, dynamic>(
              luaCallerArguments[1],
              parentState: hydroState),
          table: luaCallerArguments[0],
          hydroState: hydroState)
    ];
  });
  registerBoxer<MapView>(boxer: (
      {required MapView vmObject,
      required HydroState hydroState,
      required HydroTable table}) {
    return VMManagedMapView(
        vmObject: vmObject, hydroState: hydroState, table: table);
  });
}
""");
  }, tags: "swid");
}
