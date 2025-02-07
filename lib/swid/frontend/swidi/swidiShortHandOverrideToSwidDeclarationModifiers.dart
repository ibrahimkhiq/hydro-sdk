import 'package:hydro_sdk/swid/frontend/swidi/ast/swidiConst.dart';
import 'package:hydro_sdk/swid/ir/swidDeclarationModifiers.dart';

SwidDeclarationModifiers swidiShortHandOverrideToSwidDeclarationModifiers({
  required final SwidiConst shortHandOverride,
}) =>
    SwidDeclarationModifiers.clone(
      declarationModifiers: SwidDeclarationModifiers.empty(),
      overridenTransforms: shortHandOverride
          .maybeWhen(
            fromSwidiConstMap: (val) => val.entries
                .map(
                  (x) => StringTuple(
                    item1: x.item1.maybeWhen(
                      fromSwidiConstString: (val) => val.value,
                      orElse: () => "",
                    ),
                    item2: x.item2.maybeWhen(
                      fromSwidiConstString: (val) => val.value,
                      orElse: () => "",
                    ),
                  ),
                )
                .toList(),
            orElse: () => [
              StringTuple(
                item1: "",
                item2: "",
              ),
            ],
          )
          .where(
            (x) => x.item1 != "" && x.item2 != "",
          )
          .toList(),
      ignoredTransforms: shortHandOverride
          .maybeWhen(
            fromSwidiConstMap: (val) => val.entries
                .map((x) => x.item2.maybeWhen(
                      fromSwidiConstBoolean: (val) => val.maybeWhen(
                        fromSwidiConstBooleanFalse: (_) => x.item1.maybeWhen(
                          fromSwidiConstString: (val) => val.value,
                          orElse: () => "",
                        ),
                        orElse: () => "",
                      ),
                      orElse: () => "",
                    ))
                .toList(),
            orElse: () => [
              "",
            ],
          )
          .where((x) => x != "")
          .toList(),
    );
