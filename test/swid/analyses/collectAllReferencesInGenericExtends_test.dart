import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/ir/swidDeclarationModifiers.dart';
import 'package:hydro_sdk/swid/ir/swidInterface.dart';
import 'package:hydro_sdk/swid/ir/swidNullabilitySuffix.dart';
import 'package:hydro_sdk/swid/ir/swidReferenceDeclarationKind.dart';
import 'package:hydro_sdk/swid/ir/swidType.dart';
import 'package:hydro_sdk/swid/ir/swidTypeFormal.dart';
import 'package:hydro_sdk/swid/ir/util/collectAllReferences.dart';

void main() {
  LiveTestWidgetsFlutterBinding();
  testWidgets('', (WidgetTester tester) async {
    final ir = SwidClass(
      name: "SplayTreeSet",
      nullabilitySuffix: SwidNullabilitySuffix.none,
      originalPackagePath: "dart:collection",
      constructorType: null,
      factoryConstructors: [],
      staticMethods: [],
      methods: [],
      staticConstFieldDeclarations: [],
      instanceFieldDeclarations: {},
      declarationModifiers: SwidDeclarationModifiers.empty(),
      extendedClass: SwidClass(
        name: "_SplayTree<E, _SplayTreeSetNode<E>>",
        nullabilitySuffix: SwidNullabilitySuffix.none,
        originalPackagePath: "dart:collection",
        constructorType: null,
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
            value: SwidTypeFormalValue.fromSwidInterface(
              swidInterface: SwidInterface(
                name: "E",
                nullabilitySuffix: SwidNullabilitySuffix.none,
                originalPackagePath: "dart:collection",
                typeArguments: [],
                referenceDeclarationKind:
                    SwidReferenceDeclarationKind.typeParameterType,
                declarationModifiers: SwidDeclarationModifiers.empty(),
              ),
            ),
            swidReferenceDeclarationKind:
                SwidReferenceDeclarationKind.typeParameterType,
          ),
          SwidTypeFormal(
            value: SwidTypeFormalValue.fromSwidClass(
              swidClass: SwidClass(
                name: "_SplayTreeSetNode<E>",
                nullabilitySuffix: SwidNullabilitySuffix.none,
                originalPackagePath: "dart:collection",
                constructorType: null,
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
                    value: SwidTypeFormalValue.fromSwidInterface(
                      swidInterface: SwidInterface(
                        name: "E",
                        nullabilitySuffix: SwidNullabilitySuffix.none,
                        originalPackagePath: "dart:collection",
                        typeArguments: [],
                        referenceDeclarationKind:
                            SwidReferenceDeclarationKind.typeParameterType,
                        declarationModifiers: SwidDeclarationModifiers.empty(),
                      ),
                    ),
                    swidReferenceDeclarationKind:
                        SwidReferenceDeclarationKind.typeParameterType,
                  ),
                ],
              ),
            ),
            swidReferenceDeclarationKind:
                SwidReferenceDeclarationKind.typeParameterType,
          ),
        ],
      ),
      mixedInClasses: [
        SwidClass(
          name: "IterableMixin<E>",
          nullabilitySuffix: SwidNullabilitySuffix.none,
          originalPackagePath: "dart:collection",
          constructorType: null,
          factoryConstructors: [],
          staticMethods: [],
          methods: [],
          staticConstFieldDeclarations: [],
          instanceFieldDeclarations: {},
          declarationModifiers: SwidDeclarationModifiers.empty(),
          mixedInClasses: [],
          implementedClasses: [],
          isMixin: false,
          typeFormals: [],
        ),
        SwidClass(
          name: "SetMixin<E>",
          nullabilitySuffix: SwidNullabilitySuffix.none,
          originalPackagePath: "dart:collection",
          constructorType: null,
          factoryConstructors: [],
          staticMethods: [],
          methods: [],
          staticConstFieldDeclarations: [],
          instanceFieldDeclarations: {},
          declarationModifiers: SwidDeclarationModifiers.empty(),
          mixedInClasses: [],
          implementedClasses: [],
          isMixin: false,
          typeFormals: [],
        ),
      ],
      implementedClasses: [],
      isMixin: false,
      typeFormals: [
        SwidTypeFormal(
          value: SwidTypeFormalValue.fromString(
            string: "E",
          ),
          swidReferenceDeclarationKind:
              SwidReferenceDeclarationKind.typeParameterType,
        )
      ],
    );

    final withFirstOrderSuperClassReferences = collectAllReferences(
      includeFirstOrderSuperClassReferences: true,
      swidType: SwidType.fromSwidClass(
        swidClass: ir,
      ),
    );

    expect(
      withFirstOrderSuperClassReferences.firstWhereOrNull(
          (x) => x.name == "_SplayTree<E, _SplayTreeSetNode<E>>"),
      isNotNull,
    );
    expect(
      withFirstOrderSuperClassReferences
          .firstWhereOrNull((x) => x.name == "_SplayTreeSetNode<E>"),
      isNotNull,
    );
    expect(
      withFirstOrderSuperClassReferences
          .firstWhereOrNull((x) => x.name == "IterableMixin<E>"),
      isNotNull,
    );
    expect(
      withFirstOrderSuperClassReferences
          .firstWhereOrNull((x) => x.name == "SetMixin<E>"),
      isNotNull,
    );

    final withoutFirstOrderSuperClassReferences = collectAllReferences(
      swidType: SwidType.fromSwidClass(
        swidClass: ir,
      ),
    );

    expect(
      withoutFirstOrderSuperClassReferences.firstWhereOrNull(
          (x) => x.name == "_SplayTree<E, _SplayTreeSetNode<E>>"),
      isNotNull,
    );
    expect(
      withoutFirstOrderSuperClassReferences
          .firstWhereOrNull((x) => x.name == "IterableMixin<E>"),
      isNotNull,
    );
    expect(
      withoutFirstOrderSuperClassReferences
          .firstWhereOrNull((x) => x.name == "SetMixin<E>"),
      isNotNull,
    );
  }, tags: "swid");
}
