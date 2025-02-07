import 'package:collection/collection.dart' show IterableExtension;

import 'package:hydro_sdk/swid/backend/util/requiresDartBinding.dart';
import 'package:hydro_sdk/swid/ir/swidClass.dart';
import 'package:hydro_sdk/swid/ir/util/isInexpressibleStaticConst.dart';

bool requiresDartClassTranslationUnit({
  required final SwidClass swidClass,
}) =>
    swidClass.name[0] != "_" &&
    swidClass.originalPackagePath != "dart:_internal" &&
    (requiresDartBinding(swidClass: swidClass) ||
        swidClass.isConstructible() ||
        swidClass.methods.isNotEmpty ||
        swidClass.instanceFieldDeclarations.isNotEmpty ||
        swidClass.staticConstFieldDeclarations.firstWhereOrNull(
              (x) => isInexpressibleStaticConst(
                parentClass: swidClass,
                staticConst: x.value,
              ),
            ) !=
            null);
