import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/ir/swidFunctionType.dart';
import 'package:hydro_sdk/swid/ir/swidInterface.dart';
import 'package:hydro_sdk/swid/ir/swidReferenceDeclarationKind.dart';
import 'package:hydro_sdk/swid/ir/swidType.dart';
import 'package:hydro_sdk/swid/util/hashComparableMixin.dart';
import 'package:hydro_sdk/swid/util/hashKeyMixin.dart';
import 'package:hydro_sdk/swid/util/iCopyable.dart';

part 'swidTypeFormal.freezed.dart';
part 'swidTypeFormal.g.dart';

@freezed
class SwidTypeFormalValue
    with
        _$SwidTypeFormalValue,
        HashKeyMixin<SwidTypeFormalValue>,
        HashComparableMixin<SwidTypeFormalValue> {
  SwidTypeFormalValue._();

  factory SwidTypeFormalValue.fromString({
    required final String string,
  }) = _$FromString;

  factory SwidTypeFormalValue.fromSwidClass({
    required final SwidClass swidClass,
  }) = _$FromSwidClass;

  factory SwidTypeFormalValue.fromSwidInterface({
    required final SwidInterface swidInterface,
  }) = _$FromSwidInterface;

  factory SwidTypeFormalValue.fromSwidFunctionType({
    required final SwidFunctionType swidFunctionType,
  }) = _$FromSwidFunctionType;

  factory SwidTypeFormalValue.clone({
    required final SwidTypeFormalValue swidTypeFormalValue,
  }) =>
      swidTypeFormalValue.when(
        fromString: (val) => SwidTypeFormalValue.fromString(string: val),
        fromSwidClass: (val) => SwidTypeFormalValue.fromSwidClass(
          swidClass: val,
        ),
        fromSwidInterface: (val) => SwidTypeFormalValue.fromSwidInterface(
          swidInterface: val,
        ),
        fromSwidFunctionType: (val) => SwidTypeFormalValue.fromSwidFunctionType(
          swidFunctionType: val,
        ),
      );

  factory SwidTypeFormalValue.fromJson(Map<String, dynamic> json) =>
      _$SwidTypeFormalValueFromJson(json);

  @override
  late final List<int> hashableParts = when(
    fromString: (val) => val.hashableParts,
    fromSwidClass: (val) => val.hashableParts,
    fromSwidInterface: (val) => val.hashableParts,
    fromSwidFunctionType: (val) => val.hashableParts,
  );

  String get name => when(
        fromString: (val) => val,
        fromSwidClass: (val) => val.name,
        fromSwidInterface: (val) => val.name,
        fromSwidFunctionType: (val) => val.name,
      );

  String get displayName => when(
        fromString: (val) => val,
        fromSwidClass: (val) =>
            SwidType.fromSwidClass(swidClass: val).displayName,
        fromSwidInterface: (val) =>
            SwidType.fromSwidInterface(swidInterface: val).displayName,
        fromSwidFunctionType: (val) =>
            SwidType.fromSwidFunctionType(swidFunctionType: val).displayName,
      );

  @override
  SwidTypeFormalValue clone() => SwidTypeFormalValue.clone(
        swidTypeFormalValue: this,
      );
}

@freezed
class SwidTypeFormal
    with
        _$SwidTypeFormal,
        HashKeyMixin<SwidTypeFormal>,
        HashComparableMixin<SwidTypeFormal>
    implements
        ICopyable<SwidTypeFormal, $SwidTypeFormalCopyWith<SwidTypeFormal>> {
  SwidTypeFormal._();

  factory SwidTypeFormal({
    required final SwidTypeFormalValue value,
    required final SwidReferenceDeclarationKind swidReferenceDeclarationKind,
  }) = _$Data;

  factory SwidTypeFormal.fromJson(Map<String, dynamic> json) =>
      _$SwidTypeFormalFromJson(json);

  factory SwidTypeFormal.clone({
    required final SwidTypeFormal swidTypeFormal,
    final SwidTypeFormalValue? value,
    final SwidReferenceDeclarationKind? swidReferenceDeclarationKind,
  }) =>
      SwidTypeFormal(
        value: value ??
            SwidTypeFormalValue.clone(
                swidTypeFormalValue: swidTypeFormal.value),
        swidReferenceDeclarationKind: swidReferenceDeclarationKind ??
            swidTypeFormal.swidReferenceDeclarationKind,
      );

// changing all hashableparts in ir to late final took 194.4s to produce translation units
// TransformFunctionTypeToTs and TransformTypeDeclarationToTs seem to be taking the most time to build hashableParts

// Producing Typescript and Dart translation units from classes... 66.3s
// with TransformTypeDeclarationToTs and TransformTypeDeclarationToTs using hashkey.hashableParts wherever possible

// Producing Typescript and Dart translation units from classes... 60.8s
// with ResolveTsImportPaths and TransformPrimitiveNamesToTs using hashKey.hashableParts
  @override
  late final List<int> hashableParts = [
    ...value.hashableParts,
    swidReferenceDeclarationKind.index,
  ];

  @override
  SwidTypeFormal clone({
    final SwidTypeFormalValue? value,
    final SwidReferenceDeclarationKind? swidReferenceDeclarationKind,
  }) =>
      SwidTypeFormal.clone(
        swidTypeFormal: this,
        value: value,
        swidReferenceDeclarationKind: swidReferenceDeclarationKind,
      );
}
