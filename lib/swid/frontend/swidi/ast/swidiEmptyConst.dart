import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hydro_sdk/swid/util/hashComparableMixin.dart';
import 'package:hydro_sdk/swid/util/hashKeyMixin.dart';

part 'swidiEmptyConst.freezed.dart';

@freezed
class SwidiEmptyConst
    with
        _$SwidiEmptyConst,
        HashKeyMixin<SwidiEmptyConst>,
        HashComparableMixin<SwidiEmptyConst> {
  SwidiEmptyConst._();

  factory SwidiEmptyConst() = _$SwidiEmptyConstCtor;

  @override
  List<int> get hashableParts => [
        0,
      ];

  @override
  SwidiEmptyConst clone() => SwidiEmptyConst();
}
