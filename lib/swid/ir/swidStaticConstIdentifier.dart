import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hydro_sdk/swid/ir/swidType.dart';
import 'package:hydro_sdk/swid/util/hashComparableMixin.dart';
import 'package:hydro_sdk/swid/util/hashKeyMixin.dart';
import 'package:hydro_sdk/swid/util/iCopyable.dart';

part 'swidStaticConstIdentifier.freezed.dart';
part 'swidStaticConstIdentifier.g.dart';

@freezed
class SwidStaticConstIdentifier
    with
        _$SwidStaticConstIdentifier,
        HashKeyMixin<SwidStaticConstIdentifier>,
        HashComparableMixin<SwidStaticConstIdentifier>
    implements
        ICopyable<SwidStaticConstIdentifier,
            $SwidStaticConstIdentifierCopyWith<SwidStaticConstIdentifier>> {
  SwidStaticConstIdentifier._();

  factory SwidStaticConstIdentifier({
    required final String identifier,
    required final SwidType enclosingType,
  }) = _$SwidStaticConstIdentifierCtor;

  factory SwidStaticConstIdentifier.fromJson(Map<String, dynamic> json) =>
      _$SwidStaticConstIdentifierFromJson(json);

  factory SwidStaticConstIdentifier.clone({
    required final SwidStaticConstIdentifier swidStaticConstIdentifier,
    final String? identifier,
    final SwidType? enclosingType,
  }) =>
      SwidStaticConstIdentifier(
        identifier: identifier ?? swidStaticConstIdentifier.identifier,
        enclosingType: enclosingType ?? swidStaticConstIdentifier.enclosingType,
      );

  @override
  late final List<int> hashableParts = [
    ...identifier.hashableParts,
    ...enclosingType.hashableParts,
  ];

  @override
  SwidStaticConstIdentifier clone({
    final String? identifier,
    final SwidType? enclosingType,
  }) =>
      SwidStaticConstIdentifier.clone(
        swidStaticConstIdentifier: this,
        identifier: identifier,
        enclosingType: enclosingType,
      );
}
